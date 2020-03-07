<?php
function nahled_pisemnosti($cesta_soubor, $sekce, $seo_nazev){
   $f = fopen($cesta_soubor, "r");
   $r="";
   $o = array();
   $o[0]="";
   $i = 0;
   while($r!="</popis>\n"){
      $r = fgets($f, 4096);
      switch($r){
         case "<nazev>\n":
            $i = 0;
            $o[$i] = "";
            $s = "";
            break;
         case "</nazev>\n":
            $s = "";
            break;
         case "<cas>\n":
            $i++;
            $o[$i] = "";
            break;
         case "</cas>\n":
            $s = "";
            break;
         case "<podpis>\n":
            $i++;
            $o[$i] = "";
            break;
         case "</podpis>\n":
            $s = "";
            break;
         case "<popis>\n":
            $i++;
            $o[$i] = "";
            break;
         case "</popis>\n":
            $i++;
            $o[$i] = "";
            break;
         default:
           $s = $r;
      }
      $o[$i] .= $s; 
      //if($l=="</podpis>")break;
      //print_r($o);
      //echo $r;
      //echo $r."<br>";
   }
   fclose($f);
   $pisemnost = "<h4><a href=\"od-hracu/".$sekce."/".$seo_nazev."/\">".$o[0]."</a></h4>\n";
   $pisemnost .= "<p class=\"bez pridal\">Přidal/a ".$o[2]." ve ".$o[1]."</p>\n";
   $pisemnost .= "<p>".$o[3]."</p><br><br>\n";
   return $pisemnost;
}
function vypis_pisemnost($cesta_soubor){
   if($cesta_soubor===FALSE) return "Chyba, soubor neexistuje.";
   else{
   $f = fopen($cesta_soubor, "r");
   $r="";
   $o = array();
   $o[0]="";
   $i = 0;
   while(!feof($f)){
      $r = fgets($f, 4096);
      switch($r){
         case "<nazev>\n":
            $i = 0;
            $o[$i] = "";
            $s = "";
            break;
         case "</nazev>\n":
            $s = "";
            break;
         case "<cas>\n":
            $i++;
            $o[$i] = "";
            break;
         case "</cas>\n":
            $s = "";
            break;
         case "<podpis>\n":
            $i++;
            $o[$i] = "";
            break;
         case "</podpis>\n":
            $s = "";
            break;
         case "<popis>\n":
            $i++;
            $o[$i] = "";
            break;
         case "</popis>\n":
            $s = "";
            break;
         case "<obsah>\n":
            $i++;
            $o[$i] = "";
            break;
         /*case "</obsah>":
            $i++;
            $o[$i] = "";
            break;*/
         default:
           $s = $r;
      }
      $o[$i] .= $s; 
      //if($l=="</podpis>")break;
      //print_r($o);
      //echo $r;
      //echo $r."<br>";
   }
   fclose($f);
   $texy = new Texy();
   $texy->setOutputMode(Texy::HTML4_STRICT);
   $pisemnost = "<h1>".$o[0]."</h1>\n";
   $pisemnost .= "<p class=\"bez pridal\">Přidal/a ".$o[2]." ve ".$o[1]."</p>\n";
   $pisemnost .= "<p>".$o[3]."</p><br>\n";
   $pisemnost .= $texy->process($o[4]);
   return stripslashes($pisemnost);
   }
}
function seznam_pisemnosti($sekce){
   $d="pisemnosti/".$sekce;
   $od = opendir($d);
   while($nazev_souboru = readdir($od)){
      if(preg_match("/^[0-9]{3,3}_.+\.xml$/",$nazev_souboru)){
         $s = explode("_", $nazev_souboru);
         $pole[] = $s[0];
         $seo = explode(".",$s[1]);
         echo nahled_pisemnosti("pisemnosti/".$sekce."/".$nazev_souboru, $sekce, $seo[0]);
      }
   }
}
function najdi_pisemnost($seo_nazev, $sekce){
   $d="pisemnosti/".$sekce;
   $od = opendir($d);
   while($nazev_souboru = readdir($od)){
      if(preg_match("/^[0-9]{3,3}_".preg_quote($seo_nazev)."\.xml$/",$nazev_souboru)){
         $n = $nazev_souboru;
         break;
      }
   }
   if(!isset($n)) return FALSE;
   else return $n;
}
function cislo_pisemnosti($dir){
   if(is_dir($dir)){
      $d = opendir($dir);
      
      while($nazev_souboru = readdir($d)){
         if(preg_match("/^[0-9]{3,3}_.+\.xml$/",$nazev_souboru)){
            $s = explode("_", $nazev_souboru);
            $pole[] = $s[0];
         }
      }
      if(isset($pole)) return max($pole)+1;
      else return 1;
   }
}
function txt2seo($text){
   $text = iconv('UTF-8', 'ASCII//TRANSLIT', $text);
   $text = str_replace('\'', '', $text);
   $text = preg_replace('/\W+/', '-', $text);
   $text = trim($text, '-');
   $text = strtolower($text);
   return $text;
}
?>
