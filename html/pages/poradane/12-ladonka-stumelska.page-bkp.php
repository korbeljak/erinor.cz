<?php /*
title = "Stránky LARPu Erinor (pořádané skupinou Pilirion) &ndash; Pořádané - Ladoňka stumelská";
keywords = "larp, erinor, fantasy, dřevárny, roleplay, svět, ladoňka, stumelská";
description = "Stránky LARPu Erinor - sekce pořádané - Ladoňka stumelská";

Sem lze napsat libovolný komentář, nebude zobrazen. Zobrazí se pouze text pod čarou.
----------
*/ ?>
<?php /*
require_once "lib/sql.class.php";
require_once 'lib/hlavni.const.php';
$psql = array(
    "host" => DBSERVER_ADDR,
    "uzivatel" => DB_USER,
    "heslo" => DB_PASS,
    "databaze" => DB_NAME,
    "port" => DB_PORT
);
$db = new Sql($psql);
$post = $db->dotaz("
   SELECT p.id, p.id_kategorie, p.pohlavi, p.jmeno, p.popis, k.nazev as kategorie,
      (
         SELECT COUNT(id) FROM
         erinor.prihlasky WHERE id_postavy = p.id
      ) AS zabrano,
      (
         SELECT COUNT(id) FROM
         erinor.prihlasky WHERE id_postavy = p.id AND schvaleno = 't'
      ) AS schvaleno
   FROM erinor.postavy p, erinor.kategorie k
   WHERE p.id_kategorie = k.id
   ORDER BY p.id_kategorie
   ;
");
if(!$post) echo "AAAA";
$db->outPole($post, $postavy);
$kategorie = "";
$pohlavi[1] = "M/Ž";
$pohlavi[] = "M";
$pohlavi[] = "Ž";*/
?>
<h1>Erinor XII. &ndash;  Ladoňka stumelská</h1>
<p class="r bez ui"><strong class="verze">Organizují: Terka, Kořen</strong></p>
<p>
Ladoňka stumelská je rostlinka porůstající západní svahy pohoří Stumel. Zde stojí hrad pana hraběte Ignase z Ladonbergu. A zde se také odehrává jeden  záhadný příběh. Snad je to vše shoda náhod a nebo osud, to co se stane. Ale zatím nikdo nic netuší, všude vládne klid, ospalá všednost, blahobyt a možná i trochu nuda. 
</p><p>Ale kdeže, začíná být rušno! Hradní pán si pozval na hrad pana hraběte Telleka z Budny, aby s ním projednal podmínky svojí svatby s jeho dcerou a spojil tak dva rody. Jeden bohatý, nový a silný a druhý prastarý, ušlechtilý i vlivný, ale zase chudnoucí. Místní pán je ještě mladý, no tak proč by nebyla veselka. A ta slavná družina, která s pánem z Budny přijíždí! Půlka dvora. To se zase budeme muset činit. Vrchní lokaj poručil úplný masakr v kurnících  na kuřata a lovců v lesích jsou tucty.
</p>
<h2>Obecné informace</h2>
<p>Další díl Erinoru bude menší než obvykle. Půjde o jednodenní LARP, spíše situační/komorní a bude se konat 2.4. na hradě Krašov. Určitě Vás zaujme tajemným, napínavým a dost netradičním dějem. Doufám, že se Vám v prostředí rozlehlé zříceniny hradu nad řekou Berounkou bude líbit. Doprava na místo je tentokrát trochu náročnější, ale nebojte se, zajistíme Vám odvoz až na místo od vlaku pronajatým autobusem. Po hře Vás opět dopravíme na vlak a dále jste zváni na <a href="poradane/1-erinoreni/">Larpově-divadelní večer</a>. O tom naleznete více informací v sekci Pořádané – Erinoření. Po larpově-divadelním večeru bude zajištěno slušné a levné ubytování pravděpodobně v klubovně Senečák v Plzni.
</p>
<h2>Doprava na místo hry</h2>
<p>Hromadně autobusem z rychlíkové stanice Zbiroh (na trati Praha-Plzeň), doporučené spoje a odjezde zveřejníme. Návrat k večeru tamtéž.<br>
<a href="http://www.mapy.cz/#mm=ZTtTcP@sa=s@st=s@ssq=hrad%20kra%C5%A1ov@sss=1@ssp=117759084_126136012_152820844_152694476@x=131158992@y=135485495@z=10">mapa</a>
<p>Cenu hry bude 150 kč včetně dopravy ze Zbiroha a zpět (ta bohužel činí cca 110 kč na osobu, dále něco málo na zapůjčení hradu…) Možná se nám podaří ještě zlevnit, vše závisí na dopravě.
</p>
<h2>Seznam postav</h2>
<p>Přihlásit se lze kliknutím na odkaz proti platnému e-mailu a přezdívce. Po schválení organizátorem přijde mailem upozornění. Po zabrání postavy se kolonka VYŽLUTÍ a po schválení se není možné za postavu přihlašovat.</p>
<table>
<thead>
   <tr><th>Postava</th><th>Pohlaví</th><th>Popis</th><th>&nbsp;</th></tr>
