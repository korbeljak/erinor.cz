<?php
function addslashes2($str){
   $str2 = str_replace("\'", "*****", $str);
   if(strpos($str2,"'")!== false) return str_replace("*****", "\'", addslashes($str2));
   else return $str;
}
// pro svůj běh potřebuje funkci addslashes2
class Sql{
    private $oddelovac;
    private $spojeni;    
    private $chyby;
    private $prihl = array();

    public function __construct($prihl, $odd = "<br />\n"){
        if(
            empty($prihl['host']) ||
            empty($prihl['uzivatel']) ||
            empty($prihl['heslo']) ||
            empty($prihl['databaze']) ||
            !isset($prihl['port'])
        ){
            if(empty($prihl['host'])) $this->chyby['spojeni'][] = "nezadán host.";
            if(empty($prihl['uzivatel'])) $this->chyby['spojeni'][] = "nezadán uživatel.";
            if(empty($prihl['heslo'])) $this->chyby['spojeni'][] = "nezadáno heslo";
            if(empty($prihl['databaze'])) $this->chyby['spojeni'][] = "nezadáno jméno databáze";
            if(!isset($prihl['port'])) $this->chyby['spojeni'][] = "nezadán port";
        }
        else{
            $this->prihl = $prihl;
            $this->oddelovac = $odd;
            $this->pripoj();
            $this->vypisChyby("spojeni");
        }
    }
    
    private function pripoj(){
        $spojovaci = 
            "host=".$this->prihl['host']." dbname=".$this->prihl['databaze']
            ." user=".$this->prihl['uzivatel']." password=".$this->prihl['heslo']
        ;
        if(!empty($this->prihl['port'])) $spojovaci .= " port=5432";

        $this->spojeni = @pg_connect($spojovaci);
        if(!$this->spojeni) $this->chyby['spojeni'][] =
            "spojení z databázovým serverem selhalo: ".pg_last_error()
        ;
    
    }
    
    public function dotaz($dotaz){
        $vysledek = @pg_query($dotaz);
        if(!$vysledek){
            $this->chyby['dotazy'][] = "Dotaz selhal: ".pg_last_error();
        }
        return $vysledek;
    }
    
    public function ziskejPole($vysledek_dotazu){
        $vysledek = pg_fetch_array($vysledek_dotazu, NULL, PGSQL_ASSOC);//chceme jenom nečíselné identifikátory
        if(!$vysledek){
           $this->chyby['dotazy'][] = "Získání pole selhalo: ".pg_last_error();
        }
        return $vysledek;
    }
    
    public function spoctiRadky($vysledek_dotazu){
        $vysledek = pg_num_rows($vysledek_dotazu);//chceme jenom nečíselné identifikátory
            if(!$vysledek){
                $this->chyby['dotazy'][] = "Spočítání řádek selhalo: ".pg_last_error();
            }
        return $vysledek;
    }
    
    public function odpoj(){
        $odpojeni = pg_close($this->spojeni);
        return $odpojeni;
    }
    
    public function vypisChyby($oddil = "dotazy"){
        if(!empty($this->chyby[$oddil])){
            $ret = "";
            foreach ($this->chyby[$oddil] as $chyba){
                $ret .= $chyba.$this->oddelovac;
            }
            return $ret;
        }
        else return FALSE;
    }
    
    public function outPole($sql_array, &$vystupni_pole){// do proměnné $vystupni_pole přiřadí výstupní zparsované pole
        $i=0;
        while($db = $this->ziskejPole($sql_array)){
            foreach($db as $nazev_sloupce => $hodnota_sloupce){
                $vystupni_pole[$i][$nazev_sloupce] = $hodnota_sloupce;
            }
            $i++;
        }
    }
    public function __destruct(){
        $this->odpoj();
    }
}
?>
<?php
/*//PŘÍKLAD POUŽITÍ TŘÍDY sirs_Sql
$sql = new Sql(array(
    "host" => DBSERVER_ADDR,
    "uzivatel" => DB_USER,
    "heslo" => DB_PASS,
    "databaze" => DB_NAME,
    "port" => DB_PORT
));
$sql->dotaz("
    CREATE SCHEMA pilirion;
    CREATE TABLE pilirion.boa1 (
        id SERIAL,
        jmeno VARCHAR(20),
        heslo CHAR(4)
    );
    INSERT INTO pilirion.boa1 (jmeno, heslo) VALUES (
        'pčkg',
        'chec'
    );
");
$boa = $sql->dotaz("
    SELECT jmeno FROM pilirion.boa1;
");
$sql->dotaz("DROP SCHEMA pilirion; DROP TABLE pilirion.boa1;");
$pole = $sql->ziskejPole($boa);
echo $pole['jmeno']; //vypíše pčkg
*/
/*$sql = new Sql(array(
    "host" => "localhost",
    "uzivatel" => "pg_pilirion",
    "heslo" => "glorfindel",
    "databaze" => "pg_pilirion",
    "port" => ""
));
//$sql->dotaz("CREATE SCHEMA pilirion;");
$sql->dotaz("
    CREATE TABLE pilirion.boa1 (
        id SERIAL,
        jmeno VARCHAR(20),
        heslo CHAR(4)
    );
    INSERT INTO pilirion.boa1 (jmeno, heslo) VALUES (
        'pčkg',
        'chec'
    );
");
$boa = $sql->dotaz("
    SELECT jmeno FROM pilirion.boa1;
");
//$sql->dotaz("DROP SCHEMA pilirion; DROP TABLE pilirion.boa1;");
$pole = $sql->ziskejPole($boa);
echo $pole['jmeno'];
echo $sql->vypisChyby();*/
?>
