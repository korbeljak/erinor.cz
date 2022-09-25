<?php
header("Content-Type: text/html; charset=utf-8");
if(strtotime(date("Y-m-d H:i:s")) < strtotime("2011-07-26 20:00:00")) die();
function jeText($a, $length, $prazdne = FALSE){
   if($prazdne && empty($a)) return TRUE;
   if(!empty($a) && (mb_strlen($a) <= $length || $length === -1)) return TRUE;
   else return FALSE;
}
function jeEmail($adresa, $prazdne = FALSE){
   if($prazdne && empty($a)) return TRUE;
   $r = "[^\.\"\'\;\,\ ]";
   if(preg_match("/^".$r."+(\.".$r."+)*@(".$r."+[\.])+[a-z]{2,6}$/i",$adresa)) return TRUE;
   else return FALSE;
}
function jeID($id){
    if(!isset($id) || !preg_match("/^[-0-9]+$/", $id)) return FALSE;
    return TRUE;
}
function dbProstyText($text){
   return pg_escape_string(htmlspecialchars($text));
}
require_once "lib/sql.class.php";
require_once 'lib/hlavni.const.php';
/*
INSTALACE ERINOR DB
*/
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

if(!isset($_POST['add'])){
   if(isset($_GET['id'])){
      $nahledy = $db->dotaz("
         SELECT
            p.id, p.jmeno, (SELECT COUNT(*) FROM erinor.kz_prihlasky WHERE id_postavy=".(int) $_GET['id'].") AS zabrano, p.flagy,
            (SELECT COUNT(*) FROM erinor.kz_prihlasky WHERE id_postavy=".(int) $_GET['id']." AND schvaleno = 't') AS schvaleno
         FROM
            erinor.kz_postavy p
         WHERE id = ".(int) $_GET['id'].";
      ");
      if(!$nahledy) die("Taková postava neexistuje.");
      $postava = $db->ziskejPole($nahledy);
      if($postava['schvaleno'] != 0) die("Postava je obsazená.");
      if($postava['zabrano'] != 0) die("Postava je obsazená.");
   }
   elseif(isset($_GET['skupina'])){
      $skupiny = $db->dotaz("
         SELECT
            z.id, z.nazev, z.strop, (SELECT COUNT(*) FROM erinor.kz_prihlasky_generic WHERE id_zajmoveskupiny=z.id) AS obsazeno
         FROM
            erinor.kz_zajmoveskupiny z
         WHERE
            id = ".(int) $_GET['skupina'].";
      ");
      if($skupiny){
         $skupina = $db->ziskejPole($skupiny);
      }
      else die("Skupina neexistuje.");
      if($skupina['strop'] == $skupina['obsazeno']) die("Skupina je obsazená."); 
   }
   if(isset($_GET['skupina']) || isset($_GET['id'])){
      $skritci = $db->dotaz("
         SELECT
            p.id, p.jmeno, p.pohlavi, (SELECT COUNT(*) FROM erinor.kz_prihlasky pr WHERE pr.druhapostava = p.id) + (SELECT COUNT(*) FROM erinor.kz_prihlasky_generic pr WHERE pr.druhapostava = p.id) AS obsazeno
         FROM
            erinor.kz_postavy_skritci p;
      ");
      if($skritci){
         $db->outPole($skritci, $outSkritci);
      }
   }
   else{
      die("Error: Hacking attempt!");
   }
}
if(isset($_POST['add'])){
   if(
      !jeText($_POST['prezdivka'], 60) ||
      !jeEmail($_POST['email'])
   ){
      $msg = "Nespravne vyplnena pole.";
   }
   if(isset($_POST['id'])){
      if(!jeID($_POST['id'])) $msg = "Nespravne vyplnena pole.";
      else{
            $insert = $db->dotaz("
            INSERT INTO erinor.kz_prihlasky (id_postavy, prezdivka, email, druhapostava, poznamka)
            VALUES (".$_POST['id'].", '".dbProstyText($_POST['prezdivka'])."', '".$_POST['email']."', ".$_POST['druhapostava'].", '".dbProstyText($_POST['poznamka'])."');
         ");
         if($insert){
            $msg = "Přihláška přijata ke zpracování. Počkejte na e-mail.";
            $status = 1;
         }
         else{
            $msg = "Chyba! Kontaktujte administrátora.";
            $status = 0;
         }
      }
   }
   elseif(isset($_POST['skupina'])){
      $insert = $db->dotaz("
         INSERT INTO erinor.kz_prihlasky_generic (id_zajmoveskupiny, prezdivka, email, druhapostava, poznamka)
         VALUES (".$_POST['skupina'].", '".dbProstyText($_POST['prezdivka'])."', '".$_POST['email']."', ".$_POST['druhapostava'].", '".dbProstyText($_POST['poznamka'])."');
      ");
      if($insert){
         $msg = "Přihláška přijata ke zpracování. Počkejte na e-mail.";
         $status = 1;
      }
      else{
         $msg = "Chyba! Kontaktujte administrátora.";
         $status = 0;
      }
   }
   else{
      $msg = "Hacking attempt!";
      $status = 0;
   }
}
?>
<?php if(isset($_GET['id'])): ?>
<html>
<head>
<title>Admin Erinor lite 0.0.1 - Přihlášení postav KOČIČÍ ZAKLÍNÁNÍ</title>
<style type="text/css">
</style>
</head>
<body>
<h1>Přihlášení za postavu <?=$postava['jmeno'];?> </h1>
   <?=$msg;?><br><?if($status == 0): ?>
   <form method="POST">
   <table>
   <tr><td>Přezdívka:</td><td><input type="text" name="prezdivka"></td></tr>
   <tr><td>E-mail:</td><td><input type="text" name="email"></td></tr>
   <tr><td>
      Druhá postava <br>
      (vyberte si podle tabulky přihlašování)<br>
      -
      <?php if($postava['flagy'] > 7): ?>
         <strong>povinné</strong>, pokud ještě nějaká zbyla, prosím vyberte si. Samozřejmě<br> 
         přemýšlejte! Jste-li dvoumetrový chlap jak hora, zvažte, zda křehká<br>
         víla, ač zbyla poslední, je to pravé. Do ničeho vás nenutíme :)  
      <?php else: ?>
         nepovinné, stačí nechat být
      <?php endif; ?>
      )</td>
      <td>
         <select name="druhapostava">
            <option value="-1" selected>---</option>
            <?php foreach($outSkritci as $skritek): ?>
               <?php if($skritek['obsazeno'] == 1) continue; ?>
               <option value="<?=$skritek['id'];?>"><?=$skritek['jmeno'];?> (<?=$pohl[$skritek['pohlavi']];?>)</option>
            <?php endforeach; ?>
         </select>
      </td>
   </tr>
   <tr><td>Poznámka<br>(cokoliv, chci být s někým ve skupině, jakýkoliv vzkaz orgům):</td>
      <td>
         <textarea name="poznamka"></textarea>
      </td>
   </tr>
   </table>
   <input type="hidden" value="<?=$_GET['id'];?>" name="id">
   <input type="submit" value="Přihlásit se!" name="add">
   </form>
   <?endif;?>
</body>
</html>
<?php elseif(isset($_GET['skupina'])): ?>
<html>
<head>
<title>Admin Erinor lite 0.0.1 - Přihlášení postav KOČIČÍ ZAKLÍNÁNÍ</title>
<style type="text/css">
</style>
</head>
<body>
<h1>Přihlášení za člena skupiny <?=$skupina['nazev'];?> </h1>
   <?=$msg;?><br><?if($status == 0): ?>
   <form method="POST">
   <table>
   <tr><td>Přezdívka:</td><td><input type="text" name="prezdivka"></td></tr>
   <tr><td>E-mail:</td><td><input type="text" name="email"></td></tr>
   <tr><td>Druhá postava<br>(vyberte si podle tabulky přihlašování)<br>nepovinné, stačí nechat být:</td>
      <td>
         <select name="druhapostava">
            <option value="-1" selected>---</option>
            <?php foreach($outSkritci as $skritek): ?>
               <?php if($skritek['obsazeno'] == 1) continue; ?>
               <option value="<?=$skritek['id'];?>"><?=$skritek['jmeno'];?> (<?=$pohl[$skritek['pohlavi']];?>)</option>
            <?php endforeach; ?>
         </select>
      </td>
   </tr>
   <tr><td>Poznámka<br>(cokoliv, chci být s někým ve skupině, jakýkoliv vzkaz orgům):</td>
      <td>
         <textarea name="poznamka"></textarea>
      </td>
   </tr>
   </table>
   <input type="hidden" value="<?=$_GET['skupina'];?>" name="skupina">
   <input type="submit" value="Přihlásit se!" name="add">
   </form>
   <?endif;?>
</body>
</html>
<?php endif; ?>
