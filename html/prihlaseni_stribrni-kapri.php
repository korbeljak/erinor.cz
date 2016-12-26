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
    if(empty($id) || !preg_match("/^[0-9]+$/", $id)) return FALSE;
    return TRUE;
}
function jeVek($vek){
   $vek = (int) $vek;
   if($vek > 100 || $vek < 1) return FALSE;
    return TRUE;
}
require_once "lib/sql.class.php";
require_once 'lib/hlavni.const.php';
require_once 'lib/Swift/swift_required.php';
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


$jevdb = $db->dotaz("
   SELECT
      COUNT(*) as pocet
   FROM
      erinor.prihlasky_stribrnikapri;
");
$full = false;
$jevdb = $db->ziskejPole($jevdb);
if($jevdb['pocet'] >= 30){
   $full = true;
}

$msg = "";
$status = 0;
if(!$full):
if(isset($_POST['add'])){
   if(
      !jeText($_POST['jmeno'], 60) ||
      !jeText($_POST['prijmeni'], 60) ||
      !jeText($_POST['prezdivka'], 60) ||
      !jeEmail($_POST['email']) ||
      !jeVek($_POST['vek'])
   ){
      $msg = "Nesprávně vyplněná pole.";
   }
   else{
      $jevdb = $db->dotaz("
         SELECT
            COUNT(*)
         FROM
            erinor.prihlasky_stribrnikapri
         WHERE
            email='".$_POST['email']."';
      ");
      $jevdb = $db->ziskejPole($jevdb);
      if($jevdb['count'] === "0"){
         
         
         $insert = $db->dotaz("
            INSERT INTO erinor.prihlasky_stribrnikapri (prezdivka, email, jmeno, prijmeni, vek)
            VALUES ('".$_POST['prezdivka']."', '".$_POST['email']."', '".$_POST['jmeno']."', '".$_POST['prijmeni']."', ".(int)$_POST['vek'].");
         ");
         if($insert){
            $msg = "Přihláška přijata ke zpracování. Do 10 dní zašlete podklady k postavě.";
            
            $transport = Swift_SmtpTransport::newInstance('smtp.email.cz', 25)
  ->setUsername('erinor@email.cz')
  ->setPassword('Eryene')
  ;
$mailer = Swift_Mailer::newInstance($transport);
            
            $message = Swift_Message::newInstance('Erinor - přihlásil se nový hráč: '.$_POST['jmeno']." '".$_POST['prezdivka']."' ". $_POST['prijmeni'])
                  ->setFrom(array('erinor@email.cz' => 'prihlaseni kapri'))
                  ->setTo(array('erinor@email.cz'))
                  ->setBody("
                  Přihláška:\n
                  ----------\n
                  Jméno: ".$_POST['jmeno']." ".$_POST['prijmeni']."\n
                  Přezdívka: ".$_POST['prezdivka']."\n
                  E-mail: ".$_POST['email']."
                  Věk: ".$_POST['vek']."\n\n
                  
                  Správa, kontrola a mazání přihlášek probíhá na http://erinor.pilirion.cz/admin_stribrni-kapri.php\n
                  ----------\n
                  Erinor admin lite 0.0.1
                  ")
                  ;
                  
                  $result = @$mailer->send($message);
            $status = 1;
         }
      }
      else{
         $msg = "Je nám líto, ale někdo se pod tímto emailem už registroval.";
      }
   }
}
endif;
?>
<html>
<head>
<title>Admin Erinor lite 0.0.1 - Přihlášení hráčů STŘÍBRNÍ KAPŘI</title>
<style type="text/css">
</style>
</head>
<body>
<h1>Přihlášení na Erinor: STŘÍBRNÍ KAPŘI</h1>
<?php if($full): ?>
<p>Je nám líto, kapacita přihlašování byla vyčerpána. Zkuste to později.</p>
<?php else: ?>
   <?=$msg;?><br><?if($status == 0): ?>
   <form method="POST">
   <table>
   <tr><td>Jméno:</td><td><input type="text" name="jmeno"></td></tr>
   <tr><td>Příjmení:</td><td><input type="text" name="prijmeni"></td></tr>
   <tr><td>Přezdívka:</td><td><input type="text" name="prezdivka"></td></tr>
   <tr><td>E-mail:</td><td><input type="text" name="email"></td></tr>
   <tr><td>Věk:</td><td><input type="text" name="vek"></td></tr>
   </table>
   <input type="submit" value="Přihlásit se!" name="add">
   </form>
   
   <p><strong>Všechna pole jsou povinná</strong>.Přihláška se v systému udržuje 10 dní v aktivním stavu, do té doby prosím pošlete požadované informace.
   Jinak může být organizátorem <strong>smazána</strong>.
   </p>
   <?endif;?>
<?php endif;?>
</body>
</html>