</thead>
<tbody>
   <?php foreach($postavy as $postava):?>
   <?php
   if($kategorie != $postava['kategorie']){
      $kategorie = $postava['kategorie'];
      echo "<tr><th colspan=\"4\">".$kategorie."</th></tr>";
   }?>
   <tr class="<?php if($postava['zabrano'] != 0): ?>zabrano<? endif; ?>"><td><?=$postava['jmeno'];?></td><td><?=$pohlavi[(int) $postava['pohlavi']];?></td><td><?=$postava['popis'];?></td><td><?php if($postava['zabrano'] == 0):?><a href="prihlaseni_postavy.php?id=<?=$postava['id'];?>">Přihlásit</a><? endif; ?></td></tr>
   <?php endforeach; ?>
   <?/*<tr><th colspan="3">Obyvatelé hradu</th></tr>
   <tr><td>Hradní pán</td><td>M</td><td>Hrabě Ignas z Ladonbergu – dobrý vládce a politik, přísný ale spravedlivý, oblíbený svými poddanými i přes svoji rozporuplnou pověst. Požadavkem je bohatý zdobný kostým. (náročnější postava)</td></tr>
   <tr><td>Lokaj</td><td>M/Ž</td><td>pravá ruka hradního pána. Starší velice inteligentní muž ze staré vážené rodiny, má na panství velkou moc. Zajímá se o vědu a alchymii. Doporučujeme bohatší kostým. (náročnější postava)</td></tr>
   <tr><td>Kněz</td><td>M/Ž</td><td>místní duchovní vůdce, vzdělaný muž toužící po vědění, samozřejmě Sciollosovec. Není zdejší, studoval ve městě. S povinnosti mu pomáhá jeho novic.  (náročnější postava)</td></tr>
   <tr><td>Novic</td><td>M/Ž</td><td>zvídavý mladíček, učedník místního kněze. Chytrý a snaživý.</td></tr>
   <tr><td>Kuchař/ka</td><td>M/Ž</td><td>osoba velice přátelská, milá a hovorná. Miluje společnost. Ve svém řemesle je hotový mistr. Stále se dohaduje se svým kuchtíkem. Hráč této postavy bude v rámci role pomáhat něco malého vařit.</td></tr>
   <tr><td>Kuchtík</td><td>M/Ž</td><td>Trochu lenoch, trochu lišák, trochu hodný kluk/holka. Neustále si nechává za něco nadávat kuchařkou.</td></tr>
   <tr><td>Podkoní</td><td>M</td><td>tvrdý muž, pracovitý a skoro vždy vážný. Odvážný, skromný&hellip; a nespokojený.</td></tr>
   <tr><td>Uklízečka</td><td>Ž</td><td>chudá pracovitá slečna, mladá a hezká, kde kdo po ní kouká. Cosi jí hlodá&hellip;</td></tr>
   <tr><td>Strážný</td><td>M</td><td>vysloužilý voják, stárnoucí osamělý veterán mnoha bitev. Hodný na lidi, ale spořádaný služebník svého pána. Požadavkem je vojenský kostým a meč.</td></tr>
   <tr><td>Druhý strážný</td><td>M/Ž</td><td>pilný, snaživý, spořádaný, poslušný a nadšený mladý vojáček. Má rád svoji práci, vždycky bylo jeho snem být tím drsným vojákem v krásné zbroji! Požadavkem je vojenský kostým a meč</td></tr>
   <tr><td>Mistr lovčí</td><td>M</td><td>dobrý lovec, má rád les a rozumí mu. Sympatický mladík, příjemný a čestný. Požadavkem je kostým, ze kterého bude poznat lovce a nejlépe luk/malá kuše.</td></tr>
   <tr><td>Pečovatelka</td><td>Ž</td><td>stará žena, která byla chůvou hradního pána. Hodná tetička, stará se o děti na hradě.</td></tr>
   <tr><td>První dítě</td><td>Ž</td><td>asi 11- leté děvče. Žije ve věži hradu. (záhadná postava – vyžaduje dobré RP a opatrnost, ale také hodně nabízí)</td></tr>
   <tr><td>Druhé dítě</td><td>M</td><td>asi 13-letý chlapec. Žije ve věži hradu. (záhadná postava  – vyžaduje dobré RP a opatrnost, ale také hodně nabízí)</td></tr>
   <tr><td>Páže</td><td>M</td><td>chlapec ze zemanské rodiny, který se od hradního pána učí, jak spravovat panství a za u něj slouží jako páže. Je slušný a pilný. Je také zvědavý, stále se o něco zajímá, čím větší tajemství, tím lépe.</td></tr>
   <tr><td>Pacholek</td><td>M/Ž</td><td>chudý mladík (nebo děvče), který si posluhováním na hradě vydělává na holé živobytí. Je tichý a málo kdo o něm ví alespoň něco. Asi se mu stalo něco zlého, že se skrývá uzavřený v sobě.</td></tr>
   <tr><th colspan="3">Šlechticova družina</th></tr>
   <tr><td>Šlechtic</td><td>M</td><td>Tellek z Budny – postarší důstojný šlechtic, jehož rodina za nejasných okolností přišla k velkému panství a majetku i vlivu, když byl mladý. S léty ale začalo peněz i vlivu ubývat… Chytrý politik, ale nijak moc dobrý v hospodaření. Požadavkem je bohatý zdobný kostým.</td></tr>
   <tr><td>Šlechticova dcera</td><td>Ž</td><td>nádherná mladá dívka. Do vdávání se zatím moc nehrne, chtěla by se raději bavit, navštěvovat velká města, plesy… nudí se. Požadavkem je bohatý zdobný kostým.</td></tr>
   <tr><td>Matka, šlechticova manželka</td><td>Ž</td><td>je známa mnoha ctnostmi. Je zbožná, dobrá matka a vzorná manželka. Ale mnozí tuší, že není se svým životem spokojená. Požadavkem je bohatý zdobný kostým.</td></tr>
   <tr><td>Kněz vyslanec</td><td>M/Ž</td><td>tento ambiciózní mladík byl vyslán úřadem krále, aby sledoval vyjednávání o sňatku a podal o jeho průběhu a výsledcích hodnocení svému pánovi. Plánovaný sňatek je pro království událostí s možným velkým politickým významem. (náročnější postava)</td></tr>
   <tr><td>Druhý kněz vyslanec</td><td>M/Ž</td><td>tento důstojný kněz také přijíždí sledovat jednání, tentokrát jako vyslanec z řad kněží u dvora krále. (náročnější postava)</td></tr>
   <tr><td>Rodinný kněz</td><td>M/Ž</td><td>osobní důvěrník šlechticovy ženy. Naturwanovec. Protiva, hrozný moralista. Vlastně dost lidí ho vážně nemůže vystát…</td></tr>
   <tr><td>Sluha</td><td>M/Ž</td><td>muž s gumovými zády. Jeho rodina má 500 let dlouhý rodokmen sluhů sahající až ke královskému nejvyššímu komořímu. Je na to nafoukaný, jako by byl sám šlechtic. Ale je dokonalým služebníkem svého pána.</td></tr>
   <tr><td>Šašek</td><td>M/Ž</td><td>kdysi se toulal krajem a bavil lidi, teď už ale dlouho slouží svému pánovi, který ho má ve velké oblibě. Umí mnoho podivuhodných kousků a lidé ho mají rádi. O sobě mluví nerad, tvrdí, že celý jeho život je pěkná nuda a proto dělá veselé kousky, aby se zabavil.</td></tr>
   <tr><td>Stráž</td><td>M/Ž</td><td>jeho pán ho zná jako dobrého spolehlivého vojáka. Pro ostatní je to ukrutný prolhaný sukničkář. Je to ale docela fešák a ženských mu projde snad úplně všechno. Mužům přijde buď zábavný a nebo ho od prvního setkání nenávidí.</td></tr>
   <tr><td>Alchymista</td><td>M/Ž</td><td>hradní vzdělanec u pana Telleka. Potrhlý mastičkář, sice zručný ale mimo léčivé masti a lektvary nijak výjimečný. Má rád společnost dobrých lidí, dobré jídlo a víno a třaskaviny.</td></tr>
   <tr><td>Šlechticův synek</td><td>M</td><td>chlapec tak kolem 14 let, strašně všetečný a zvědavý. Je vlezlý, všude strká nos a přitom ho nic nedokáže bavit dlouho. Požadavkem je bohatý zdobný kostým.</td></tr>
   <tr><th colspan="3">Cizí</th></tr>
   <tr><td>Obchodník</td><td>M/Ž</td><td>není místní, obchoduje s drahým zbožím, mastmi, parfémy a skvosty a když se doslechl, co se bude zde na hradě dít, nevál přijet. Služebnictvo se před sebou vzájemně bude chtít blýsknout a tak bude jistě utrácet. Možná něčím zaujme i vznešené paničky… Jeho alfou i omegou jsou PENÍZE.</td></tr>
   <tr><td>Obchodníkův společník</td><td>M/Ž</td><td>klackovité stvoření neznámého původu, pravděpodobně elfí rasy. Nevzbuzuje mnoho důvěry. I když je vždy ke všem velice slušný a dobře pomáhá svému zaměstnavateli, budí v mnoha lidech neopodstatněný (možná) dojem zlodějíčka.</td></tr>
*/?>
</tbody>
</table>
