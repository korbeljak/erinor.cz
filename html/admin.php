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
   elseif(isset($_GET['action']) && $_GET['action'] === "con"){
      $jmeno_postavy = "";
      $nahledy = $db->dotaz("
         SELECT
            p.jmeno as jmeno_postavy, pr.id, pr.email, pr.prezdivka, pr.schvaleno
         FROM
            erinor.postavy p, erinor.prihlasky pr
         WHERE pr.id_postavy = p.id
         ORDER BY id_postavy, pr.cas ASC
         ;
      ");
      $db->outPole($nahledy, $outNahledy);
      if(!empty($_POST['con'])){
         $ch = FALSE;
         foreach($_POST['vyber'] as $prihlaska){
            $succ = $db->dotaz("
               UPDATE erinor.prihlasky
               SET schvaleno='t'
               WHERE id=".(int) $prihlaska.";
            ");
            if(!$succ) $ch = TRUE;
            else{
               $succ = $db->dotaz("
                  SELECT
                     pr.email, p.jmeno
                  FROM
                     erinor.prihlasky pr, erinor.postavy p
                  WHERE pr.id=".(int) $prihlaska." AND pr.id_postavy=p.id;
               ");
               $email = $db->ziskejPole($succ);
               var_dump($email);
               $message = Swift_Message::newInstance('Erinor - Přihlášení na Ladoňku')
               ->setFrom(array('erinor@email.cz' => 'Organizace Erinoru'))
               ->setTo(array($email['email']))
               ->setBody('Přihláška za postavu \''.$email['jmeno'].'\' byla přijata. Org tým - Kořen, Terka')
               ;
               
               $result = $mailer->send($message);
               if(!$result) $ch = TRUE;
            }
         }
         if($ch) $msg = "Chyba: Ne všechna data změněna.";
         else $msg = "Úspěšně nastaveno.";
      }
   }
   elseif(isset($_GET['action']) && $_GET['action'] === "add"){
      $nahledy = $db->dotaz("
         SELECT
            p.id, p.pohlavi, k.nazev AS kategorie, p.jmeno, p.popis
         FROM
            erinor.postavy p, erinor.kategorie k
         WHERE p.id_kategorie = k.id;
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
            erinor.kategorie;
      ");
      if($kategorie){
         $db->outPole($kategorie, $outKategorie);
      }
      if(!empty($_POST['add'])){
         if(
            empty($_POST['jmeno']) ||
            empty($_POST['pohlavi']) ||
            empty($_POST['popis']) ||
            empty($_POST['kategorie'])
         ){
            $msg="Přidání postavy selhalo. Vyplňte pole.";
         }
         else{
            $o = $db->dotaz("
               INSERT INTO
                  erinor.postavy
                  (jmeno, pohlavi, popis, id_kategorie)
               VALUES
                  ('".$_POST['jmeno']."', ".$_POST['pohlavi'].", '".$_POST['popis']."', ".$_POST['kategorie'].")
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
   else if($_POST['login'] != "LS201104"){
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

<a href="?action=add">Přidávání postav</a> | <a href="?action=con">Schvalování přihlášek</a> | <a href="?action=logout">Odhlásit</a>
</p>
<? endif; ?>
<?php if($_GET['action'] === "add"):?>
   <?php if($nahledu === 1): ?>
   <table cellspacing="1" class="nahledova">
   <tr><th>&nbsp;</th><th>ID</th><th>Jméno</th><th>Pohlaví</th><th>Popis</th><th>Kategorie</th></tr>
      <?php foreach($outNahledy as $nahled): ?>
         <tr class="<?=$strid[($n%2)];?>"><td><?=$n;?>.</td><td><?=$nahled['id'];?></td><td><?=$nahled['jmeno'];?></td><td><?=$pohl[(int)$nahled['pohlavi']];?></td><td><?=$nahled['popis'];?></td><td><?=$nahled['kategorie'];?></td></tr>
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
   <tr><td>Kategorie:</td>
      <td>
         <select name="kategorie">
         <?php foreach($outKategorie as $kat): ?>
            <option value="<?=$kat['id'];?>" selected="selected"><?=$kat['nazev'];?></option>
         <?php endforeach; ?>
         </select>
      </td>
   </tr>
   </table>
   <input type="submit" value="Přidat postavu" name="add">
   </form>
<?php elseif($_GET['action'] === "con"): ?>
<form method="POST">
<table cellspacing="1" class="nahledova">
   <tr><th>Přezdívka</th><th>E-mail</th><th>Stav</th><th>Výběr</th></tr>
      <?php foreach($outNahledy as $nahled): ?>
      <?php if($jmeno_postavy != $nahled['jmeno_postavy']){
         $jmeno_postavy = $nahled['jmeno_postavy'];
         echo "<tr class=\"postava\"><th colspan=\"4\">".$jmeno_postavy."</th></tr>";
      }?>
         <tr class="<?=$strid[($n%2)];?>">
            <td><?=$nahled['prezdivka'];?></td>
            <td><?=$nahled['email'];?></td>
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
<? // var_dump($_POST['vyber']); 
?>
<?php endif; ?>
</body>
</html>

