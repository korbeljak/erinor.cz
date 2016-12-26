<?php
require_once "lib/sql.class.php";
/*
INSTALACE ERINOR DB
*/
$psql = array(
    "host" => "127.0.0.1",
    "uzivatel" => "test",
    "heslo" => "test",
    "databaze" => "pilirion",
    "port" => 5432
);
$db = new Sql($psql);
//$db->dotaz("CREATE SCHEMA erinor;");
$db->dotaz("
   CREATE TABLE erinor.postavy(
      id SERIAL PRIMARY KEY,
      id_kategorie INT NOT NULL,
      jmeno VARCHAR(150) NOT NULL UNIQUE,
      pohlavi INT NOT NULL DEFAULT 0,
      popis TEXT NOT NULL DEFAULT ''
   );
   CREATE TABLE erinor.kategorie(
      id SERIAL PRIMARY KEY,
      nazev VARCHAR(150) NOT NULL
   );
   CREATE TABLE erinor.prihlasky(
      id SERIAL PRIMARY KEY,
      id_postavy INT NOT NULL,
      email VARCHAR(150) NOT NULL,
      prezdivka VARCHAR(150) NOT NULL,
      schvaleno BOOLEAN NOT NULL DEFAULT '0',
      cas TIMESTAMP NOT NULL DEFAULT now()
   );
   INSERT INTO erinor.kategorie (nazev) VALUES ('Hrad');
   INSERT INTO erinor.kategorie (nazev) VALUES ('Šlechtická družina');
   INSERT INTO erinor.kategorie (nazev) VALUES ('Cizí');
   
   CREATE TABLE erinor.ereni_prihlasky(
      id SERIAL PRIMARY KEY,
      email VARCHAR(150) NOT NULL UNIQUE,
      prezdivka VARCHAR(150) NOT NULL,
      postavy VARCHAR(200) NOT NULL DEFAULT '',
      schvaleno BOOLEAN NOT NULL DEFAULT 'f',
      ubytovani BOOLEAN NOT NULL DEFAULT 'f',
      ldvecer BOOLEAN NOT NULL DEFAULT 'f',
      cas TIMESTAMP NOT NULL DEFAULT now()
   );
");

/*$db->dotaz("
   CREATE TABLE
");
*/
?>

