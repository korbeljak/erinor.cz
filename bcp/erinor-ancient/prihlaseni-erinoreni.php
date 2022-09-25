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

if(isset($_POST['add'])){
   if(
      !jeText($_POST['prezdivka'], 60) ||
      !jeEmail($_POST['email']) ||
      !jeText($_POST['postavy'], 200, TRUE)
   ){
      $msg = "Nespravne vyplnena pole.";
   }
   else{
      $jevdb = $db->dotaz("
         SELECT
            COUNT(*)
         FROM
            erinor.ereni_prihlasky
         WHERE
            email='".$_POST['email']."';
      ");
      $jevdb = $db->ziskejPole($jevdb);
      if($jevdb['count'] === "0"){
         
         $ubytovani = 'f';
         $ldvecer = 'f';
         
         if(isset($_POST['ubytovani']) && $_POST['ubytovani'] == 't')
            $ubytovani = 't';
         if(isset($_POST['ldvecer']) && $_POST['ldvecer'] == 't')
            $ldvecer = 't';
         
         
         $insert = $db->dotaz("
            INSERT INTO erinor.ereni_prihlasky (prezdivka, email, postavy, ubytovani, ldvecer)
            VALUES ('".$_POST['prezdivka']."', '".$_POST['email']."', '".$_POST['postavy']."', '".$ubytovani."', '".$ldvecer."');
         ");
         if($insert){
            $msg = "Přihláška přijata ke zpracování. Počkejte na e-mail.";
            $status = 1;
         }
      }
   }
}
?>
<html>
<head>
<title>Admin Erinor lite 0.0.1 - Přihlášení postav ERINOŘENÍ</title>
<style type="text/css">
</style>
</head>
<body>
<h1>Přihlášení</h1>
   <?=$msg;?><br><?if($status == 0): ?>
   <form method="POST">
   <table>
   <tr><td>Přezdívka:</td><td><input type="text" name="prezdivka"></td></tr>
   <tr><td>E-mail:</td><td><input type="text" name="email"></td></tr>
   <tr><td>Postava/y:</td><td><input type="text" name="postavy"></td></tr>
   <tr><td>Ubytování:</td><td><input type="checkbox" name="ubytovani" value="t"></td></tr>
   <tr><td>Larpově divadelní večer:</td><td><input type="checkbox" name="ldvecer" value="t"></td></tr>
   </table>
   <input type="hidden" value="<?=$_GET['id'];?>" name="id">
   <input type="submit" value="Přihlásit se!" name="add">
   </form>
   <p>Do políčka postava/y vyplňte postavu nebo postavy, které byste si chtěli zahrát, není to ovšem až tak směrodatné.</p>
   <?endif;?>
</body>
</html>
