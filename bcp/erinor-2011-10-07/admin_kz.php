<?php
/*admin skript*/
function getFlags($flagvar){
   $flags["historie"] = (bool) (($flagvar & 1) > 0);
   $flags["ramec"] = (bool) (($flagvar & (1 << 1)) > 0);
   $flags["volna"] = (bool) (($flagvar & (1 << 2)) > 0);
   $flags["druhapostava"] = (bool) (($flagvar & (1 << 3)) > 0);
   return $flags;
}
function setFlags($flags){
   $flagvar = 0;
   $flagvar += (int) $flags["historie"] * 1;
   $flagvar += (int) $flags["ramec"] * (1 << 1);
   $flagvar += (int) $flags["volna"] * (1 << 2);
   $flagvar += (int) $flags["druhapostava"] * (1 << 3);
   //echo $flagvar;
   return $flagvar;
}
function printFlags($flagvar){
   $fl = getFlags($flagvar);
   $str = "";
   if($fl["historie"]) $str .= "H ";
   if($fl["ramec"]) $str .= "R ";
   if($fl["volna"]) $str .= "V ";
   if($fl["druhapostava"]) $str .= "D ";
   return $str;
}
/*
$flags["historie"] = true;
$flags["ramec"] = false;
$flags["volna"] = true;
$flags["druhapostava"] = true;

$fs = setFlags($flags);
$f = getflags($fs);
var_dump($f);
*/

session_start();
header("Content-Type: text/html; charset=utf-8");
function prihlasen(){
   if(isset($_SESSION['erinor']['login']) && $_SESSION['erinor']['login'] === 1)
      return TRUE;
   return FALSE;
}

$prihlasen = prihlasen();

require_once "lib/sql.class.php";
require_once 'lib/Swift/swift_required.php';
require_once 'lib/hlavni.const.php';

$transport = Swift_SmtpTransport::newInstance('smtp.email.cz', 25)
  ->setUsername('erinor@email.cz')
  ->setPassword('Eryene')
  ;
$mailer = Swift_Mailer::newInstance($transport);
  
//Send the message



//INSTALACE ERINOR DB

$psql = array(
    "host" => DBSERVER_ADDR,
    "uzivatel" => DB_USER,
    "heslo" => DB_PASS,
    "databaze" => DB_NAME,
    "port" => DB_PORT
);
$db = new Sql($psql);

$msg = "";
$status = 0;
$pohl[1] = "M/Ž";
$pohl[] = "M";
$pohl[] = "Ž";

$strid[] = "sudy";
$strid[] = "lichy";

