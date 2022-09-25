title = "Stránky LARPu Erinor (pořádané skupinou Pilirion) &ndash; svět: Lithénský kalendář";
keywords = "larp, erinor, fantasy, dřevárny, roleplay, svět, Lithén, kalendář";
description = "Stránky LARPu Erinor, sekce svět, Lithénský kalendář";

Sem lze napsat libovolný komentář, nebude zobrazen. Zobrazí se pouze text pod čarou.
----------
<h1>Lithénský kalendář</h1>
<h3>Datumové přepočítávadlo:</h3>
<br>
<form action="svet/lithensky-kalendar/" method="post" class="prepocitavadlo dulezite">
&nbsp;Den: <input type="text" name="den"> měsíc: <input type="text" name="mesic"> rok: <input type="text" name="rok">&nbsp;<input type="submit" value="Přepočítat!" name="odeslat">
</form>
<br>
<?php
if(isset($_POST["odeslat"]) && $_POST["odeslat"]==="Přepočítat!"){
   if((int)$_POST["mesic"]>12 || (int)$_POST["mesic"]<1) $chyba = "Neexistující reálný měsíc.";
   elseif((int)$_POST["den"]>cal_days_in_month(CAL_GREGORIAN, (int)$_POST["mesic"], (int)$_POST["rok"]) || (int)$_POST["den"]<1) $chyba = "Neexistující reálný den.";
   else{
      $a = lithenske_datum(adodb_mktime(0,0,0,(int)$_POST["mesic"],(int)$_POST["den"],(int)$_POST["rok"]));
      if($a!==FALSE) echo "<strong class=\"red\">Erinorské datum: ".$a['den'].". den ".$a['tyden'].". týdne ".$a['obdobi']." roku ".$a['rok']."</strong><br><br>";
      else echo "<strong class=\"red\">Dnešní datum ve světě Erinoru neexistuje.</strong><br><br>";
   }
   if(isset($chyba)) echo $chyba."<br><br>";
}
?>

<p>Právě nyní (váženému čtenáři přiblížím, že je rok <?php echo date("Y");?> po Kristu) Erinor píše rok <?php echo getLithenYear();?>. Federace má jednotný letopočet, který uznávají i ostatní civilizované národy se kterými je ve styku. Potřebu počítání roků však nepocítili obyvatelé tohoto území před pouhými čtrnácti stoletími, ale asi před pětadvaceti či sedmadvaceti stovkami let (nedokážeme určit přesně). Potíží v dataci starších událostí je, že až do pomyslného roku 1 tohoto letopočtu počítala se léta vždy po stovkách a pak nanovo. V historických pramenech nejstarších měst a států můžeme nalézt zmínky mnoha událostí datovaných do stejného období, toto však je omylem nepřesného "Stovkového letopočtu", události dělí logicky několik set let (a ne sotva desítka). Počítání našeho letopočtu zahájil kněz Pargmer (podle nejstarších pramenů ze druhého století mág). On sám ve svých spisech (do dnešních dnů se dochoval jen jediný svitek) uvádí jako dědictví svým žákům, aby po roce stém uvedli rok stoprvý. Dnes již nedokážeme s určitostí říci, jak se toto jeho následovníkům podařilo, vše je věcí bádání a spekulací vědců a historiků dnešních dnů. Jasné však je, že už ke konci druhého století většina známého světa užívá letopočet tento, "nestovkový".
</p><p>Dále pak ke kalendáři - rok má 364 dní (s přesností asi 1 hodinu), dělí se na nám známá 4 období: Jaro, Léto, Podzim, Zima (psáno s velkým písmenem na začátku), každé o 13 sedmidenních týdnech.
</p><p>Nový rok začíná počátkem Zimy, dnem zimního slunovratu.
</p><p>Hlavními svátky roku jsou Krátkonoce a Dlouhonoce, tj. oslava nejkratšího dne v roce a též nejdelšího. Nejkratší a nejdelší den v roce jsou plně věnovány motlitbám ke všem božstvům, nejkratší den roku je díkem za rok minulý, nejdelší oslavou života. Následující dny po Krátkonocích a Dlouhonocích lidé slaví, veselí se, hýří a pijí. Dalšími, menšími svátky jsou pak obě rovnodennosti, těmto dnům je přisuzována velká moc nad lidským životem (dříve se považovaly za dny, kdy magie může ovládat svět). V tyto dny nikdo nepracuje, nečiní se důležitá rozhodnutí, většinou se schází celé rodiny nebo větší společnosti přátel ke klidné zábavě. Jistě se slaví i další svátky, to je však věcí různých národů, tyto zde uvedené uznávají všichni obyvatelé federace.
</p>
