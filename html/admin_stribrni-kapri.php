<?php
error_reporting(0);
session_start();
header("Content-Type: text/html; charset=utf-8");
function prihlasen(){
   if(isset($_SESSION['erinor']['login']) && $_SESSION['erinor']['login'] === 1)
      return TRUE;
   return FALSE;
}

$prihlasen = prihlasen();
$status = 0;


$strid[0] = "lichy";
$strid[1] = "sudy";

require_once "lib/sql.class.php";
require_once 'lib/Swift/swift_required.php';
require_once 'lib/hlavni.const.php';


//Send the message



//INSTALACE ERINOR DB

$installquery = "
CREATE TABLE IF NOT EXISTS erinor.prihlasky_stribrnikapri(
   email VARCHAR(80) PRIMARY KEY,
   prezdivka VARCHAR(40) NOT NULL,
   jmeno VARCHAR(40) NOT NULL,
   prijmeni VARCHAR(60) NOT NULL,
   vek INT NOT NULL,
   registrovan DATETIME NOT NULL DEFAULT now()
);

";

//

$psql = array(
    "host" => DBSERVER_ADDR,
    "uzivatel" => DB_USER,
    "heslo" => DB_PASS,
    "databaze" => DB_NAME,
    "port" => DB_PORT
);
$db = new Sql($psql);
$msg = "";
if($prihlasen){
   $status = 1;
   if(isset($_GET['action']) && $_GET['action'] === "logout"){
      unset($_SESSION['erinor']);
      session_destroy();
      $status = 0;
   }
   elseif(isset($_GET['action']) && $_GET['action'] === "del"){
      if(isset($_POST['del'])){
         //var_dump($_POST);
         if(isset($_POST['delete'])){
            foreach($_POST['delete'] as $key => $val){
               $db->dotaz("DELETE FROM erinor.prihlasky_stribrnikapri WHERE email='".$key."';");
            }
         }
      
      }
      $nahledy = $db->dotaz("
         SELECT
            p.email, p.prezdivka, p.jmeno, p.prijmeni, p.vek, p.registrovan, ((p.registrovan + interval '10 days') >= now()) as reg
         FROM
            erinor.prihlasky_stribrnikapri p;
      ");
      $nahledu = 0;
      if($nahledy){
         $db->outPole($nahledy, $outNahledy);
         $nahledu = 1;
      }
   }
}
else{
   
   if(!isset($_POST['login'])){
      $msg = "Přihlašte se, prosím.";
   }
   else if($_POST['login'] != "SK2012ERINOR"){
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
td.hastime{
   color: #007216;
}
td.donthavetime{
   color: #C50C04;
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

<a href="?action=del">Mazání přihlášek</a> | <a href="?action=logout">Odhlásit</a>
</p>
<? endif; ?>
<?php if($_GET['action'] === "del"):?>
   <?php if($nahledu === 1): ?>
   <form method="POST">
   <table cellspacing="1" class="nahledova">
   <tr><th>E-mail</th><th>Přezdívka</th><th>Jméno</th><th>Příjmení</th><th>Věk</th><th>Čas registrace</th><th>&nbsp;</th></tr>
      <?php foreach($outNahledy as $nahled): 
      
      ?>
         <tr class="<?=$strid[($n%2)];?>"><td><?=$nahled['email'];?></td><td><?=$nahled['prezdivka'];?></td><td><?=$nahled['jmeno'];?></td><td><?=$nahled['prijmeni'];?></td><td><?=$nahled['vek'];?></td><td class="<?php echo ($nahled['reg'] == 0) ? "hastime" : "donthavetime"; ?>"><?=$nahled['registrovan'];?></td><td><input type="checkbox" name="delete[<?=$nahled['email'];?>]"></td></tr>
      <?
         $n++;
         endforeach;
      ?>
   </table>
   
   <input type="submit" value="Smazat postavu" name="del">
   </form>
   <?php endif; ?>
<?php endif; ?>
</body>
</html>

