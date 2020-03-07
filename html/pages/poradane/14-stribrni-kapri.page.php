<?php /*
title = "Stránky LARPu Erinor (pořádané skupinou Pilirion) &ndash; Svět";
keywords = "larp, erinor, fantasy, dřevárny, roleplay, svět";
description = "Stránky LARPu Erinor - sekce svět";

Sem lze napsat libovolný komentář, nebude zobrazen. Zobrazí se pouze text pod čarou.
----------
*/ ?>
<h1>Erinor XIV. &ndash;  Stříbrní kapři</h1>
<p><a href="prihlaseni_stribrni-kapri.php">Přihlašování</a> bylo spušťeno!</p>
<table>
   <tr>
      <th>Přihlášený hráč</th>
   </tr>
   
<?php

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

$nahledy = $db->dotaz("
         SELECT
            p.prezdivka
         FROM
            erinor.prihlasky_stribrnikapri p;
      ");
      if($nahledy){
         $db->outPole($nahledy, $outNicky);
      }
?>

<?php foreach($outNicky as $nick): ?>
   <tr>
      <td><?=$nick['prezdivka'];?></td>
   </tr>
<?php endforeach; ?>
</table>
<h2>Úvod</h2>
 <p>Tento mezidíl Erinoru nebude právě tradiční. Nejedná se o klasický Erinor ze série, v tomto díle nepotkáte žádnou z dosud známých postav a žádná z postav tohoto dílu nebude dále pokračovat. LARP má také trochu jiný rozsah a formu. Místo klasického „Svět“ LARPu půjde o situační hru, tedy hru zaměřenou více na prožívání situace a atmosféry v jednoduché postavě. Hra bude mít jen minimální děj, prakticky jde pouze o prostředí a postavy. Nemá přesně zadaný směr ani cíl mimo vlastního průběhu. V této hře se nebudou používat žádná pravidla, nebudou totiž potřeba. Každý umí co umí jeho postava ze své historie a logiky a vlastní to s čím přišel do hry (mnoho toho nebude). V případě boje se dále používají klasické dřevěné zbraně a zranění se hrají (žádné životy). 
 </p><p>Hra se bude pokoušet navodit jistou atmosféru a hráči by se měli snažit na ní přistoupit. Mnoho věcí ze své logiky nejde změnit, nic se nedá řešit žádnými mechanizmy, jen reálným chováním. Z místa dění nelze uniknout. Nelze vyhrát. Není tu prostor pro trolení, podvádění, munchkinění… Kdo by měl problém vžít se a užít si níže nastíněnou atmosféry a prožívat v ní příběh své postavy, ať raději zváží svoji účast. Varujeme, že hra může být dosti nevyzpytatelná, místy ponurá a trochu psychicky náročná.
 </p><p>Hra je určena především hráčům, kteří už Erinor hráli nebo dalším pozvaným. Pokud chcete někomu ze svých známých ukázat o čem je Erinor nebo přivézt nějakého larpového nováčka, ještě to zvažte. Velký díl na to bude mnohem lepší.
 </p><p>Uvědomujeme si, že na vás klademe velké podmínky a hodně vás omezujeme, je to ale nezbytné pro správný průběh hry a zážitek. Pokud to někomu nesedí, omlouváme se a těšíme se na viděnou na příštím dlouhém Erinoru, který už bude zase „normální“. Děkujeme za pochopení.
 </p>
<h2>Vzhled hry, organizační podrobnosti</h2>
 <p>Hra se bude odehrávat na krásném místě, malém ostrůvku na řece Berounce kousek od Plzně. 
 </p><p>Doporučený způsob dopravy bude doplněn zde. 
 </p><p>Hra začíná v pátek 27.4. po 17:00 od této hodiny je možný příjezd na místo a zapojení do hry. Můžete přiházet až do 20:00, pak už do hry nebude nikdo další vpuštěn (pokud je to problém, ozvěte se). Konec hry je v sobotu kolem 17:00. Následně je možné přesunout se na afterparty s noclehem. (informace k afterparty budou doplněny)
 </p><p>Hra má být vzhledu „stylové fantasy“ (jako Living Fantasy). Znamená to, že vše co si s sebou přinesete musí vypadat alespoň rozumně stylově a to včetně zavazadel a věcí na spaní. Tedy vaky, deky a kožešiny, poháry, misky, úplná kostýmová povinnost. Nelekejte se! Ubytování bude zajištěno v gotických stanech a dalších přístřešcích. „Stylové fantasy“ také není absolutně striktní, jde nám o atmosféru a ne o to, abyste na naší hře vypustili duši. Nikdo nebude řešit vaše oblečení, které nebude vidět pod kostýmem (moira budiž, ale dobře skrytá). Ale věřte, že i stylové spodní oblečení zahřeje. Neřešíme ani původ materiálu, látky u kterých není poznat že jsou umělé jsou ok. Rádi bychom přes to viděli vysoký standart vzhledu věcí. Na jeden den vystačíte s málem. Každý si dále smí přinést plátěný sáček s nestylovými věcmi, které nedokáže po dobu hry postrádat (toaletní papír, kartáček na zuby, léky…). Tento sáček je neherní, ostatní věci jsou vaším herním majetkem. Prosíme – žádné čokoládové tyčinky, zvonící telefony a podobné.
 </p><p>Neberte si s sebou žádné jídlo, je v ceně v dostatečném množství (jídelníček bude zveřejněn před hrou). Pokud máte nějaké zdravotní problémy, kvůli kterým se musíte stravovat specifickým způsobem, přibalte potřebné jídlo do neherního sáčku a nenechte se při jeho konzumaci vidět. 
 </p><p>Na místě bude zajištěna pitná voda. Platí absolutní zákaz vnášení alkoholických nápojů do hry. Ve hře bude k dispozici pro každého nad 18 rozumné množství vína/medoviny pro příjemný zážitek ze hry. Větší množství alkoholu by ale mohlo narušovat chod hry, proto ho tu nechceme.
 </p><p>Vzhledem k výše uvedeným nákladům je cena hry 200 kč.
 </p><p>Během hry předpokládáme od všech účastníků slušné chování! Místo, kde budeme tábořit, leží v přírodním parku a nedaleko bydlí lidé. Neradi bychom měli problémy. Takže zpívání povoleno, řvaní přísně zakázáno! Stejně tak po sobě nenechávejte nikde žádný nepořádek.
 </p>
<h2>Přihlašování</h2>
 <p>Přihlašování bude probíhat na této stránce. Kapacita hry je omezená na 30 osob jak z důvodu atmosféry a hratelnosti, tak i pro výběr tábořiště. Hře nemohou přihlížet žádní nehrající. 
 </p><p>Po vyplnění přihlašovacího formuláře obdržíte potvrzovací email. Od té doby máte 10 dní na zaslání svého „příběhu postavy“ (viz níže, vyplyne z prologu a prozaického popisu) na mail erinor@email.cz. Kdo tak neučiní ve vymezené době, bude z přihlašování odstraněn a jeho místo se uvolní dalším. Přihlašování bude spuštěno 1.4. ve 20 hodin. „Příběh postavy“ s vámi dále probere organizace a případně vám ho pomůže upravit, aby dobře zapadl a byl pro vás pěkně hratelný. Na to už se časové omezení nevztahuje. Nevymýšlejte si prosíme žádné skupinové historie. Do hry budeme pouštět nejvýše dvojice postav, které se znají (páry ano), větši skupinky ne. „Příběh postavy“ posílejte prosím ve formátu .doc, .docx nebo .pdf a v rozsahu ½ - 2 strany A4 (12kou, prosíme ne delší).
 </p><p>U přihlašování najdete také seznam již přihlášených, ať víte, na koho se ve hře můžete těšit.
 </p>
<h2>Pozadí hry</h2>
<h3>Prolog</h3>
 <p>Voda je ochránkyně. Voda je mocná. Tuto pravdu nosíme všichni v sobě, všem je od nejstarších věků známá. Byla zde už před námi a před našimi Bohy. A zůstane až poslední z nás odejdou a Bohové opustí náš svět. Stále tu bude. Moudrá a tichá.
 </p><p>Bëzau neboli Bezawa, to je naše matka. Žili jsme poklidně za její mocnou hranicí své životy až do tohoto pohnutého času. Ani omezení našich náboženských svobod ani válka s elfy nikdy nás nerozrušila a nepohnula našimi životy tak, jako příchod Nemoci do našich zemí. Přišla z jihu, asi od elfů, tedy jistě ze zuboženého jižního Ragadornu. Postupovala městy. Někdy jí trvalo celé týdny, než se objevila o pár kroků severněji, jindy jako by byla zachvácena celá oblast najednou. Postupovala jako vlna k pobřeží, jako stružka vody vyschlým korytem. A lidé začali umírat po stovkách. Nevylidnila celá města, mnozí přežili. Těžko říci, jak si vybírá. Umírají děti a starci sejně jako mladí v plné síle. Bohatí i chudí. Nikdo neví jak se šíří. Možná povětřím… asi ano, to jediné dává trochu smysl. Lidé se pokoušejí utíkat či skrývat se. někomu se to snad podaří, jinému ne.
 </p><p>Žili jsme u Bëzau poklidně až do tohoto prokletého jara, kdy přišla do našeho kraje Nemoc. Nevěřili jsme svým očím. Mnozí z nás přišli o svou rodinu, viděli jsme jak naši blízcí umírají. Jiní od rodin a přátel utekli, aby spasili život či nemuseli sledovat ten zmar. Utíkali jsme do polí, na venkov, do lesů. Ale Nemoc nás stíhala… Většina z nás přišla úplně o všechno. Krajinou se toulá mnoho osamělých duší.
 </p><p>Felčaři se pokoušeli lidem pomoci, ale jejich medicíny a obklady sotva zvládly trochu ulevit trpícím před nevyhnutelnou smrtí. Alchymisti probděli celé týdny ve svých laboratořích do úplného zoufalého vyčerpání ve snaze najít lék. Kněží se modlili, ale k vyléčení jediného člověka nepomohlo nic menšího, než samotný Boží zázrak. To nás Bohové trestají za naši pošetilost a nehodné činy? Nebo nás prostě opustili? 
 </p><p>Pak vtrhli zoufalí lidé do chrámů a vymáhali si pomoc násilím. Mnoho kněžích zabili. Při nepokojích zemřelo i tolik zdravých! Stále mám před očima ty scény, vrací se mi v nočních můrách a bojím se usnout. Umírající na ulicích a živí, zdraví i nemocní plenící kostely, kláštery a chrámy, klečí před knězi, prosí, spílají a pak je věší za krk z věží chrámů…
 </p><p>A zase to samé. Přijde malátnost a únava. Pak horečka a od ní rudé skvrny na kůži. Otoky podpaží a třísel. Obtíže s dýcháním a dušení. Pak přijde umírání… Když začnete pozorovat první příznaky, už je pozdě na cokoli, můžete se jen modlit a doufat, že vám někdo trochu uleví od bolestí a utrpení. Někteří lidé prý nikdy neonemocní, nemoc si jich nevšímá. Ale kdo ví, zda je to pravda.
 </p><p>Co je teď naší nadějí? Jediné, co lidé sledovali, že Nemoc špatně překračuje velké řeky, tedy přes vodu ji musí zavléci nemocní. Voda je natolik silná ochránkyně, že za ní je člověk v bezpečí i před Nemocí. Proto se někteří rozhodli hledat útočiště zde, u ústí Bëzau. Je tu mnoho ostrůvků na kterých snad budeme moci přečkat čas, než řádění naší zhouby poleví. Zde jsme snad konečně v bezpečí.
 </p><p>A tak přicházíme sem, do pohostinství dobrého rybáře Brama a jeho ženy Filin. Tito milí lidé nás přijali na svém ostrově a poskytli svou ochranu asi třicítce uprchlíků. Sešli jsme se tu různí lidé s různými příběhy. Bývalí řemeslníci, kupci, sedláci, bardi i umělci. Bohatí a urození stejně jako sluhové nebo čeledíni z vesnice. Naše příběhy jsou pestré, ale osud je teď stejný. Poprvé po dnech či celých týdnech je nám dovoleno zastavit se na chvíli v bezpečí. Jsme zlomení, jsme tak opuštění! Přišli jsme o všechno, rodiny, přátele, majetek, naše staré životy. Je to minulost! Z ní každému nezbylo víc než příběh, který může vyprávět večer u ohně z naplaveného dřeva. Snad tu na chvíli dojdeme odpočinku a rozptýlení v našem neštěstí. Snad příští ráno už nepřinese další rány, zmar a smrt.
 </p>
<h3>Prozaický popis</h3>
 <p>Na ostrově se sešla skupina uprchlíků z různých společenských vrstev. Každý má svůj životní příběh, který může vyprávět. Tento příběh po vás chceme jako součást přihlašování na mail, jak bylo uvedeno výše. Nemusí jít o parádní povídku, pokud se na to necítíte, do přihlašování stačí i kvalitně rozpracovaná osnova vypravování v bodech. 
 </p><p>Ne každá postava také chce o sobě vyprávět, to už je na vás. Ale každý má co vyprávět, každý je zajímavý. Z osobního příběhu postavy by měla vyplývat i její povaha (tu připojte jako stručné shrnutí za příběh), případně schopnosti, vybavení. Buďte originální, ale dejte si pozor, ať vaše vyprávění sedí do světa Erinoru. Klidně se na nás můžete obrace s dotazy, mnoho k pozadí najdete také na stránkách.
 </p><p>Děj je situován do erinorského roku 1444 ( rok před minulým dílem, cca rok po skončení války s elfy), většina postav žila před svým útěkem na severu Ragadornu (země jejíž jižní část byla zničena válkou a ani sever se nevyhnul strádání), Dargetském středozemí (bohatá, moderní a poklidná země ve středu Federace) nebo na jihu Alderahu (obilnice federace, středně bohatá i rozvinutá, ekonomicky poškozená živením armád, politicky ale posílená).
 </p>
<h3>Reálie</h3>
<p>V následujících článcích si prosím přečtěte něco o pozadí světa, ve kterém se bude hra odehrávat:</p>
<ul>
<li><a href="svet/desetileta-valka-s-elfy/">Desetiletá válka s elfy (1433 &ndash; 1443)</a></li>
<li><a href="svet/alderah/">Alderah</a></li>
<li><a href="svet/ragadorn/">Ragadorn</a></li>
<li><a href="svet/darget/">Darget</a></li>
</ul>

