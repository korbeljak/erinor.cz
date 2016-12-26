<?php
header("Content-Type: text/html; charset=utf-8");
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
    if(!isset($id) || !preg_match("/^[0-9]+$/", $id)) return FALSE;
    return TRUE;
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

if(!isset($_POST['add'])){
      $nahledy = $db->dotaz("
         SELECT
            p.id, p.jmeno, (SELECT COUNT(*) FROM erinor.prihlasky WHERE id_postavy=".(int) $_GET['id'].") AS zabrano,
            (SELECT COUNT(*) FROM erinor.prihlasky WHERE id_postavy=".(int) $_GET['id']." AND schvaleno = 't') AS schvaleno
         FROM
            erinor.postavy p
         WHERE id = ".(int) $_GET['id'].";
      ");
      if(!$nahledy) die("Taková postava neexistuje.");
      $postava = $db->ziskejPole($nahledy);
      if($postava['schvaleno'] != 0) die("Postava je obsazená.");
      if($postava['zabrano'] != 0) die("Postava je obsazená.");
}
if(isset($_POST['add'])){
   if(
      !jeID($_POST['id']) ||
      !jeText($_POST['prezdivka'], 60) ||
      !jeEmail($_POST['email'])
   ){
      $msg = "Nespravne vyplnena pole.";
   }
   else{
      $insert = $db->dotaz("
         INSERT INTO erinor.prihlasky (id_postavy, prezdivka, email)
         VALUES (".$_POST['id'].", '".$_POST['prezdivka']."', '".$_POST['email']."');
      ");
      if($insert){
         $msg = "Přihláška přijata ke zpracování. Počkejte na e-mail.";
         $status = 1;
      }
   }
}
?>
<html>
<head>
<title>Admin Erinor lite 0.0.1 - Přihlášení postav LADOŇKA STUMELSKÁ</title>
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
   </table>
   <input type="hidden" value="<?=$_GET['id'];?>" name="id">
   <input type="submit" value="Přihlásit se!" name="add">
   </form>
   <?endif;?>
</body>
</html>
