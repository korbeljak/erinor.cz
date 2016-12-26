<?php

require_once "lib/sql.class.php";
require_once 'lib/Swift/swift_required.php';
require_once 'lib/hlavni.const.php';

$transport = Swift_SmtpTransport::newInstance('smtp.email.cz', 25)
  ->setUsername('pilirion@seznam.cz')
  ->setPassword('chrumkavazeleninka')
  ;
$mailer = Swift_Mailer::newInstance($transport);
  
//Send the message


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
$count = $db->dotaz("
   SELECT
      COUNT(*)
   FROM
      erinor.ereni_prihlasky;
");
$count = $db->ziskejPole($count);

$countnew = $db->dotaz("
   SELECT
      COUNT(*)
   FROM
      erinor.ereni_prihlasky
   WHERE
      schvaleno = 'f';
");
$countnew = $db->ziskejPole($countnew);

$vypis = $db->dotaz("
   SELECT
      id, email, prezdivka, postavy, cas, ubytovani, ldvecer
   FROM
      erinor.ereni_prihlasky
   WHERE
      schvaleno = 'f';
");
$db->outPole($vypis, $prihlasky);

$out2 = "Přihlásilo se ".$countnew['count']." nových účastníků (celkově nyní ".$count['count']."): \n";
$out2 .= "----------\n\n";
$out = "";
$fp = fopen("./logs/prihlasky-erinoreni.log", "a");

foreach($prihlasky as $prihlaska){
   $db->dotaz("
   UPDATE
      erinor.ereni_prihlasky
   SET
      schvaleno = 't'
   WHERE
      id = ".$prihlaska['id'].";
   ");
   
   $message = Swift_Message::newInstance('Erinor - Přihlášení na Erinoření')
   ->setFrom(array('pilirion@seznam.cz' => 'Organizace Erinoření'))
   ->setTo(array($prihlaska['email']))
   ->setBody('Přihláška byla přijata.');
   
   $result = $mailer->send($message);
   
   $out .= "Prihlaska cislo ".$prihlaska['id']." \n";
   $out .= "Prezdivka: ".$prihlaska['prezdivka']." \n";
   $out .= "Email: ".$prihlaska['email']." \n";
   $out .= "Postavy: ".$prihlaska['postavy']." \n";
   
   $u = "ne";
   $l = $u;
   
   if($prihlaska['ubytovani'] === 't')
      $u = "ano";
   if($prihlaska['ldvecer'] === 't')
      $l = "ano";
   
   $out .= "Ubytování: ".$u." \n";
   $out .= "Larpově divadelní večer: ".$l." \n";
   $out .= "----\n\n";
   
}

$message = Swift_Message::newInstance('Výpis přihlášených na Erinoření')
->setFrom(array('pilirion@seznam.cz' => 'Organizace Erinoření'))
->setTo(array('pilirion@seznam.cz'))
->setBody($out2.$out);

$result = $mailer->send($message);
if($result) echo "Vyhodnoceno.";

fwrite($fp, $out);

fclose($fp);
