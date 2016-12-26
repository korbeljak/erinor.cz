<?php

if($_SERVER["SERVER_ADDR"]=="127.0.0.1" || $_SERVER["SERVER_ADDR"]=="::1"){
    define("DBSERVER_ADDR", "127.0.0.1");
    define("DB_NAME", "pg_pilirion");
    define("DB_USER", "test");
    define("DB_PASS", "test");
    define("DB_PORT", "5432");
    
}
else{
    define("DBSERVER_ADDR", "localhost");
    define("DB_NAME", "pg_pilirion");
    define("DB_USER", "pg_pilirion");
    define("DB_PASS", "glorfindel");
    define("DB_PORT", "");
}
define("SCH", "pilirion.");
?>