if($prihlasen){
   $status = 1;
   if(isset($_GET['action']) && $_GET['action'] === "logout"){
      unset($_SESSION['erinor']);
      session_destroy();
      $status = 0;
   }
   elseif(isset($_GET['action']) && $_GET['action'] === "adds"){
      $nahledy = $db->dotaz("
         SELECT
            p.id, p.pohlavi, p.jmeno, p.popis
         FROM
            erinor.kz_postavy_skritci p;
      ");
      $nahledu = 0;
      if($nahledy){
         $db->outPole($nahledy, $outNahledy);
         $nahledu = 1;
      }
      if(!empty($_POST['add'])){
         if(
            empty($_POST['jmeno']) ||
            empty($_POST['pohlavi']) ||
            empty($_POST['popis'])
         ){
            $msg="Přidání postavy selhalo. Vyplňte pole.";
         }
         else{
            $o = $db->dotaz("
               INSERT INTO
                  erinor.kz_postavy_skritci
                  (jmeno, pohlavi, popis)
               VALUES
                  ('".$_POST['jmeno']."', ".$_POST['pohlavi'].", '".$_POST['popis']."')
               ;
            ");
            if($o)
               $msg = "Postava skřítka přidána.";
            else
               $msg = "Chyba.";
         }
      }
      
   }
   elseif(isset($_GET['action']) && $_GET['action'] === "con"){
      $jmeno_postavy = "";
      $nahledy = $db->dotaz("
         SELECT
            p.jmeno as jmeno_postavy, pr.id, pr.email, pr.prezdivka, pr.poznamka, pr.schvaleno, (SELECT jmeno FROM erinor.kz_postavy_skritci WHERE id=pr.druhapostava) AS skritek
         FROM
            erinor.kz_postavy p, erinor.kz_prihlasky pr
         WHERE pr.id_postavy = p.id
         ORDER BY id_postavy, pr.cas ASC
         ;
      ");
      $db->outPole($nahledy, $outNahledy);
      $nahledyGeneric = $db->dotaz("
         SELECT
             z.nazev as jmenoskupiny, pr.id, pr.email, pr.prezdivka, pr.poznamka, pr.vyreseno, (SELECT jmeno FROM erinor.kz_postavy_skritci WHERE id=pr.druhapostava) AS skritek
         FROM
            erinor.kz_prihlasky_generic pr, erinor.kz_zajmoveskupiny z
         WHERE pr.id_zajmoveskupiny = z.id
         ORDER BY pr.cas ASC
         ;
      ");
      $db->outPole($nahledyGeneric, $outNahledyGeneric);
      if(!empty($_POST['con'])){
         if($_POST['con'] == "Schválit"){
            $ch = FALSE;
            foreach($_POST['vyber'] as $prihlaska){
               $succ = $db->dotaz("
                  UPDATE erinor.kz_prihlasky
                  SET schvaleno='t'
                  WHERE id=".(int) $prihlaska.";
               ");
               if(!$succ) $ch = TRUE;
               else{
                  $succ = $db->dotaz("
                     SELECT
                        pr.email, p.jmeno
                     FROM
                        erinor.kz_prihlasky pr, erinor.kz_postavy p
                     WHERE pr.id=".(int) $prihlaska." AND pr.id_postavy=p.id;
                  ");
                  $email = $db->ziskejPole($succ);
                  //var_dump($email);
                  $message = Swift_Message::newInstance('Erinor - Přihlášení na Kočičí zaklínání')
                  ->setFrom(array('erinor@email.cz' => 'Organizace Erinoru'))
                  ->setTo(array($email['email']))
                  ->setBody('Přihláška za postavu \''.$email['jmeno'].'\' byla přijata.\n Org tým - Kořen, Terka, Pilly, Balda')
                  ;
                  
                  $result = $mailer->send($message);
                  if(!$result) $ch = TRUE;
               }
            }
            if($ch) $msg = "Chyba: Ne všechna data změněna.";
            else $msg = "Úspěšně nastaveno.";
         }
         elseif($_POST['con'] == "Vyřešit"){
            $ch = FALSE;
            foreach($_POST['vyber'] as $prihlaska){
               $succ = $db->dotaz("
                  UPDATE erinor.kz_prihlasky_generic
                  SET vyreseno='t'
                  WHERE id=".(int) $prihlaska.";
               ");
               if(!$succ) $ch = TRUE;
               else{
                  $succ = $db->dotaz("
                     SELECT
                        pr.email, s.nazev
                     FROM
                        erinor.kz_prihlasky_generic pr, erinor.kz_zajmoveskupiny s
                     WHERE pr.id=".(int) $prihlaska." AND pr.id_zajmoveskupiny=s.id;
                  ");
                  $email = $db->ziskejPole($succ);
                  //var_dump($email);
                  $message = Swift_Message::newInstance('Erinor - Přihlášení na Kočičí zaklínání')
                  ->setFrom(array('erinor@email.cz' => 'Organizace Erinoru'))
                  ->setTo(array($email['email']))
                  ->setBody('Přihláška za člena skupiny \''.$email['nazev'].'\' byla přijata.\n Org tým - Kořen, Terka, Pilly, Balda')
                  ;
                  
                  $result = $mailer->send($message);
                  if(!$result) $ch = TRUE;
               }
            }
            if($ch) $msg = "Chyba: Ne všechna data změněna.";
            else $msg = "Úspěšně nastaveno.";
         }
      }
   }
   elseif(isset($_GET['action']) && $_GET['action'] === "add"){
      $nahledy = $db->dotaz("
         SELECT
            p.id, p.pohlavi, z.nazev AS zajmovaskupina, p.jmeno, p.popis, p.flagy
         FROM
            erinor.kz_postavy p, erinor.kz_zajmoveskupiny z
         WHERE p.id_zajmoveskupiny = z.id;
      ");
      $nahledu = 0;
      if($nahledy){
         $db->outPole($nahledy, $outNahledy);
         $nahledu = 1;
      }
      $kategorie = $db->dotaz("
         SELECT
            id, nazev
         FROM
            erinor.kz_zajmoveskupiny
         ORDER BY strop DESC;
      ");
      if($kategorie){
         $db->outPole($kategorie, $outKategorie);
      }
      if(!empty($_POST['add'])){
         if(
            empty($_POST['jmeno']) ||
            empty($_POST['pohlavi']) ||
            empty($_POST['popis'])
         ){
            $msg="Přidání postavy selhalo. Vyplňte pole.";
         }
         else{
            $o = $db->dotaz("
               INSERT INTO
                  erinor.kz_postavy
                  (jmeno, pohlavi, popis, id_zajmoveskupiny, flagy)
               VALUES
                  ('".$_POST['jmeno']."', ".$_POST['pohlavi'].", '".$_POST['popis']."', ".$_POST['zajmovaskupina'].", ".(int)($_POST['predepsanost']+$_POST['druhapostava']).")
               ;
            ");
            if($o)
               $msg = "Postava přidána.";
            else
               $msg = "Chyba.";
         }
      }
   }
}
else{
   if(!isset($_POST['login'])){
      $msg = "Přihlašte se, prosím.";
   }
   else if($_POST['login'] != "KZ201109"){
      $msg = "Nesprávné heslo.";
   }
   else{
      $msg = "Přihlášení úspěšné.";
      $_SESSION['erinor']['login'] = 1;
      $status = 1;
   }
}
$n = 1;
?>
<html>
<head>
<title>Admin Erinor lite 0.0.1</title>
<style type="text/css">

table.nahledova{
   background-color: #000;
   width: 100%;
}
table.nahledova th{
   color: #fff;
}
tr.lichy td{
   background-color: #777777;
}
tr.sudy td{
   background-color: #B3B3B3;
}
tr.postava th{
   text-align: left;
}
</style>
</head>
<body>
<h1>Admin Erinor lite 0.0.1</h1>
<?=$msg;?> <br>
<?php if($status === 0): ?>
<form method="POST">
<input type="password" id="login" name="login">
</form>
<? else: ?>
<p>

<a href="?action=add">Přidávání postav</a> | <a href="?action=adds">Přidávání skřítků</a> | <a href="?action=con">Schvalování přihlášek</a> | <a href="?action=logout">Odhlásit</a>
</p>
<? endif; ?>
<?php if($_GET['action'] === "add"):?>
   <?php if($nahledu === 1): ?>
   <table cellspacing="1" class="nahledova">
   <tr><th>&nbsp;</th><th>ID</th><th>Jméno</th><th>Pohlaví</th><th>Popis</th><th>Zájmová skupina</th><th>Značky</th></tr>
      <?php foreach($outNahledy as $nahled): ?>
         <tr class="<?=$strid[($n%2)];?>"><td><?=$n;?>.</td><td><?=$nahled['id'];?></td><td><?=$nahled['jmeno'];?></td><td><?=$pohl[(int)$nahled['pohlavi']];?></td><td><?=$nahled['popis'];?></td><td><?=$nahled['zajmovaskupina'];?></td><td><?=printFlags($nahled['flagy']);?></td></tr>
      <?
         $n++;
         endforeach;
      ?>
   </table>
   <?php endif; ?>
   <form method="POST">
   <table>
   <tr><td>Jméno:</td><td><input type="text" name="jmeno"></td></tr>
   <tr><td>Pohlaví:</td>
      <td>
         <select name="pohlavi">
            <option value="1">M/Ž</option>
            <option value="2">M</option>
            <option value="3">Ž</option>
         </select>
      </td>
   </tr>
   <tr><td>Popis:</td><td><textarea name="popis" cols="50" rows="10"></textarea></td></tr>
   <tr><td>Zájmová skupina:</td>
      <td>
         <select name="zajmovaskupina">
         <?php foreach($outKategorie as $kat): ?>
            <option value="<?=$kat['id'];?>"><?=$kat['nazev'];?></option>
         <?php endforeach; ?>
         </select>
      </td>
   </tr>
   <tr><td>Předepsanost:</td>
      <td>
         <select name="predepsanost">
            <option value="4">Volná</option>
            <option value="2">S rámcem</option>
            <option value="1">S historií</option>
         </select>
      </td>
   </tr>
   <tr><td>Druhá postava:</td>
      <td>
         <select name="druhapostava">
            <option value="0">Ne</option>
            <option value="8">Ano</option>
         </select>
      </td>
   </tr>
   </table>
   <input type="submit" value="Přidat postavu" name="add">
   </form>
<?php elseif($_GET['action'] === "adds"):?>
   <?php if($nahledu === 1): ?>
   <table cellspacing="1" class="nahledova">
   <tr><th>&nbsp;</th><th>ID</th><th>Jméno</th><th>Pohlaví</th><th>Popis</th></tr>
      <?php foreach($outNahledy as $nahled): ?>
         <tr class="<?=$strid[($n%2)];?>"><td><?=$n;?>.</td><td><?=$nahled['id'];?></td><td><?=$nahled['jmeno'];?></td><td><?=$pohl[(int)$nahled['pohlavi']];?></td><td><?=$nahled['popis'];?></td></tr>
      <?
         $n++;
         endforeach;
      ?>
   </table>
   <?php endif; ?>
   <form method="POST">
   <table>
   <tr><td>Jméno:</td><td><input type="text" name="jmeno"></td></tr>
   <tr><td>Pohlaví:</td>
      <td>
         <select name="pohlavi">
            <option value="1">M/Ž</option>
            <option value="2">M</option>
            <option value="3">Ž</option>
         </select>
      </td>
   </tr>
   <tr><td>Popis:</td><td><textarea name="popis" cols="50" rows="10"></textarea></td></tr>
   </table>
   <input type="submit" value="Přidat skřítka" name="add">
   </form>
   
<? ////////////////////////////// CON /////////////////////////// ?>


<?php elseif($_GET['action'] === "con"): ?>
PŘI SCHVÁLENÍ PROSÍM HRÁČE VYŘEŠTE KOMPLETNĚ (NAPIŠTE JIM, VEMTE SI JE POD KŘÍDLA), CHYBY HLAŠTE, BUĎTE TRPĚLIVÍ, ZMĚNY SE PROJEVÍ AŽ PO OPĚTOVNÉM NAČTENÍ. DÍKY. KOŘEN.
<form method="POST">
<table cellspacing="1" class="nahledova">
   <tr><th>Přezdívka</th><th>E-mail</th><th>Druhá postava</th><th>Poznámka</th><th>Stav</th><th>Výběr</th></tr>
      <?php foreach($outNahledy as $nahled): ?>
      <?php if($jmeno_postavy != $nahled['jmeno_postavy']){
         $jmeno_postavy = $nahled['jmeno_postavy'];
         echo "<tr class=\"postava\"><th colspan=\"4\">".$jmeno_postavy."</th></tr>";
      }?>
         <tr class="<?=$strid[($n%2)];?>">
            <td><?=$nahled['prezdivka'];?></td>
            <td><?=$nahled['email'];?></td>
            <td><?=$nahled['skritek'];?></td>
            <td><?=$nahled['poznamka'];?></td>
            <td><?php if($nahled['schvaleno'] == 't'):?>schvaleno<?else:?>neschvaleno<?endif;?></td>
            <td><input type="checkbox" name="vyber[]" value="<?=$nahled['id'];?>"></td>
         </tr>
      <?
         $n++;
         endforeach;
      ?>
      
   </table>
   <input type="submit" value="Schválit" name="con">
</form>
<h2>Generické přihlášky</h2>
<form method="POST">
<table cellspacing="1" class="nahledova">
   <tr><th>Skupina</th><th>Přezdívka</th><th>E-mail</th><th>Druhá postava</th><th>Poznámka</th><th>Stav</th><th>Výběr</th></tr>
      <?php if(isset($outNahledyGeneric)): foreach($outNahledyGeneric as $nahled): ?>
         <tr class="<?=$strid[($n%2)];?>">
            <td><?=$nahled['jmenoskupiny'];?></td>
            <td><?=$nahled['prezdivka'];?></td>
            <td><?=$nahled['email'];?></td>
            <td><?=$nahled['skritek'];?></td>
            <td><?=$nahled['poznamka'];?></td>
            <td><?php if($nahled['vyreseno'] == 'f'): ?> Čeká <?php else: ?> Vyřešeno <?php endif; ?></td>
            <td><input type="checkbox" name="vyber[]" value="<?=$nahled['id'];?>"></td>
         </tr>
      <?
         $n++;
         endforeach;
         endif;
      ?>
      
   </table>
   <input type="submit" value="Vyřešit" name="con"><br>
   Vyřešit znamená napsat hráči e-mail a domluvit se s ním!
</form>
<? // var_dump($_POST['vyber']); 
?>
<?php endif; ?>
</body>
</html>

