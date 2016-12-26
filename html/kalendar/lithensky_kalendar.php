<?php
include "adodb-time.inc.php";
function lithenske_datum($datum){
$rok = (int) adodb_date("Y", $datum);
$unor=FALSE;
if(adodb_date("n", $datum)==12 && adodb_date("j", $datum)>=21)$rok = (int) adodb_date("Y", $datum)+1;
if(adodb_cal_days_in_month(2, $rok)==29)$unor=TRUE;
$letopocet = $rok-576;

if(adodb_date("n", $datum)==12 && adodb_date("j", $datum)>=21 && adodb_date("j", $datum)<=31) $cislo_dne = (int) adodb_date("j", $datum)-20;
else{
   $cislo_dne = (int) adodb_date("z", $datum)+1+11;
   if($unor && $cislo_dne === 71) return FALSE;
   if($cislo_dne>71)$cislo_dne--;
}
if($letopocet%24 != 0){
   if(adodb_date("d.m", $datum)==="20.12") return FALSE;
}
if($letopocet > 1434) $letopocet += 10;//posun
//echo "Dnes je ".$cislo_dne.".den lihénského roku a ".(adodb_date("z")+1).". našeho.";
$obdobi = ceil($cislo_dne/91)-1;//dokončené období
$den_v_obdobi = $cislo_dne-$obdobi*91;
$tyden = ceil($den_v_obdobi/7)-1;//dokončený týden
$den = $den_v_obdobi-$tyden*7;

$doby[]="Zimy";
$doby[]="Jara";
$doby[]="Léta";
$doby[]="Podzimu";
/*echo $cislo_dne."\n";
echo $den_v_obdobi."\n";
echo $obdobi."\n";
echo $tyden."\n";
echo $den."\n";
echo "Dnes je ".$den.". den ".($tyden+1).". týdne ".$doby[$obdobi];*/
return array("den"=>$den, "tyden"=>($tyden+1), "obdobi"=>$doby[$obdobi], "rok"=>$letopocet);
}
function getLithenYear(){
   $letopocet = date("Y")-576;
   if($letopocet > 1434) $letopocet += 10;
   return $letopocet;
}
/*EXAMPLE:*/
//$a=lithenske_datum(mktime(0,0,0,20,12,575));
//print_r($a);
//echo adodb_date("d.m", mktime(0,0,0,12,19,1098));
//echo cal_days_in_month(CAL_GREGORIAN, 2, 1098);
?>
