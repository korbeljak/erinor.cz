<?php /*
title = "Stránky LARPu Erinor (pořádané skupinou Pilirion)";
description = "larp, erinor, fantasy, dřevárny, roleplay";
keywords = "Stránky LARPu Erinor";

Sem lze napsat libovolný komentář, nebude zobrazen. Zobrazí se pouze text pod čarou.
----------
*/ ?>
<?php
$otazky = array(
"Kdy byl založen Lazovar? (Nápověda: Příští rok tomu bude sto padesát let; psáno 2009 n. l.)",
"Kolik grošů je 1 tolar?"
);
$odpovedi = array(
"1284",
"21"
);
$sekce = array(
1=>"Postavy",
"Hřbitov",
"Recenze",
"Dokumenty",
"Ostatní",
);
$sekce_s = array(
1=>"postavy",
"hrbitov",
"recenze",
"dokumenty",
"ostatni",
);
$tmp_pole= array(
"sekce"=>"",
"nazev"=>"",
"popis"=>"",
"obsah"=>"",
"podpis"=>""
);

if(isset($_POST['odeslat']) && $_POST['odeslat']==="Odeslat písemnost!"){
   $pref="pisemnost_";
   if(
      empty($_POST[$pref.'odpoved']) || $_POST[$pref.'odpoved'] != $odpovedi[$_SESSION["cislo_otazky"]] ||
      empty($_POST[$pref.'sekce']) || $_POST[$pref.'sekce'] > count($sekce) ||
      empty($_POST[$pref.'nazev']) || strlen($_POST[$pref.'nazev']) > 150 ||
      empty($_POST[$pref.'popis']) || strlen($_POST[$pref.'popis']) > 512 ||
      empty($_POST[$pref.'obsah']) || strlen($_POST[$pref.'obsah']) > 16000 ||
      empty($_POST[$pref.'podpis']) || strlen($_POST[$pref.'podpis']) > 100
   ){
      
      if(empty($_POST[$pref.'odpoved']) || $_POST[$pref.'odpoved'] != $odpovedi[$_SESSION["cislo_otazky"]]){$chyby[] = "Odpověď není zadaná správně"; if(isset($_SESSION["cislo_otazky"]))unset($_SESSION["cislo_otazky"]);}
      if(empty($_POST[$pref.'sekce']) || $_POST[$pref.'sekce'] > count($sekce)){$chyby[] = "Sekce není zvolena správně";}
      if(empty($_POST[$pref.'nazev']) || strlen($_POST[$pref.'nazev']) > 150){$chyby[] = "Název nezvolen nebo je delší než 150 znaků";}
      if(empty($_POST[$pref.'popis']) || strlen($_POST[$pref.'popis']) > 512){$chyby[] = "Popis nezvolen nebo je delší než 512 znaků";}
      if(empty($_POST[$pref.'obsah']) || strlen($_POST[$pref.'obsah']) > 16000){$chyby[] = "Vlastní text nezvolen nebo je delší než 10 000 znaků";}
      if(empty($_POST[$pref.'podpis']) || strlen($_POST[$pref.'podpis']) > 100){$chyby[] = "Podpis nezvolen nebo je delší než 100 znaků";}
      $tmp_pole["sekce"]=$_POST[$pref.'sekce'];
      $tmp_pole["nazev"]=$_POST[$pref.'nazev'];
      $tmp_pole["popis"]=$_POST[$pref.'popis'];
      $tmp_pole["obsah"]=$_POST[$pref.'obsah'];
      $tmp_pole["podpis"]=$_POST[$pref.'podpis'];
      //uložit do xml -- chyby novým systémem!
      $i = 1;
      $chybky="";
      foreach($chyby as $ch){
         $chybky .= $i.". chyba: ".$ch."<br>\n";
         $i++;
      }
      unset($i);
      unset($_SESSION["cislo_otazky"]);
   }
   else{      
      //zachovat proměnné, znovu použít, vyhodit chybu.
      $slozka = $sekce_s[(int)$_POST[$pref.'sekce']];
      $cesta = "pisemnosti/".$slozka;
      $cislo0 = cislo_pisemnosti($cesta);
      if(strlen($cislo0) == 1) $cislo = "00".$cislo0;
      if(strlen($cislo0) == 2) $cislo = "0".$cislo0;
      if(strlen($cislo0) == 3) $cislo = $cislo0;
      $nazev=$cislo."_".txt2seo($_POST[$pref.'nazev']).".xml";

      //příprava xml souboru
      $napln = "";
      $napln .= "<nazev>\n".strip_tags($_POST[$pref.'nazev'])."\n</nazev>";
      $napln .= "\n<cas>\n".date("j. n. Y H:i:s")."\n</cas>";
      $napln .= "\n<podpis>\n".strip_tags($_POST[$pref.'podpis'])."\n</podpis>";      
      $napln .= "\n<popis>\n".strip_tags($_POST[$pref.'popis'])."\n</popis>";
      $napln .= "\n<obsah>\n".$_POST[$pref.'obsah']/*."\n</obsah>"*/;    
      
      $soub = $cesta."/".$nazev;
      $f = fopen($soub, "w");
      if(fwrite($f, $napln)){
         echo "Uložení souboru bylo úspěšné";
      }
      else echo "Uložení souboru selhalo";
      fclose($f);
   }
}
$_SESSION["cislo_otazky"] = mt_rand(0, count($otazky)-1);
?>
<h1>Přidání písemnosti</h1>
<?php if(isset($chybky)): ?><div class="chyby"><?=$chybky;?></div><?php endif;?>
<form action="od-hracu/pridat-pisemnost/" method="post">
<p>Kontrolní otázka: <?=$otazky[$_SESSION["cislo_otazky"]];?></p><br>
<table class="rs">
<tr><td>Odpověď:</td><td><input type="text" name="pisemnost_odpoved" id="odpoved"></td>
<tr><td>Sekce:</td>
   <td>
      <select name="pisemnost_sekce" id="pisemnost_sekce">
         <?php foreach($sekce as $id => $hodnota): ?>
         <option value="<?=$id;?>" <?php if($tmp_pole["sekce"]==$id) echo 'selected="selected"';?>><?=$hodnota;?></option>
         <?php endforeach; ?>
      </select>
   </td>
<tr><td>Název písemnosti:</td><td><input type="text" name="pisemnost_nazev" id="pisemnost_nazev" value="<?=$tmp_pole["nazev"];?>"></td>
<tr><td>Popis:</td><td><textarea name="pisemnost_popis" id="pisemnost_popis"><?=$tmp_pole["popis"];?></textarea></td>
<tr><td>Obsah:<br>(Je možné používat<br>syntaxi <a href="https://www.markdownguide.org/">Markdown!</a>)</td><td><textarea name="pisemnost_obsah" id="pisemnost_obsah" class="text" style="width: 650px;"><?=$tmp_pole["obsah"];?></textarea></td>
<tr><td>Podpis autora:</td><td><input type="text" name="pisemnost_podpis" id="pisemnost_podpis" value="<?=$tmp_pole["podpis"];?>"></td>
<tr><td colspan="2"><input type="submit" name="odeslat" value="Odeslat písemnost!"></td>
</table>
</form>
