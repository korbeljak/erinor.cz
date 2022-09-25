--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: erinor; Type: SCHEMA; Schema: -; Owner: test
--

CREATE SCHEMA erinor;


ALTER SCHEMA erinor OWNER TO test;

--
-- Name: pilirion; Type: SCHEMA; Schema: -; Owner: test
--

CREATE SCHEMA pilirion;


ALTER SCHEMA pilirion OWNER TO test;

SET search_path = erinor, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: kz_postavy; Type: TABLE; Schema: erinor; Owner: test; Tablespace: 
--

CREATE TABLE kz_postavy (
    id integer NOT NULL,
    id_zajmoveskupiny integer NOT NULL,
    jmeno character varying(150) NOT NULL,
    pohlavi integer DEFAULT 0 NOT NULL,
    flagy smallint DEFAULT 0 NOT NULL,
    popis text DEFAULT ''::text NOT NULL
);


ALTER TABLE erinor.kz_postavy OWNER TO test;

--
-- Name: kz_postavy_id_seq; Type: SEQUENCE; Schema: erinor; Owner: test
--

CREATE SEQUENCE kz_postavy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE erinor.kz_postavy_id_seq OWNER TO test;

--
-- Name: kz_postavy_id_seq; Type: SEQUENCE OWNED BY; Schema: erinor; Owner: test
--

ALTER SEQUENCE kz_postavy_id_seq OWNED BY kz_postavy.id;


--
-- Name: kz_postavy_id_seq; Type: SEQUENCE SET; Schema: erinor; Owner: test
--

SELECT pg_catalog.setval('kz_postavy_id_seq', 42, true);


--
-- Name: kz_postavy_skritci; Type: TABLE; Schema: erinor; Owner: test; Tablespace: 
--

CREATE TABLE kz_postavy_skritci (
    id integer NOT NULL,
    jmeno character varying(150) NOT NULL,
    pohlavi integer DEFAULT 0 NOT NULL,
    popis text DEFAULT ''::text NOT NULL
);


ALTER TABLE erinor.kz_postavy_skritci OWNER TO test;

--
-- Name: kz_postavy_skritci_id_seq; Type: SEQUENCE; Schema: erinor; Owner: test
--

CREATE SEQUENCE kz_postavy_skritci_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE erinor.kz_postavy_skritci_id_seq OWNER TO test;

--
-- Name: kz_postavy_skritci_id_seq; Type: SEQUENCE OWNED BY; Schema: erinor; Owner: test
--

ALTER SEQUENCE kz_postavy_skritci_id_seq OWNED BY kz_postavy_skritci.id;


--
-- Name: kz_postavy_skritci_id_seq; Type: SEQUENCE SET; Schema: erinor; Owner: test
--

SELECT pg_catalog.setval('kz_postavy_skritci_id_seq', 20, true);


--
-- Name: kz_prihlasky; Type: TABLE; Schema: erinor; Owner: test; Tablespace: 
--

CREATE TABLE kz_prihlasky (
    id integer NOT NULL,
    id_postavy integer NOT NULL,
    email character varying(150) NOT NULL,
    prezdivka character varying(150) NOT NULL,
    schvaleno boolean DEFAULT false NOT NULL,
    cas timestamp without time zone DEFAULT now() NOT NULL,
    druhapostava integer DEFAULT (-1) NOT NULL,
    poznamka text
);


ALTER TABLE erinor.kz_prihlasky OWNER TO test;

--
-- Name: kz_prihlasky_generic; Type: TABLE; Schema: erinor; Owner: test; Tablespace: 
--

CREATE TABLE kz_prihlasky_generic (
    id integer NOT NULL,
    id_zajmoveskupiny integer NOT NULL,
    email character varying(150) NOT NULL,
    prezdivka character varying(150) NOT NULL,
    vyreseno boolean DEFAULT false NOT NULL,
    cas timestamp without time zone DEFAULT now() NOT NULL,
    druhapostava integer DEFAULT (-1) NOT NULL,
    poznamka text
);


ALTER TABLE erinor.kz_prihlasky_generic OWNER TO test;

--
-- Name: kz_prihlasky_generic_id_seq; Type: SEQUENCE; Schema: erinor; Owner: test
--

CREATE SEQUENCE kz_prihlasky_generic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE erinor.kz_prihlasky_generic_id_seq OWNER TO test;

--
-- Name: kz_prihlasky_generic_id_seq; Type: SEQUENCE OWNED BY; Schema: erinor; Owner: test
--

ALTER SEQUENCE kz_prihlasky_generic_id_seq OWNED BY kz_prihlasky_generic.id;


--
-- Name: kz_prihlasky_generic_id_seq; Type: SEQUENCE SET; Schema: erinor; Owner: test
--

SELECT pg_catalog.setval('kz_prihlasky_generic_id_seq', 63, true);


--
-- Name: kz_prihlasky_id_seq; Type: SEQUENCE; Schema: erinor; Owner: test
--

CREATE SEQUENCE kz_prihlasky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE erinor.kz_prihlasky_id_seq OWNER TO test;

--
-- Name: kz_prihlasky_id_seq; Type: SEQUENCE OWNED BY; Schema: erinor; Owner: test
--

ALTER SEQUENCE kz_prihlasky_id_seq OWNED BY kz_prihlasky.id;


--
-- Name: kz_prihlasky_id_seq; Type: SEQUENCE SET; Schema: erinor; Owner: test
--

SELECT pg_catalog.setval('kz_prihlasky_id_seq', 56, true);


--
-- Name: kz_zajmoveskupiny; Type: TABLE; Schema: erinor; Owner: test; Tablespace: 
--

CREATE TABLE kz_zajmoveskupiny (
    id integer NOT NULL,
    nazev character varying(150) NOT NULL,
    strop integer NOT NULL
);


ALTER TABLE erinor.kz_zajmoveskupiny OWNER TO test;

--
-- Name: kz_zajmoveskupiny_id_seq; Type: SEQUENCE; Schema: erinor; Owner: test
--

CREATE SEQUENCE kz_zajmoveskupiny_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE erinor.kz_zajmoveskupiny_id_seq OWNER TO test;

--
-- Name: kz_zajmoveskupiny_id_seq; Type: SEQUENCE OWNED BY; Schema: erinor; Owner: test
--

ALTER SEQUENCE kz_zajmoveskupiny_id_seq OWNED BY kz_zajmoveskupiny.id;


--
-- Name: kz_zajmoveskupiny_id_seq; Type: SEQUENCE SET; Schema: erinor; Owner: test
--

SELECT pg_catalog.setval('kz_zajmoveskupiny_id_seq', 3, true);


SET search_path = pilirion, pg_catalog;

--
-- Name: alba; Type: TABLE; Schema: pilirion; Owner: test; Tablespace: 
--

CREATE TABLE alba (
    id integer NOT NULL,
    autor character varying(40) NOT NULL,
    jmeno character varying(60) NOT NULL,
    popis character varying(60) NOT NULL,
    datum_pridani timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE pilirion.alba OWNER TO test;

--
-- Name: alba_id_seq; Type: SEQUENCE; Schema: pilirion; Owner: test
--

CREATE SEQUENCE alba_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE pilirion.alba_id_seq OWNER TO test;

--
-- Name: alba_id_seq; Type: SEQUENCE OWNED BY; Schema: pilirion; Owner: test
--

ALTER SEQUENCE alba_id_seq OWNED BY alba.id;


--
-- Name: alba_id_seq; Type: SEQUENCE SET; Schema: pilirion; Owner: test
--

SELECT pg_catalog.setval('alba_id_seq', 31, true);


--
-- Name: clanky; Type: TABLE; Schema: pilirion; Owner: test; Tablespace: 
--

CREATE TABLE clanky (
    id integer NOT NULL,
    autor character varying(40) NOT NULL,
    nadpis character varying(255) NOT NULL,
    popis character varying(255) NOT NULL,
    obsah text NOT NULL,
    datum_pridani timestamp without time zone DEFAULT now() NOT NULL,
    sekce character varying(30) NOT NULL
);


ALTER TABLE pilirion.clanky OWNER TO test;

--
-- Name: clanky_id_seq; Type: SEQUENCE; Schema: pilirion; Owner: test
--

CREATE SEQUENCE clanky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE pilirion.clanky_id_seq OWNER TO test;

--
-- Name: clanky_id_seq; Type: SEQUENCE OWNED BY; Schema: pilirion; Owner: test
--

ALTER SEQUENCE clanky_id_seq OWNED BY clanky.id;


--
-- Name: clanky_id_seq; Type: SEQUENCE SET; Schema: pilirion; Owner: test
--

SELECT pg_catalog.setval('clanky_id_seq', 35, true);


--
-- Name: obrazky; Type: TABLE; Schema: pilirion; Owner: test; Tablespace: 
--

CREATE TABLE obrazky (
    id integer NOT NULL,
    jmeno character varying(60) NOT NULL,
    popis character varying(60) NOT NULL,
    autor character varying(40) NOT NULL,
    original character varying(35) NOT NULL,
    nahled character varying(35) NOT NULL,
    soubor character varying(60) NOT NULL,
    id_alba integer NOT NULL,
    datum_pridani timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE pilirion.obrazky OWNER TO test;

--
-- Name: obrazky_id_seq; Type: SEQUENCE; Schema: pilirion; Owner: test
--

CREATE SEQUENCE obrazky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE pilirion.obrazky_id_seq OWNER TO test;

--
-- Name: obrazky_id_seq; Type: SEQUENCE OWNED BY; Schema: pilirion; Owner: test
--

ALTER SEQUENCE obrazky_id_seq OWNED BY obrazky.id;


--
-- Name: obrazky_id_seq; Type: SEQUENCE SET; Schema: pilirion; Owner: test
--

SELECT pg_catalog.setval('obrazky_id_seq', 519, true);


--
-- Name: tracker; Type: TABLE; Schema: pilirion; Owner: test; Tablespace: 
--

CREATE TABLE tracker (
    id integer NOT NULL,
    predmet character varying(256) NOT NULL,
    popis text NOT NULL,
    typ smallint NOT NULL,
    autor character varying(50) NOT NULL,
    datum_pridani timestamp without time zone DEFAULT now() NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    datum_zmeny timestamp without time zone DEFAULT now() NOT NULL,
    poznamka character varying(256) DEFAULT 'Nevyřízeno'::character varying NOT NULL
);


ALTER TABLE pilirion.tracker OWNER TO test;

--
-- Name: tracker_id_seq; Type: SEQUENCE; Schema: pilirion; Owner: test
--

CREATE SEQUENCE tracker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE pilirion.tracker_id_seq OWNER TO test;

--
-- Name: tracker_id_seq; Type: SEQUENCE OWNED BY; Schema: pilirion; Owner: test
--

ALTER SEQUENCE tracker_id_seq OWNED BY tracker.id;


--
-- Name: tracker_id_seq; Type: SEQUENCE SET; Schema: pilirion; Owner: test
--

SELECT pg_catalog.setval('tracker_id_seq', 17, true);


SET search_path = erinor, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: erinor; Owner: test
--

ALTER TABLE kz_postavy ALTER COLUMN id SET DEFAULT nextval('kz_postavy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: erinor; Owner: test
--

ALTER TABLE kz_postavy_skritci ALTER COLUMN id SET DEFAULT nextval('kz_postavy_skritci_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: erinor; Owner: test
--

ALTER TABLE kz_prihlasky ALTER COLUMN id SET DEFAULT nextval('kz_prihlasky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: erinor; Owner: test
--

ALTER TABLE kz_prihlasky_generic ALTER COLUMN id SET DEFAULT nextval('kz_prihlasky_generic_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: erinor; Owner: test
--

ALTER TABLE kz_zajmoveskupiny ALTER COLUMN id SET DEFAULT nextval('kz_zajmoveskupiny_id_seq'::regclass);


SET search_path = pilirion, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: pilirion; Owner: test
--

ALTER TABLE alba ALTER COLUMN id SET DEFAULT nextval('alba_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: pilirion; Owner: test
--

ALTER TABLE clanky ALTER COLUMN id SET DEFAULT nextval('clanky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: pilirion; Owner: test
--

ALTER TABLE obrazky ALTER COLUMN id SET DEFAULT nextval('obrazky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: pilirion; Owner: test
--

ALTER TABLE tracker ALTER COLUMN id SET DEFAULT nextval('tracker_id_seq'::regclass);


SET search_path = erinor, pg_catalog;

--
-- Data for Name: kz_postavy; Type: TABLE DATA; Schema: erinor; Owner: test
--

INSERT INTO kz_postavy VALUES (1, 3, 'Bývalý starosta vesnice', 2, 9, 'Snaží se najít způsob jak zvládnout
nastalou pohromu, i přes značný odpor ze strany vlastní rodiny. Mnozí si
nejsou jisti zda své úsilí myslí poctivě a nic mu nedají zadarmo.');
INSERT INTO kz_postavy VALUES (3, 3, 'Hlava chudé rodiny', 1, 9, 'Jeho rodina se vždy živila tím, co jí dal les, a pro kterou se tímto takřka nic nezměnilo. Díky tomu, že většinu času tráví v lese, ví o něm mnohé, co neví takřka nikdo jiný.');
INSERT INTO kz_postavy VALUES (4, 3, 'Babka kořenářka', 3, 9, 'Moudrá žena, která je cenným zdrojem znalostí a moudrosti. Přesto, že se s ostatními o své dovednosti a schopnosti ráda podělí, mnozí ji podezřívají, že si toho mnoho nechává pro sebe.');
INSERT INTO kz_postavy VALUES (5, 3, 'Manželka starosty vesnice', 3, 2, 'V mnoha věcech nesouhlasí se svým manželem. Pořádně mu zatápí.');
INSERT INTO kz_postavy VALUES (6, 3, 'Slepá žačka babky kořenářky', 3, 10, 'Vidí mnohé, co ostatním zůstává
ukryto. Navíc to vypadá, že by mohla objevit lék na svou slepotu.');
INSERT INTO kz_postavy VALUES (8, 3, 'Člen chudé rodiny', 1, 12, 'Ví mnohé o lese a o tom, co se děje v
okolí.');
INSERT INTO kz_postavy VALUES (12, 3, 'Mladý syn', 1, 9, 'Po smrti otce a matky na něj najednou padla starost o rodinu, kterou rozežírají vnitřní konflikty. Nenechává se spoutat tradicemi a nebrání
se ničemu novému jen proto, aby zvládl svou roli.');
INSERT INTO kz_postavy VALUES (15, 2, 'Starosta Turgbildu', 1, 1, 'v Ragadornu je vlastizrádce a zde uprchlík. Zbylo mu jen trochu zlata, bohaté šaty a schopnosti, které měl jak starosta bohatého města.');
INSERT INTO kz_postavy VALUES (18, 2, 'Člen doprovodu barona, důstojník', 2, 2, 'Chrání barona, ale také ho hlídá. Vzbuzuje v místních velký respekt prostě proto, že má meč a ví jak ho používat.');
INSERT INTO kz_postavy VALUES (19, 2, 'Člen doprovodu barona, poddůstojník', 1, 2, 'Člen ochranky barona. Také ozbrojený a nebezpečný. Ateista.');
INSERT INTO kz_postavy VALUES (21, 2, 'Člen doprovodu barona', 1, 4, '-');
INSERT INTO kz_postavy VALUES (2, 3, 'Kovář', 1, 1, 'Oportunista, vždycky si hledí svého a v prvé řadě mu jde o dobro své a své rodiny. Pojmy jako morálka a svědomí považuje za prázdné fráze a nenechává se jimi nijak ovlivňovat.');
INSERT INTO kz_postavy VALUES (7, 3, 'Kovářův syn', 1, 2, 'Značně se potatil a stejně jako jeho otci, jsou
pojmy jako morálka i jemu zcela cizí. Pro vlastní zisk by se spojil klidně i se samotným Luciferem.');
INSERT INTO kz_postavy VALUES (27, 1, 'Kovář z městečka', 2, 9, 'Hlava staré a vážené rodiny, jen trochu nerozhodná. Obává se konkurence z vedlejší vesnice.');
INSERT INTO kz_postavy VALUES (28, 1, 'Manželka kováře z městečka', 3, 9, 'Ví, co chce, a má to v hlavě srovnané. Její cílevědomost ale nezřídka přeroste. Považuje manželovu nerozhodnost za neschopnost.');
INSERT INTO kz_postavy VALUES (29, 1, 'Sedlák, hlava rodiny', 1, 9, 'Ač je to prostý sedlák, má zdravý rozum, vidí věci naprosto realisticky. Tradice je mu velmi cenná.');
INSERT INTO kz_postavy VALUES (31, 1, 'Tesař, hlava rodiny', 1, 1, 'Služby tesaře jsou najednou velice žádané! Samy se nové domy nepostaví. Takové povolání najednou nabývá na důležitosti. Jako rodina tesaře. Přemýšlí, jak a jestli využít krize. Pere se v něm morálka s vidinou zisku a i nějaké té moci. Nemá se moc rád se starostou městečka.');
INSERT INTO kz_postavy VALUES (32, 1, 'Mastičkář', 1, 2, 'Člověk s řádně proříznutou pusou, který považuje umění kořenářek za ubohé šarlatánství. Rád vypráví, jak moc je studovaný.');
INSERT INTO kz_postavy VALUES (34, 1, 'Ponocný', 1, 10, 'Podivná existence. Vypráví se o něm spoustu povídaček, moc s lidmi nemluví.');
INSERT INTO kz_postavy VALUES (35, 1, 'Vetešník', 1, 2, 'Známý především tím, že strká všude nos. Zná spousty povídaček, prý ví o skřítcích a dokonce i o nějaké té špíně.');
INSERT INTO kz_postavy VALUES (37, 1, 'Člen sedlákovy rodiny (2)', 1, 4, '-');
INSERT INTO kz_postavy VALUES (16, 2, 'Baronův věrný služebník Skvirelsson', 1, 2, 'Jeho pomocník a opora, přišel sem s baronem dobrovolně, je znám tím, že sbírá vycpané hlodavce, zvláštěpak veverky.');
INSERT INTO kz_postavy VALUES (25, 1, 'Dcera starosty městečka', 3, 2, 'přes tatínkovo ustavičné hlídání je trochu do větru. Navíc jí to tu vůbec nevoní, nejradši by s někým utekla někam jinam, do větších měst, na jih...');
INSERT INTO kz_postavy VALUES (14, 2, 'Baron Herwin-Moirot', 2, 1, 'Vlastní rod ho vyhnal sem kvůli jeho politické prohře na federativní úrovni. Má jistou moc danou majetkem a doprovodem. Ale nemá to jednoduché, přišel o hodně a navíc jeho družina nejsou samí dobří služebníci.');
INSERT INTO kz_postavy VALUES (23, 2, 'Přistěhovalec/Dobrodruh', 1, 4, 'Šablona pro volnou postavu. Může jich být až 10.');
INSERT INTO kz_postavy VALUES (39, 1, 'Kněz Ater', 1, 4, '-');
INSERT INTO kz_postavy VALUES (24, 1, 'Starosta městečka', 2, 1, 'Vážený a důvěryhodný hospodský. Ctí tradice, příchod cizinců a lidí z vedlejší vesnice těžce nese, je ochotný jim pomoct jen tehdy, když nebudou nijak narušovat chod vesnice, přidají ruku k dílu. Střeží dceru jako oko v hlavě.');
INSERT INTO kz_postavy VALUES (11, 3, 'Člen starostovy rodiny', 1, 4, '-');
INSERT INTO kz_postavy VALUES (26, 1, 'Synek starosty městečka', 2, 9, 'Měl by být příštím starostou, alespoň otec se o to snaží. Je trochu zamlklý, rád se prochází v lesích, o městečko a dění v něm se k tatínkově nelibosti zajímá pramálo.');
INSERT INTO kz_postavy VALUES (36, 1, 'Člen kovářovy rodiny', 1, 4, '-');
INSERT INTO kz_postavy VALUES (38, 1, 'Člen tesařovy rodiny', 1, 4, '-');
INSERT INTO kz_postavy VALUES (10, 3, 'Člen chudé rodiny (2)', 1, 12, 'Ví mnohé o lese a o tom, co se děje v okolí.');
INSERT INTO kz_postavy VALUES (33, 1, 'Profesor', 1, 1, 'Zkoumá zdejší skřítky a podivné úkazy, přicestoval už dávno, dožívá tu. Vypráví se, že už to nemá v hlavě tak úplně v pořádku.');
INSERT INTO kz_postavy VALUES (30, 1, 'Člen sedlákovy rodiny', 1, 4, 'Rybář.');
INSERT INTO kz_postavy VALUES (17, 2, 'Členka doprovodu barona', 3, 2, 'Městské děvče na krutém severu. Hledá svého ochránce.');
INSERT INTO kz_postavy VALUES (40, 2, 'Radní Turgbildu', 1, 4, 'Přicestovat sem se starostou Turgbildu, je to jeho bývalý kolega a přítel.');
INSERT INTO kz_postavy VALUES (42, 3, 'Zvoník', 1, 4, 'Hodná člověk, trochu podivín. Za tuto postavu se prosím nehlašte, je vyhlazena pro hráče, který si ji již zamluvil.');
INSERT INTO kz_postavy VALUES (13, 3, 'Člen rodiny bez rodičů', 3, 12, 'Rodina se po smrti otce a matky začíná rozpadat, i přes synovu urputnou snahu. Postava je kvůli své závažné nemoci odkázána na pomoc druhých. Je to mrzák.');


--
-- Data for Name: kz_postavy_skritci; Type: TABLE DATA; Schema: erinor; Owner: test
--

INSERT INTO kz_postavy_skritci VALUES (1, 'Illia Sebes (skřítek)', 2, 'Hlava rodu; Smířlivý, rozvážný stařešina');
INSERT INTO kz_postavy_skritci VALUES (2, 'Baia Sebesa (skřítek)', 3, 'Stará bábuška; Nejstarší z žijících skřítků, říká se že je tak stará že se setkala i s drakem ');
INSERT INTO kz_postavy_skritci VALUES (7, 'Bethlen Cugio (skřítek)', 2, 'hlava rodu; Nejstarší žijící z rodu ');
INSERT INTO kz_postavy_skritci VALUES (8, 'Agnita Cugioa (skřítek)', 3, 'Žena Bethlena; Ráda kontaktuje lidi, zabývá se intenzivně spiritualismem');
INSERT INTO kz_postavy_skritci VALUES (9, 'Petrosani Cughio (skřítek)', 2, 'Brat Bethlena; Zlý a zákeřný, chce se stát hlavou rodu');
INSERT INTO kz_postavy_skritci VALUES (10, 'Salasu Cughioa (skřítek)', 3, 'Mladá, krásná a nerozumná');
INSERT INTO kz_postavy_skritci VALUES (11, 'Ghelari Cughioa (skřítek)', 3, 'Sestra Salasu; Temná a záhadná, moc nemluví ');
INSERT INTO kz_postavy_skritci VALUES (12, 'Raatorfa', 3, 'Malá žena oděná v černé, její život je opředen legendami. Prý je schopná všeho. ');
INSERT INTO kz_postavy_skritci VALUES (13, 'Tetuci', 2, 'Stařec v dlouhém urousaném plášti; říká se, že jeho pohled je tak pronikavý, že vidí do budoucnosti');
INSERT INTO kz_postavy_skritci VALUES (14, 'Berheci (Bahnshee)', 3, 'Sestra Sirzet; Namyšlená, zlá, zákeřná');
INSERT INTO kz_postavy_skritci VALUES (15, 'Sirzet (Bahnshee)', 3, 'Sestra Berheci; Vychytralá, Chamtivá');
INSERT INTO kz_postavy_skritci VALUES (16, 'Zorleni (Saheshee)', 3, 'Prastará víla; Žije na místě už hodně dlouho, je dosti slabá a ví, že se co nevidět rozplyne. Paměť jí však slouží stále výborně');
INSERT INTO kz_postavy_skritci VALUES (19, 'Akurey (Rhutshee)', 2, 'Zajímavý chlapík, který si rád posedí po hospodách a poklábosí. Jeho historky o dalekých krajích jsou naprosto nepřekonatelné');
INSERT INTO kz_postavy_skritci VALUES (20, 'Kattakurgan (Rhutshee) ', 2, 'Je dobrý a rád pomáhá. Věří, že když tomu trochu pomůže, získá v oblasti hodně síly
');
INSERT INTO kz_postavy_skritci VALUES (3, 'Garbou Sebesa (skřítek)', 3, 'Žena Illii; Starostlivá matka, pomáhá skrytě lidem ');
INSERT INTO kz_postavy_skritci VALUES (4, 'Mica Sebes (skřítek)', 2, 'Mladík, který se za každou cenu snaží dostat k lidem, i když už ho to málem stálo život');
INSERT INTO kz_postavy_skritci VALUES (5, 'Coroien Sebes (skřítek)', 2, 'Trochu podivín, jediný z rodiny, kdo se čile stýká s druhým rodem');
INSERT INTO kz_postavy_skritci VALUES (6, 'Botiza Sebes (skřítek)', 2, 'Poslední z synů Sebesových, není moc odvážný a je rád, že se o něj ostatní starají');
INSERT INTO kz_postavy_skritci VALUES (17, 'Tutova (Saheshee)', 1, 'Dříve mocná bytost, z které čas udělal trosky');
INSERT INTO kz_postavy_skritci VALUES (18, 'Eskisahir (Saheshee)', 1, 'Zákeřná bytost, kterou nic nebaví více než rozdmýchávat spory');


--
-- Data for Name: kz_prihlasky; Type: TABLE DATA; Schema: erinor; Owner: test
--

INSERT INTO kz_prihlasky VALUES (2, 23, 'keret@seznam.cz', 'keret', true, '2011-07-26 20:00:59.891986', -1, 'Detaily napíšu do mailu, v případě potřeby zahrání nějaké druhé se domluvíme.');
INSERT INTO kz_prihlasky VALUES (55, 13, 'pechova.aja@volny.cz', 'Ali', true, '2011-09-26 11:09:49.903298', -1, 'Skupina žoldáků(Ragat a spol.)');
INSERT INTO kz_prihlasky VALUES (8, 24, 'jkubata@seznam.cz', 'Jenda (Queldor)', true, '2011-07-26 23:48:16.192171', -1, '');
INSERT INTO kz_prihlasky VALUES (4, 25, 'Lenaaa.a@seznam.cz', 'Liwien', true, '2011-07-26 20:55:24.488589', 11, '');
INSERT INTO kz_prihlasky VALUES (7, 26, 'ivoolorin@seznam.cz', 'Olórin', true, '2011-07-26 21:44:55.119413', 18, 'Co napsat k H postavě... Počítám, že hlavní představu máte vy a až mě s ní seznámíte, rád vyplním bílá místa, budou-li nějaká. Domluvit se pak určitě nebude problém, takže zatím a těším se.');
INSERT INTO kz_prihlasky VALUES (6, 32, 'mich.lea@seznam.cz', 'Lee', true, '2011-07-26 21:04:54.111126', -1, 'Ahoj, jsem začátečník, na larp mě překecal brácha (Olórin). Postavu mastičkářky jsem si vybrala, protože pod ní si dokážu něco konkrétního představit a protože je nebojová. Trochu doufám, že mi pomůže předepsaný rámec. Žádné skryté cíle nemám, chtěla bych hlavně léčit (a možná se naučit mluvit s dušemi). Historii a další asi dodám, až budou hotová i pravidla.');
INSERT INTO kz_prihlasky VALUES (3, 6, 'berk2@seznam.cz', 'Světlo', true, '2011-07-26 20:34:22.456733', 12, ':-)');
INSERT INTO kz_prihlasky VALUES (11, 33, 'alky.kosan@seznam.cz', 'Alky', true, '2011-07-29 21:34:26.200407', 9, '');
INSERT INTO kz_prihlasky VALUES (13, 37, 'nesoenas@centrum.cz', 'Shmoo', true, '2011-07-30 14:04:11.056488', 16, 'Až bude obsazen zbytek rodiny, dáte mi na ně prosím kontakt? Nebo jim na mě... každopádně by bylo fajn při tvorbě postavy vědět, jaké prostředí mě formovalo. Dík a už se moc těším.');
INSERT INTO kz_prihlasky VALUES (14, 27, 'lorddrax@centrum.cz', 'Blizzy', true, '2011-07-30 16:35:11.49049', 1, '');
INSERT INTO kz_prihlasky VALUES (16, 12, 'terkazaba@seznam.cz', 'Žába', true, '2011-07-30 23:30:06.337804', 10, 'Doufám, že když je u mladého syna napsáno M/Ž, znamená to, že to může být i mladá dcera :-)');
INSERT INTO kz_prihlasky VALUES (17, 7, 'chmua.ja@gmail.com', 'Big John', true, '2011-08-01 11:10:58.568637', -1, '');
INSERT INTO kz_prihlasky VALUES (24, 19, 'rancor@centrum.cz', 'Rancor', true, '2011-08-03 21:58:54.766868', -1, '');
INSERT INTO kz_prihlasky VALUES (23, 21, 'alena.durigova@centrum.cz', 'Morwenna', true, '2011-08-03 21:58:43.274025', -1, '');
INSERT INTO kz_prihlasky VALUES (19, 17, 'lepitt@seznam.cz', 'Alienka', true, '2011-08-01 19:43:10.436029', 14, 'už se těším^^');
INSERT INTO kz_prihlasky VALUES (20, 18, 'jakub.ventura@seznam.cz', 'Pachol', true, '2011-08-01 19:49:46.636793', 19, ':P');
INSERT INTO kz_prihlasky VALUES (25, 14, 'mdrahokoupil@email.cz', 'Michal', true, '2011-08-03 22:01:39.291393', -1, '');
INSERT INTO kz_prihlasky VALUES (22, 16, 'Nellmegil@centrum.cz', 'Nellmegil', true, '2011-08-03 21:57:55.597167', -1, '');
INSERT INTO kz_prihlasky VALUES (56, 2, 'radek.novotny@ovbmail.cz', 'Bumbum', true, '2011-09-26 13:41:08.401234', 7, ':-)');
INSERT INTO kz_prihlasky VALUES (18, 36, 'Kapslik@centrum.cz', 'Arien', true, '2011-08-01 13:00:31.176119', -1, 'Mladší bratr kováře. Bývalý voják a šéf místní domobrany.');
INSERT INTO kz_prihlasky VALUES (37, 40, 'Rajchman@gmail.com', 'Tauch', true, '2011-08-20 22:23:15.445196', -1, 'Tak pro velký úspěch znovu :)');
INSERT INTO kz_prihlasky VALUES (38, 31, 'beny-v@seznam.cz', 'Beny', true, '2011-08-27 12:10:57.007377', -1, 'Jako člena rodiny si vemu tu svojí Kate ;-) třeba jako manželka');
INSERT INTO kz_prihlasky VALUES (39, 38, 'madlovka@centrum.cz', 'Kate', true, '2011-08-27 12:14:15.273993', -1, 'Lepší polovička tesaře Benyho');
INSERT INTO kz_prihlasky VALUES (47, 4, 'poubova.ani@centrum.cz', 'Adien', true, '2011-09-12 17:22:01.740118', -1, '');
INSERT INTO kz_prihlasky VALUES (48, 8, 'cwem@seznam.cz', 'Martina', true, '2011-09-12 22:47:14.438458', 8, 'V pátek svoji účast na Erinoru ještě definitivně potvrdím.');
INSERT INTO kz_prihlasky VALUES (43, 10, 'andrewxd@seznam.cz', 'Gemlon', true, '2011-09-07 14:57:16.915327', 6, 'Ahoj Pilly hele jenom bych chtěl vědět jestli mam ještě dotvářet schopnosti a historii postavy a jestli chceš pak poslat i kostým na toho skřítka.');
INSERT INTO kz_prihlasky VALUES (45, 11, 'kuba.simple@seznam.cz', 'Koubes', true, '2011-09-07 21:29:54.958716', -1, '');
INSERT INTO kz_prihlasky VALUES (49, 34, 'gaimi.darai@seznam.cz', 'Darai', true, '2011-09-19 13:02:44.340027', -1, 'Jsem další kus do domobrany s Arienem... Co se týče Druhé postavy nemám s Erinorem dost zkušeností, takže svěřit mi výraznou roli jako je \\&quot;nejstarší rodu\\&quot; mi nepříjde rozumné. Ale jinak se druhé postavě nebráním.');
INSERT INTO kz_prihlasky VALUES (44, 3, 'matej.rott@seznam.cz', 'Mates', true, '2011-09-07 16:14:26.458154', 5, '');
INSERT INTO kz_prihlasky VALUES (50, 42, 'cirila@centrum.cz', 'Ciri', true, '2011-09-21 11:12:55.892018', -1, 'podle předchodí domluvy bych měla hrát zvoníka - vraha');
INSERT INTO kz_prihlasky VALUES (42, 1, 'jansura123@gmail.com', 'Tharos', true, '2011-09-03 13:55:26.639613', 13, 'Druhou postavu bych vzal Tetuciho, jediný problém je, že kostým hlavní i druhé postavy by byl v podstatě stejný :/ Pokud by se našel někdo, kdo by zapůjčil jiný než hnědý plášť, nebyl by problém :)');
INSERT INTO kz_prihlasky VALUES (51, 15, 'S.a.i@seznam.cz', 'Tondach', true, '2011-09-22 07:39:29.947538', -1, '');
INSERT INTO kz_prihlasky VALUES (52, 35, 'kaiserova.da@gmail.com', 'Stopik', true, '2011-09-23 18:31:00.522378', -1, 'Potřebuju půjčit kostým případně zbraň. ');
INSERT INTO kz_prihlasky VALUES (31, 5, 'plysak10@post.cz', 'Karkulka', true, '2011-08-16 09:02:48.781174', 2, 'Chtěla bych i druhou postavu, ale už je možné se přihlásit jen za samé mužské. Budu si pak moct vymyslet nějakou vílu?');
INSERT INTO kz_prihlasky VALUES (54, 39, 'orghtang@seznam.cz', 'Malej Kořen', true, '2011-09-25 19:00:07.248966', -1, '');
INSERT INTO kz_prihlasky VALUES (53, 13, 'katerina.cejkova002@seznam.cz', 'kačka', true, '2011-09-25 10:41:03.7345', -1, '');


--
-- Data for Name: kz_prihlasky_generic; Type: TABLE DATA; Schema: erinor; Owner: test
--

INSERT INTO kz_prihlasky_generic VALUES (25, 1, 'quinej@centrum.cz', 'Nildor', true, '2011-08-24 23:01:51.419299', -1, 'divadelní společnost');
INSERT INTO kz_prihlasky_generic VALUES (26, 1, 'Akelin@seznam.cz ', 'Akelin', true, '2011-08-24 23:03:50.993785', -1, 'divadelní společnost');
INSERT INTO kz_prihlasky_generic VALUES (1, 2, 'finmer@email.cz', 'Finmer', true, '2011-07-26 20:38:21.637733', -1, 'Přistěhovalec/Dobrodruh');
INSERT INTO kz_prihlasky_generic VALUES (5, 2, 'b.koristkova@gmail.com', 'Yavanna', true, '2011-07-27 23:47:47.596418', -1, 'Postava spojená s radním Turgbildu (přihlášen je za něj Tauch), jedná se o dceru jeho obchodního partnera, který nedávno zahynul. Radní si ji vzal do poručnictví. Detaily mailem :)');
INSERT INTO kz_prihlasky_generic VALUES (4, 2, 'ni.perino@centrum.cz', 'Perino', true, '2011-07-27 16:56:44.302205', -1, 'Chci hrat za dobrodruhy spolecne s Keretem, Finmerem, Zagrem a Alkym ale pisou, ze je to obsazeno i kdyz limit je 10 a jsou prihlaseni jen tri... Tak se prosim pekne hlasim.');
INSERT INTO kz_prihlasky_generic VALUES (28, 2, 'jajanovo@centrum.cz', 'Astralien', true, '2011-08-31 20:48:03.686286', -1, 'Ahoj, mluvila jsem s Terkou, že se mám sem přihlášit, ale volné postavy už teď nějsou. Ano druhá postava ženského pohlaví... Jinak zbytek začnu komunikovat asi dál mailem. ');
INSERT INTO kz_prihlasky_generic VALUES (2, 2, 'kolinsky.jan@gmail.com', 'Torque', true, '2011-07-27 15:47:39.660667', -1, 'cizinec/dobrodruh, setting dodam az bude cas...');
INSERT INTO kz_prihlasky_generic VALUES (3, 2, 'Zagro.Kudla@seznam.cz', 'Zagro', true, '2011-07-27 16:35:32.375298', -1, 'Jen připomínám, že jsem ve zkupině s Keretem, Finnem a Perinkou. Alky asi nejede, ale kdyby jo tak by měl být s náma. ');
INSERT INTO kz_prihlasky_generic VALUES (7, 2, 'ocicko14@seznam.cz', 'Isberius', true, '2011-07-29 21:02:59.203629', -1, '');
INSERT INTO kz_prihlasky_generic VALUES (8, 2, 't.par@seznam.cz', 'Tibor', true, '2011-07-29 21:04:12.130597', -1, '');
INSERT INTO kz_prihlasky_generic VALUES (10, 2, 'd.andariel@seznam.cz', 'Pralinka', true, '2011-07-29 21:06:10.964617', -1, '');
INSERT INTO kz_prihlasky_generic VALUES (11, 2, 'johnyelessar@seznam.cz', 'Erumoico', true, '2011-07-30 18:46:48.217311', -1, '');
INSERT INTO kz_prihlasky_generic VALUES (15, 2, 'jakub.popelka@cg-plzen.cz', 'Popy', true, '2011-08-21 21:52:04.273507', -1, 'Skupina žoldáků(Ragat a spol.)');
INSERT INTO kz_prihlasky_generic VALUES (16, 2, 'marasvarc@seznam.cz', 'Ragat', true, '2011-08-21 21:52:06.280856', -1, 'Skupina žoldáků(Ragat a spol.)');
INSERT INTO kz_prihlasky_generic VALUES (17, 2, ' mastterr@seznam.cz', 'Michal', true, '2011-08-21 21:52:08.93214', -1, 'Skupina žoldáků(Ragat a spol.)');
INSERT INTO kz_prihlasky_generic VALUES (13, 2, 'pgerhard@post.cz', 'Ksichtě', true, '2011-08-21 18:30:59.070737', -1, 'Dobrodruh, podrobnosti pošlu v nejbižší době mailem');
INSERT INTO kz_prihlasky_generic VALUES (14, 2, 'bety888@seznam.cz', 'Betty', true, '2011-08-21 19:21:09.404052', -1, 'Dobrodruh, ksichtěcí manželka s bojovým válečkem na nudle a pánví, více v mailu');
INSERT INTO kz_prihlasky_generic VALUES (19, 1, 'Damsonrhee@seznam.cz', 'Damson', true, '2011-08-23 14:44:30.974094', -1, 'divadelní společnost');
INSERT INTO kz_prihlasky_generic VALUES (22, 1, '', '', false, '2011-08-23 22:51:27.823057', -1, '');
INSERT INTO kz_prihlasky_generic VALUES (20, 1, 'Amenophus@centrum.cz', 'Štěně (Amenophus)', true, '2011-08-23 17:51:57.414417', 17, 'skupina: divadelní společnost
(A na té druhé postavě netrvám, samozřejmě kdyby ji chtěl někdo kdo ji má v popisu práce, uvolním ji. Ale kdyby zbyla, ráda se jí ujmu.)');
INSERT INTO kz_prihlasky_generic VALUES (21, 2, 'lucyduskova@seznam.cz', 'Calie', true, '2011-08-23 22:39:59.185097', -1, 'Od Rytířů Ankhu');
INSERT INTO kz_prihlasky_generic VALUES (23, 1, 'Barca.Dvorakova@seznam.cz', 'Shana', true, '2011-08-23 22:53:13.311678', -1, 'Herecká společnost');
INSERT INTO kz_prihlasky_generic VALUES (24, 1, 'LukasJalovec@seznam.cz', 'Waterfall', true, '2011-08-23 22:54:19.868871', -1, 'Herecká společnost');
INSERT INTO kz_prihlasky_generic VALUES (29, 2, 'hunter999@seznam.cz', 'Zozi', true, '2011-09-02 21:55:40.013381', -1, 'žoldáci (Ragat a spol.)');
INSERT INTO kz_prihlasky_generic VALUES (32, 3, 'stanislavrosol@seznam.cz', 'Lord', true, '2011-09-05 21:00:54.104831', -1, 'Detaily pošlu do dvou týdnů trošku nestíhám...');
INSERT INTO kz_prihlasky_generic VALUES (33, 1, 'andreapacholikova@seznam.cz', 'Salix', true, '2011-09-06 14:04:27.8787', -1, 'divadelní společnost');
INSERT INTO kz_prihlasky_generic VALUES (35, 2, 'katcherkatcher@seznam.cz', 'katcher', true, '2011-09-09 12:38:08.681595', -1, '.dobrodruh');
INSERT INTO kz_prihlasky_generic VALUES (36, 2, 'blue.control@seznam.cz', 'Gauthier z Herwinu', true, '2011-09-09 23:28:04.201495', -1, 'už jsem to našel :)');
INSERT INTO kz_prihlasky_generic VALUES (39, 1, 'ciko.rys@gmail.com', 'Aki', true, '2011-09-11 20:41:07.223566', -1, 'Řešeno s Pillym');
INSERT INTO kz_prihlasky_generic VALUES (38, 3, 'cilkaj@seznam.cz', 'Wingy', true, '2011-09-11 18:48:02.561595', 4, 'Druhou postavu volím mužskou, protože ženské už volné nejsou. Charakterově se mi líbí - pokud půjde přehodit na holku, budu ráda (pokud ne, budu nucena si vymyslet vlastní, k čemuž budu asi potřebovat trochu informací).
Pokud na Terku vyhrabu email, pošlu jí během víkendu historii první postavy (mluvily jsme o ní na Pivku). Postava má být provázána s Astralien.');
INSERT INTO kz_prihlasky_generic VALUES (40, 1, 's.skorpio@seznam.cz', 'smolda', true, '2011-09-11 23:50:31.890941', -1, 'Domluveno s Pillym');
INSERT INTO kz_prihlasky_generic VALUES (41, 1, 'Kapslik@centrum.cz', 'Zuzka', true, '2011-09-14 22:55:30.691966', -1, 'Dcera Ariena. (Vek 7 let)');
INSERT INTO kz_prihlasky_generic VALUES (42, 1, 'Boromyr@seznam.cz', 'Racek', true, '2011-09-14 22:56:48.161366', -1, 'člen domobrany');
INSERT INTO kz_prihlasky_generic VALUES (43, 1, 'Schirri@seznam.cz', 'Schirri', true, '2011-09-14 23:00:07.079436', -1, 'Žena kovářova bratra Ariena');
INSERT INTO kz_prihlasky_generic VALUES (44, 1, 'moo_moo@centrum.cz', 'Cvok', true, '2011-09-15 10:13:11.632048', -1, 'Divadelní společnost - senilní rómský spoluobčan more pyčo');
INSERT INTO kz_prihlasky_generic VALUES (45, 1, 'okrouhlikova.lucie@seznam.cz', 'Nessa', true, '2011-09-15 22:52:05.558241', -1, 'elf - alchymista');
INSERT INTO kz_prihlasky_generic VALUES (46, 3, 'wingu@skrypta.eu', 'Win\\''gu', true, '2011-09-18 23:16:55.553724', -1, 'skupina Anwafirin');
INSERT INTO kz_prihlasky_generic VALUES (47, 2, 'k.koncel@seznam.cz', 'Lyoden', true, '2011-09-19 15:44:29.227332', -1, 'Chci být s Balanarem a Raelem :)');
INSERT INTO kz_prihlasky_generic VALUES (50, 3, 'ardevan@seznam.cz', 'Ilinx', true, '2011-09-20 21:37:38.973799', -1, 'patřím k Anwafirin :) o a pokud by Vám vypadla něaká skřítčí postava, tak pro mě asi není problém se jí případně zhostit. ');
INSERT INTO kz_prihlasky_generic VALUES (53, 2, 'biges@centrum.cz', 'Alexandr', true, '2011-09-22 16:20:21.066394', -1, 'Jsem preddomluven (s Ciri) a budu hrat agenta dokoncujiciho svuj vycvik (coz mi docela sedi, jelikoz jsem LARP zacatnecni). Viz email: \\&quot;no a jeden člen takovéto skupiny sem právě přijíždí se svým žákem/žáky, na závěrečnou část výcviku, než je pustí samotné do akce. Zábavu byste si vymýšleli dost sami/proberem to, v rámci toho co by takový federál se svými žáky mohl dělat.\\''');
INSERT INTO kz_prihlasky_generic VALUES (54, 2, 'jelen_343@centrum.cz', 'Adalbert Prskotřesk', true, '2011-09-22 16:24:10.977382', -1, 'Dobrý den. Chci být ve skupině s Iladarem Smrdipuchem a Mistrem Vejtøaskou. Je to skupinka alchymystů. Odesílaly jsme info na erinor@email.cz');
INSERT INTO kz_prihlasky_generic VALUES (55, 2, 'venca830@seznam.cz', 'Iladar Smrdipuch', true, '2011-09-22 16:24:48.540459', -1, 'Dobrý den. Chci být ve skupině s Adalbert Prskotøeska Mistrem Vejtøaskou. Je toskupinka alchymystů. Odesílaly jsme info na erinor@email.cz');
INSERT INTO kz_prihlasky_generic VALUES (49, 2, 'rael.adam@centrum.cz', 'Raell', true, '2011-09-19 15:49:06.857092', -1, 'Chci být ve skupině s hráčem Balanarem a Lyodenem. Máme vlastní zajímavou historii. Jakým způsobem vám ji máme předat? Všichni budeme \\''Místní\\''. 
A ještě bych měl dotázek na táboření,  bude problém bydlet v moderním stanu? ');
INSERT INTO kz_prihlasky_generic VALUES (56, 2, 'radim.valis@gmail.com', 'Vejtřaska', true, '2011-09-22 22:21:25.733311', -1, 'Dobrý den. Chci být ve skupině s Iladarem Smrdipuchem a Adalbert Prskotřesk. Je to skupinka alchymystů. Odesílaly jsme info na erinor@email.cz');
INSERT INTO kz_prihlasky_generic VALUES (57, 1, 'lion.kiara@seznam.cz', 'Kiara', true, '2011-09-23 09:59:41.106181', -1, '');
INSERT INTO kz_prihlasky_generic VALUES (59, 1, 'wiris@atlas.cz', 'Wiris', true, '2011-09-24 23:26:58.283861', 20, 'Zahrádkář');
INSERT INTO kz_prihlasky_generic VALUES (48, 2, 'DHavej@seznam.cz', 'Balanar', true, '2011-09-19 15:47:40.777934', -1, 'Ve skupině s Lyodenem a s Raellem');
INSERT INTO kz_prihlasky_generic VALUES (61, 1, 'weyr@seznam.cz', 'Araden', true, '2011-09-26 16:15:48.098424', -1, 'Tesařův syn');
INSERT INTO kz_prihlasky_generic VALUES (60, 3, 'Zigg.s.r.o@seznam.cz', 'Akris', true, '2011-09-25 18:40:50.620401', -1, 'Anwafirin');
INSERT INTO kz_prihlasky_generic VALUES (62, 2, 'tanjac@seznam.cz', 'Veskra', true, '2011-09-27 21:52:53.855544', -1, 'obchodník na vlastních nohou');
INSERT INTO kz_prihlasky_generic VALUES (63, 3, 'modyCz@seznam.cz', 'mody', false, '2011-09-29 14:50:49.840307', -1, '');


--
-- Data for Name: kz_zajmoveskupiny; Type: TABLE DATA; Schema: erinor; Owner: test
--

INSERT INTO kz_zajmoveskupiny VALUES (1, 'Místní', 21);
INSERT INTO kz_zajmoveskupiny VALUES (3, 'Uprchlíci', 8);
INSERT INTO kz_zajmoveskupiny VALUES (2, 'Cizinci', 27);


SET search_path = pilirion, pg_catalog;

--
-- Data for Name: alba; Type: TABLE DATA; Schema: pilirion; Owner: test
--

INSERT INTO alba VALUES (1, 'Pilly', 'Mrazivý sever', 'První akce na kterou jsme letos vyrazili', '2007-04-25 23:22:21');
INSERT INTO alba VALUES (2, 'Pilly', 'Vláda Chaosu', 'Jednodení akce v praze, která proběhla 24.3.2007', '2007-04-26 17:42:54');
INSERT INTO alba VALUES (3, 'Pilly', 'Beny Larp III  - Válka s nemrtvími', 'Bohužel jsem při akci (z 14.4.2007) nefotil, tak jen pár nar', '2007-04-26 18:32:23');
INSERT INTO alba VALUES (4, 'Petr', 'Český Pán prstenů', 'Veverské Knínice, Morava, 11.-13.5. 2007', '2007-05-13 20:40:58');
INSERT INTO alba VALUES (5, 'Pilly', 'Tol - in - Gaurhoth 2007', 'Koukalova hora, 25-27.května 2007', '2007-05-28 22:00:12');
INSERT INTO alba VALUES (6, 'Světlo', 'Světýlčí album', 'teď návrhy vlajky, časem možná něco dalšího', '2007-06-06 10:31:18');
INSERT INTO alba VALUES (7, 'Pilly', 'Bitva Pěti armád 2007', '1.-3.6.2007 Doksy', '2007-06-06 19:22:01');
INSERT INTO alba VALUES (8, 'Pilly', 'Tongur 2007 ', 'Domaslav 15.-17.6.2007', '2007-06-19 21:18:52');
INSERT INTO alba VALUES (9, 'Pilly', 'Křest Ohněm', 'Chotěboř, 4.-8.července 2007', '2007-08-08 14:35:27');
INSERT INTO alba VALUES (10, 'Pilly', 'Florie 2007 - Přístav Ostrie', 'Sklené nad Oslavou, 20 - 26.7. 2007', '2007-08-13 13:20:46');
INSERT INTO alba VALUES (11, 'Alky', 'Kočovná divadelní společnost', '...a že prý život herce není žádná legrace:)', '2007-08-31 12:07:52');
INSERT INTO alba VALUES (12, 'Alky', 'Dark Zagro', 'Zagro se mění...', '2007-10-20 15:52:14');
INSERT INTO alba VALUES (13, 'alky', 'Bitva pěti armád 2008', 'Velká mela pro velké skřety...', '2008-06-24 14:10:09');
INSERT INTO alba VALUES (14, 'Alky', 'Carpe 7. -11. 5. 2008', 'Jak se hamouní moc...', '2008-05-13 17:17:19');
INSERT INTO alba VALUES (15, 'Pilly', 'Ostrie 2008', 'Pochválena budiž bohyně Nanta Kranta', '2008-08-15 16:07:03');
INSERT INTO alba VALUES (16, 'Pilly', 'Erinor - Chrám pokroku', '5.-7.9.2008', '2008-09-08 22:34:34');
INSERT INTO alba VALUES (17, 'Pilly', 'Fenmar ', '31.7.-2.8.2009', '2009-10-15 21:13:00');
INSERT INTO alba VALUES (19, 'kořen', 'Abcde', 'asc', '2010-07-08 11:53:57.784806');
INSERT INTO alba VALUES (20, 'Pilly', 'Carpe 2010', 'Tišnov 2.-6.7.2010', '2010-07-08 12:09:09.768838');
INSERT INTO alba VALUES (21, 'kořen', 'PIVKo 2010', 'Plzeňský inspirační víkendový kurz', '2010-09-04 12:02:17.39663');
INSERT INTO alba VALUES (22, 'Pilly', 'KP 2010 - Skřetí soud ', '8.-10. 10. 2010 Sión', '2010-10-13 21:14:42.960492');
INSERT INTO alba VALUES (23, 'Pilly', 'Bezkrálí XII. - Hra královen', '5.-8. 8. 2010 Žlutý kámen v Ralsku', '2010-10-13 21:33:11.102025');
INSERT INTO alba VALUES (24, 'Pilly', 'Dlouhonoc 2010', '17.-19.12. 2010', '2010-12-28 11:33:41.149631');
INSERT INTO alba VALUES (25, 'Alky', 'Skřetí masky', 'Ukázka z workshopu', '2011-01-28 17:45:27.09394');
INSERT INTO alba VALUES (26, 'Pilly', 'Tenkrát v Danielsu', '12.3.2011 foto z herní hospody', '2011-03-13 22:20:55.894978');
INSERT INTO alba VALUES (27, 'Pilly', 'Erinoření 1', '2.4.2011 Komorní larp Bodlák', '2011-04-04 11:02:50.462157');
INSERT INTO alba VALUES (28, 'Pilly', 'Larpově-divadelní večer ', '2.4.2011 ; součást Erinoření 1', '2011-04-04 11:13:03.298881');
INSERT INTO alba VALUES (29, 'keret', 'Pilirion a přátelé v roce 2010 :)', 'všehochuť', '2011-04-16 22:15:01.545809');
INSERT INTO alba VALUES (30, 'Pilly', 'Pustina XI - Divide et Impera', 'Častotice u Náměště n.O., 12.-19.8. 2011', '2011-08-17 12:26:52.859876');
INSERT INTO alba VALUES (31, 'Pilly', 'Svatba', 'Náměšť nad Oslavou, 27. 8. 2011 ', '2011-09-05 19:25:05.843773');


--
-- Data for Name: clanky; Type: TABLE DATA; Schema: pilirion; Owner: test
--

INSERT INTO clanky VALUES (1, 'Pilly', 'Další sraz', 'Navrhuji další srazv týdnu před PPč', 'Je třeba, aby jsme zaplatili účastnický poplatek na PPč - 90Kč. Já to za vás zaplatím a peníze by jste mi dali na srazu před PPč. Navrhoval bych se sejít v úterý 8.5. nebo ve čtvrtek 10.5. Dořešili by jsme tam jak pojedeme, atd. Kdy a kde se přesně sejdem se domluvíme po ICQ.', '2007-04-26 19:13:48', 'soukrome');
INSERT INTO clanky VALUES (2, 'Terka', 'ad sraz', 'termín', 'Byla bych pro sraz ve čtvrtek 10.5. Co takhle vyrazit v rámci srazu na chvíli ven a trochu si zašermovat?', '2007-04-27 15:40:30', 'soukrome');
INSERT INTO clanky VALUES (3, 'Terka', 'Před PPČ', 'pro ty co jedou na PPČ a taky zájemce o Tol -in -Gauroth', 'Ahojda. Kdo byste potřebovali nějak pomoct s kostýmem na PPČ, tak se ozvěte, můžeme to zkusit příští týden nějak vyřešit. Kdo by taky chtěl ještě nějaké látky, tak 4.5. se pohybuju po Praze, dá se tam sehnat leccos hlavně velmi levný dyftýn nižší kvality v obvklých barvách a všemožné barvy kvalitních látek.
Pro vás, kdo máte čas 25.-27.5. tak se koná někde poblíž Berouna LARP Tol - in - Gauroth, mezi pořadateli je mimo jiné napsaný i jeden náš známý (Lex). Nezaručuju 100% kvalitu, ale nejspíš tam pojedeme, nemuselo by to být špatné. Tak kdo máte zájem se koukněte na http://bitva.mysteria.cz/ a vymyslete si postavy (co nejdříve).', '2007-04-27 15:46:28', 'soukrome');
INSERT INTO clanky VALUES (4, 'Terka', 'PPČ', 'Tak jaké jsou ohlasy?', 'Tak jak se vám líbilo? Příští rok bych jela zase, kdyby byla možnost. Jaké máte dojmy z první velké bitvy? Zkuste někdo napsat nějakou recenzi... Díky :-)
PS: ozvěte se Pillymu nebo mě jestli budete chtít poslat látku na ty černocervené varkoče.', '2007-05-13 16:40:40', 'soukrome');
INSERT INTO clanky VALUES (5, 'Pilly', 'Výroba - varkočů, štítů', 'Pár slov k tomu na čem jsme se domlouvali', '<b>Štíty</b>ptal jsem se na tu překližku a příští týden se objedná a vyříznutí kruhu trvá chvilku. Co se nákladů týče, tak záleží na počtu štítů - já sám budu chtít dva. Bude se jednat o kruhy s průměrem 50 - 55cm. budou vyřezávány z 12mm překližky, deska má cca 2*2m (vejdou se na ní čtyři ty štíty) a stojí asi 400Kč - takže asi 100Kč na jeden štít + zhruba 20Kč za to vyříznutí. Cena by se teda měla pohybovat tak od 120 do150 Kč. Potřeboval bych vědět kdo bude štít bude chtít nejlépe do pondělí. 
<b>Varkoče</b>ti kdo měli zájem o \\"skupinové\\" černo-červené varkoče, domluvte se s Terkou na tom, kolik je čeho třeba - mám dojem, že se veje na jednu šířku, takže stačí koupit délku dyftýnu jen o málo větší než délku varkoče. + červený dyftýn na lemy. Všechny objednávky na štít, nebo látku na varkoče mi posílejte na mejl.   ', '2007-05-17 23:02:34', 'soukrome');
INSERT INTO clanky VALUES (6, 'terka', 'levné látky', 'tohle si určitě přečtěte!!!', 'Našli jsme prodejnu velice levných látek všeho druhu v Bolevci. Dají se tam koupit silné bavny kolem 70kč, 100% len za 80, různé polyestery a příměsovky od 40 do tak 150 za metr a hlavně slušná vlna na pláště, kápě a podobně, vetšinou s větší přímesí (lepší vlastnosti, míň lf) tak 160-200/metr. Jediné co je trochu horší je výběr barev, ale dá se, stojí to za vidění. Chceme tam někdy brzy vyrazit nakupovat a kdo sháníte látku na nějaký kostým tak se ozvěte a pojďte s námi!', '2007-05-24 21:18:31', 'soukrome');
INSERT INTO clanky VALUES (7, 'Světlo', 'happy', 'tak už to mam za sebou...', 'takže už zase začínám být plnohodnotně aktivní - maturu mám za sebou, dokonce velmi dobře, navrhněte solidní termín, kdy bysme to mohli jít oslavit někam, ... no prostě někam :-) . zvu vás. (pokud to nebude 4., 5., 12., 18.6. tak můžu vcelku kdykoliv ;-) )
tak zatim papapa S.', '2007-05-25 17:29:41', 'soukrome');
INSERT INTO clanky VALUES (8, 'chrumkavázeleninka', 'Látky', 'akce látek', 'Slyšel jsem, že je na klatovský totální výprodej látek (asi v Hassu nebo jak se to jmenuje). Ještě jsem tam nebyl, ale možná by se tam našlo něco pěknýho', '2007-06-04 21:19:38', 'soukrome');
INSERT INTO clanky VALUES (9, 'Pilly', 'Tol - in - Gaurhoth ', '25.-27.5.2007
', '
-Místo konání: Koukalova hora nedaleko Berouna - Popovice
-Akce se zúčastnilo cca 30 hráčů; z Pilirionu se účastnili Alky a Pilly
-Home: http://bitva.mysteria.cz

Skromné osvětlení děje: Hra začala v sobotu po desáté. Začátek hry nebyl přesně určen naráz a tak se rozbíhala celkem pomalu. Počáteční děj se točil kolem získání vhodného vodního zdroje pro město Otrapov. 
    Podařilo se postavit odsolovací aparaturu na vodu z moře a byl objeven nový pramen. Voda však stále nedostačovala a místní řeka vyschla. Já společně s šamanem jsme se vydali hledat důvod, a našli. Puklinový pramen řeky byl zavalen. Výbušninou od alchymisty Corwina byla část závalu odstřelena. Objevil se však další problém. V puklině seděla obří žába.
    Další děj se odehrával kolem různých skupin lidí a vytvářel tak několik paralelních dějových linií.
   V neděli se pokračovalo. Od rána běžel děj značným tempem a jak už tomu bývá poslední dvě hodiny byl opravdu nabitý. Akce vyvrcholila soubojem Spáče a Taaroga na zbytkách hranice, na které měl být Taarog upálen. Společně ještě s následným povstáním Licha došlo k celkové apokalypse města Otrapov. V tuto dobu již skupinka dobrodruhů, jejíž součástí jsem byl já i Corwin, utekla do Kaladu. Z nějž se dále přesouvala směrem do Plavska.


Můj celkový názor na akci je velice kladný. Hru jsem si opravdu užil se vším všudy. Každý kdo měl zájem si zahrát, dostal dostatek prostoru.
     Hra se v jednom okamžiku zastavila. Způsobilo to příšerné horko v kterém se nedalo téměř nic dělat. Ovšem samozřejmě záleželo na hráčích. Vždycky se najde někdo, kdo se na to vykašle a kopří. Jako jediný vroubek bych viděl malý počet orgů na příliš veliké herní území, takže je bylo někdy dost těžké sehnat.
   Co se kostýmů na akci týče byl to takový průměr. Byly vidět kostýmy nádherné i opravdu pochybné.  
', '2007-06-06 21:19:45', 'recenze');
INSERT INTO clanky VALUES (10, 'terka', 'Vozíček', 'Pilly sehnal vozík na divadlo', 'Pillymu se povedlo sehnat vozík na divadlo, je to 1700,-, loukoťový 45x100 cm a malý dvoukoláček, oba dost staré. foto: http://ostatni.bazos.cz/inzerat/659737/Detske-voziky-s-loukotovymi-koly.php . Je to z HK, ale snad by byl i s dovozem. Představa je taková, že se složíme (bylo by to cca 200-250 na havu) a snad se i část toho od dobrých lidí vrátí.', '2007-06-13 19:58:34', 'soukrome');
INSERT INTO clanky VALUES (11, 'Pilly', 'Bitva pěti armád', '1.-3.6.2007 Doksy', '<H3 ALIGN=\\"CENTER\\">Bitva pěti armád</H3>
&nbsp;&nbsp;&nbsp;Na letošní B5A nás vyrazilo 6 - Pilly, Světlo, Zagro, Kořen, Petr a já - za Torqusharské skřety. Po náročné cestě jsme postavili gotičák, zaregistrovali se a po jídle už jsme zůstali ve stanu, tahali ze šíši bavili se neskřetí rozjemnělou mluvou.<BR>
&nbsp;&nbsp;&nbsp;Ráno jsme vstávali brzo, oblékli se do kostýmů a vytvořili také kostým na Petra, kterému jsme zapomněli přivézt varkoč. Skoro všichni jsme byli za pěkné kostýmy ohodnoceni pár trofejemi do začátku, dokonce i Petr ve zbytcích a hadrech z ostatních kostýmů. Samotná bitva začínala myslím v deset. Jeden z prvních qestů byla obrana mostu. Dokud stála v první linii těžko zničitelná žoldácká kompanie, drželi jsme se. Jak ale začínal jejich počet slábnout, byla sranda. Asi bychom most ubránili kdyby nám nevpadlo několik lidských jednotek do zad. Pokračovalo více úspěšných i neúspěšných potyček.<BR>
&nbsp;&nbsp;&nbsp;Po poledni jsme se se Světlem zúčastnili volby miss a bojovali tak za práva národů \\"jinak krásných\\". My čtyři skřetice na naší straně jsme se předvedli v nejlepším, krásky dobra jsme zastínili natolik, že i ovlivněná porota nám dala šanci. Nakonec volbou osudu ale vyhrála slečna z lidské armády. Pak nás musela Světlo opustit a vyrazit domů. My jsme se chytili náhodou kolem jdoucí celé temné armády a účastnili se tažení, po kterém nezůstalo jediné město světlé straně. Po drtivém vítězství jsme se stáhli a dali nepříteli novou šanci. K mému údivu se oproti minulým rokům už nekonaly boje o Šmakův poklad - to až v neděli. Když končil den, vypadalo to, že se vítězství kloní na naši stranu.<BR>
&nbsp;&nbsp;&nbsp;Večer jsme se potkávali se známými, Kořen spal a ostatní tlachali u ohně a pak jsme ještě dlouho do noci tahali v gotičáku s Annie.
Ráno bitva pokračovala. Byly před námi ještě další qesty ke splnění, hlavně ten nejlepší - poklad draka Šmaka. Tahle bitva byla poslední v celé hře - každá armáda dostala 150 životů k doléčení, jen světlá měla tu smůlu, že brzy přišla o krále, nositele této schopnosti. Tak jsme tlačili dobro nejméně čtvrt hodiny, až jsme se přez poslední hrstku trpaslíků dobyli k pokladu.<BR>
&nbsp;&nbsp;&nbsp;Do závěrečné bitvy jsme vstupovali se 6 životy, Gundabal také, Vrrci s 5, dobro pak myslím vždy o jeden život více. Hlavní slabinou temné byla však klasická neúčast asi čtvrtiny armády, někdo odjel domů, jiní leželi s kocovinou. Strana dobra zvítězila stejně jako minulé dva roky. Já jsem si závěrečku moc neužila, protože jsem od jednoho tak třináctiletého klučíka dostala do nosu tak, že ani po čtrnácti dnech není u pořádku.<BR>
&nbsp;&nbsp;&nbsp;Celkově strany hodnotím jako dobře vyrovnané, hru organizátorsky skvěle propracovanou. Změna v pravidlech o zvýhodnění těžkooděnců není špatná, ale osobně bych rády viděla nějaké vyrovnání pro temnou, k které se pláty hodí méně. Letos se nám podařilo se dostat do dobré armády se schopným velením, což je velice důležité pro zážitek ze hry, takže díky Same, Armoriku a generálové. Dále bych ráda kladně ohodnotila vzrůst úrovně kostýmů, který byl od loňska dost patrný a mírné zvýšení průměrného věku účastníků. I počasí tentokrát objednali organizátoři alespoň dostatečné, pršelo vždy jen těsně do začátku hry. Tedy ve výsledku, tohle byla jedna z mých nejlepších bitev, které jsem navštívila.
<p ALIGN=\\"RIGHT\\">Terka
', '2007-06-19 22:10:24', 'recenze');
INSERT INTO clanky VALUES (12, 'Pilly', 'Florie 2007', 'Sklenné nad Oslavou, 20. - 26. 7. 2007', '<H3>Florie 2007 - přístav Ostrie</H3>
&nbsp;&nbsp;&nbsp;Do města Ostrie se letos vydal celý Pillirion, navíc obohacen o Petra. Plni očekávání jsme přetrpěli pekelně dlouhou cestu a dorazili na malou loučku, kde se hra měla odehrávat. Zbudovali jsme si ležení v gotičáku (ležení se časem přeměnilo na neskutečný bordel) a sledovali další přijíždějící účastníky.<BR>
&nbsp;&nbsp;&nbsp;Ráno, jen co byla zahájena hra, nastal čas drobného zmatkování, když organizátoři zjišťovali, co všechno nemají pod kontrolou. Tím pádem byl i pomalejší rozjezd hry, ale to se na akci takového typu dá předpokládat. Když už jsem naťukl organizátory, tak musím uznat, že byli velmi vstřícní a snažili se všechny drobné problémy odstranit co nejdřív. Bohužel, jelikož pravidla se nejspíš od Zlatého věku nezměnila a účastníků ubylo, tak velká část hry stagnovala. Ekonomika stála a řemeslníci mřeli hladem. I šlechta měla leckdy hluboko do kapsy. Prakticky celá hra se během několika hodin přeměnila pouze na vyskou politickou hru, ve které se obyčejný hráč ztrácel a byl jen pouhou loutkou. Jediným uklidnění může být to, že těchto hráču moc nebylo - víc jak polovina hráčů byla šlechtici, vysokými představiteli církve nebo rodin.<BR>
&nbsp;&nbsp;&nbsp;To všechno však neznamená, že by se člověk nemohl bavit. Konala se spousta zajímavých akcí a fungovalo několik herních míst, která hru alespoň trochu spestřovala. Nicméně nebyl jejich potenciál kvůli charakteru celé hry plně využit. Z míst bych rád jmenoval alespoň casino, poštu, seznamovací kancelář, lazebnictví a drbárnu, která vtipně zaznamenávala důležité události města. Co se týče událostí tak ty byli hodně pestré: sčítání lidu, galerie obrazů největších osobností města či galerie Corpus pictus, stanné právo a samozřejmě spousta poprav. Největším a nejsladším bonbonkem ale určitě byla volba Mistra krásy Ostrie 2007, u které bych se rád pozastavil. Soutěžili mezi celkem 4 gentlemani v několika disciplínách počínaje vyznáním lásky a konče volnou disciplínou. Vše za odborného posudku čtyřčlenné dámské poroty. Řekl bych, že i přestože jsem byl pouhým divákem, tak toto byl nejsilnější zážitek z celé hry.<BR>
&nbsp;&nbsp;&nbsp;Jak hra postupovala, tak se mocní mezi sebou stále více dohadovali, církve se navzájem označovali za kacíře, pašovalo se a umíralo. Rodiny začali tvořit hloučky a poltické boje vrcholily. Naneštěstí jsem si k nim téměř nepřičuchl a tím pádem jsem celé toto období, stejně jako mnozí další, prokopřil. Přesto všechny nedostatky je Florie zajímavou skušeností. Snad se jednou vrátí její bývalá sláva a věci se zlepší…<p>
Alky', '2007-08-08 14:21:49', 'recenze');
INSERT INTO clanky VALUES (13, 'terka', 'Jednotka', 'Návrh na jednotku na B5A 2008', 'Na MT jsme se  spolu s Pillym bavili s Finem ze Svobodné a máme takový společný návrh na jednotku na b5A na příští rok (tedy pokud vyjde termín po našich maturitách, ale možná i tak). Šlo by o temné trpaslíky (pod trpasličí armádou ale samostatná jednotka); měli bychom pojízdný prak. stejnokroj černo stříbrný, nějaké ty prvky zbroje, stříbrné vousy... to je na dohodě. Možná jednotné malé kuše. Tahle jednotka by se dala použít i různě jinde.
Kdyby byl zájem, napíšu víc nebo uděláne sraz a domluvíme se.
Pozor, nepište o tom nic určitého do veřejného fóra někdo by nám to moh ukrást!!!', '2007-09-24 22:33:27', 'soukrome');
INSERT INTO clanky VALUES (14, 'terka', 'run v Plzni', 'Mia pořádá run', 'Takže jak jsem se vás nezávazně ptala v srpnu jestli byste měli zájem zkusit si zahrát shadowrun, tak je to tu. Mia tady v Plzni připravuje run, probíhal by od 1.11. několik odpolední nebo večerů. Potřebuje hráče. Tak se ozvěte jak jste na tom. Blišší info můžu dodat. Na cp se těšte na Danaketha, Karkula a další.', '2007-10-09 20:43:26', 'soukrome');
INSERT INTO clanky VALUES (15, 'terka', 'Mia - run', 'kontakt', 'Mia mob:728998547
Hofy: MIANNA', '2007-10-18 21:12:26', 'soukrome');
INSERT INTO clanky VALUES (16, 'sirkubador', 'Funguje nebo neunguje', 'test', 'test', '2007-10-28 17:04:18', 'soukrome');
INSERT INTO clanky VALUES (17, 'Terka', 'Kyselá prdel', 'Co nám Keret nabízí', 'Chtěla jsem vám tu přiblížit na čem jsme se zatím domluvili s Keretem na tu Kyselou prdel. Prý uvidí ještě co na to řekne Fin, ale podle Keretovo představ a toho co bysme rádi mi to vypadá takhle:
V tom světě zijou lidi v jeskyni a teď jsou v situaci že se výpravy odvážlivců dostávají ven a  hledají nové místo, kde by se dalo žít bezpečněji. Venku žijeme my (prý bysme ale měli být skřeti) vklidu ve svý vesnici, ale najednou se nám tam začali kvartýrovat lidi. Naši skřeti by každej měli svojí postavu a prostor pro hraní, Keret slíbil i qesty pro skřety, jen by potřeboval abysme mu tam čas od času zahráli někaý to CP, jinou bestii nebo co by potřeboval. 
Tak by mi zajímalo co vy na to, jestli by se vám to takle zamlouvalo. Pls ozvěte se mi. ', '2008-01-27 18:48:20', 'soukrome');
INSERT INTO clanky VALUES (18, 'Světlo', 'Kyselá Prdel', 'Světe div se, skřeti jsou príma banda...', 'Tak jsem se právě dala trochu do kupy a koukám, kde nic - tu nic. Tak je to tedy nejspíš na mě:
O víkendu (11.-13.4.2008) jsme se ve zmenšeném počtu, tedy Terka, Alky, Kořen a moje maličkost, zúčastnili akce pořádané Finem a Keretem a nazvané Kyselá Prdel. 
Celé to začalo v pátek, kdy se někteří vzdali posledních hodin školy, ve 2 hodiny odpoledna na vlakovém nádraží v Plzni. Za pomoci Pillyho jsme dostali veškerá naše fidlátka do vlaku, zamávali jsme mu a vyrazili. Měli jsem poměrně štěstí a tak se nevyplnilo ani okřídlené "F...ing czech trains, it''s like in India..." a my jsme našli i dost místa na sezení. 
Na louku jsem dorazili ještě za světla. Seznámili se s ostatními hráči (což nebyl takový problém neboť celé osazenstvo čítalo včetně orgů a nás 12 lidí, ... no, ehm, lidí...) a postavili si stany. Nakonec jsem se rozhodli, že v rámci úspory tepla bude bagáž v jednom a my v druhém. Sotva jsme spáchali stany a večeři, padla tma, vytáhla se kytara a šíša a bylo nám dobře. Pak se ještě dohodli postavy, proběhla úvodní scéna, dlabalo se a zpívalo, až jsem postupně odpadli.
Ráno jsme se vzbudili relativně brzy. (Musím přiznat, že noc skutečně stála za to. Foukal silný vítr a stromy  kolem hučely tak silně, že by se mohly měřit i s hlukem mezinárodního letiště.) Rychle jsme se převtělili do svých skřetích podob a hra mohla začít. Prověřila naši skřetí vytrvalost, odhodlanost a postřeh a stylem <i>hory, doly, černý les </i>nás seznámila s nádherným okolím hradu Sion. Kdo chtěl, zábavu si našel, qestů bylo tak akorát a někteří (já, Terka a Kořen) ještě večer dohrávali u ohně, když už ostatní kopřili. Pak se dopíjelo, dojídalo a tahalo až dlouho do noci.
V neděli jsme vstávali na budíka v téměř neskřetí hodinu. Sbalili jsme se, najedli a když se nikdo neměl ke vstávání, napsali jsme děkovný dopis, zamávali chrápajícímu táboru a vydali se na vlak.

Osobně jsem si hru velice užila, byla dobře propracovaná a na pěkném místě (škoda že je to z Plzně tak daleko). Jedinou chybou byl podle mě malý počet hráčů, ale věřím, že se to do příštího dílu povede napravit.

Světlo', '2008-04-16 15:24:06', 'recenze');
INSERT INTO clanky VALUES (19, 'Alky', 'Carpe 7. -11. 5. 2008', 'Svět plný možností. Kdo nejel, o hodně přišel...', '
Na tuhle akcičku, která se konala v Železné u Tišnova, jsme vyrazili pouze já (Alky) a Zagro. Ostatní nechť toho litují a bijí čelem o zem, protože přišli o jednu z nejlepších akcí letošního roku. Cesta do Tišnova byla dlouhá, ale i ve dvou lidech se dá zažít spousta legrace (ptejte se na veselého nádražáka ). Na místě, po neskutečném výšlapu kopce, nás čekalo milé Azrikovo uvítání, malebná loučka a šíša.

Akce byla bohužel trochu zasažena sníženým počtem účastníků, ale o to příjemnější byla atmosféra večerních sezení u ohně. Hra samotná, ale opravdu stálo za to! Kde jinde si můžete zahrát enta, kostěného draka nebo gryfa? A to nemluvím o velmi propracovaných a celkově povedených pravidlech. Byly plné originálních lahůdek a  snadno pochopitelné. Abych moc neprozradil, vyjmenuji jen sesílání magie pomocí pevně daných gest a magických formulí (zkuste se naučit 10 kouzel o 7 slabikách a gestech nazpamět;) ) a pachovou značku dlaků. Dále oceňuji absenci pravidel typu „čekej 10 minut“. 

Dál bych se zmínil o systému „moci“. Moc nahrazovala klasické expy a dala se během hry získat nejrůznějšími způsoby: jídlem, bohatstvím, slávou (buďte světoznámý atlet nebo malíř) a dalšími vychytávkami.
Velmi pěkné byly také předměty, které šlo najít ve hře a byly krásně vyhotoveny. Na pěkné rekvizity je přeci jen radost pohledět. A jako poslední ocením dobře promyšlený systém návaznosti – všechny své věci jsem umístil do obálky a příští ročník je dostanu ve stejném stavu zpět. Žádné zapomínaní!

A svět? Bohové ví, co se s ním stalo. Tak šup, šup objevovat, vykopávat, prozkoumávat a hledat minulost. Proč jsou všude ty podivné stavby? A kde se vzal obrovský kráter na herním území? Otázek na zodpovězení bylo skutečně habaděj a pokud nejste bojově či politicky zaměřený, zabavily vás spolehlivě na celou hru.

Během hry se opravdu nikdo nenudil. Celý svět byl komplexní a pěkně podbarvený. Stále bylo co objevovat. A pokud příště přijede o několik hráčů víc, bude zážitek naprosto dokonalý…
P.S. Děkujeme Azrikovi „Ježíškovi“ Plíškovi
', '2008-05-18 10:18:41', 'recenze');
INSERT INTO clanky VALUES (20, 'Terka', 'Bezkrálí X', 'Extra super akce sezóny', 'Bezkrálí X. – jeden z nejlepších LARPů, kde jsem kdy byla
Za tepla napíšu aspoň pás vět o téhle super akci. Kdo tam nejel udělala určitě velikou chybu. Všichni hráči zde začínali se zcela novými postavami v nové zemi, takže bylo velkou výhodou, že jsem všichni uměli celkem podobně schopností a moc jsem se neznali, tedy nebylo nikomu divné, že jsme z ciziny a nic o Meritree nevíme. Po celé tři dny probíhalo řešení mnoha zajímavých dějových linií ve kterých byly propleteny osudy většiny postav a nad tím vším probíhala vysoká politická hra šlechty o moc, volba a korunovace královny i evergreen kopání a zkoumání v troskách přilehlé zničené země Al Krajiny.
My jsme do Meritrey přibyli jako prostá lůza, zabývající se hlavně obchodováním a velice jsme si svoje postavení užili, klaněli jsme se až nás bolela záda a báli se všeho možného, jen když to bylo mocnější než my. Nemůžu tu dále rozepisovat co se s námi dělo, protože tahle historie s námi bude mít určitě pokračování příští rok. Tak ahoj na Bezkrálí XI.', '2009-05-11 09:28:20', 'recenze');
INSERT INTO clanky VALUES (21, 'světlo', 'B5A 2009', '<i>Za obzorem zní píseň havraní ohně pohasnou, 
slyš pane náš, zas přijde nový den, krví potřísněn,...
ó pane náš, ámen požehnej, víru v nás zachovej, první den se bít ...
</i>', 'Tak jsem konečně rozhýbala zatuhlé končetiny a když už nedatlím o dvou prstech můžu se pustit do chvalozpěvů a proklínání...
Po poměrně pohodovém odjezdu z Plzně (já, Alky, Kořen, katapult a pár přátel) jsme se dohledali na nádraží v Praze i s Terkou a Pillym a vyjeli směr Doksy.
Po pár škodolibostech osudu jsme se konečně dostali na místo, v rychlosti postavili stan, nechali si schválit zbraně, zaregistrovali jsme se, nacpali břuchy a krafali a těšili se na bitvu.
Po ranním hodnocení kostýmů, přidělení životů a bleskurychlé snídani jsme vytáhli směr Naurrakurská věž. Tam jsme se však příliš neohřáli a kvapem táhli dobývat hlásky. 
Většinou jsme se snažili strhnout pozornost bílé strany na sebe a zatímco Gundabal a Throqushar někde bez obtíží obsazovali zbývající hlásky, my dostávali pěkně na kožich ;-) Zato jsme ale zaslouženě hlásky vyhráli ...
Po hláskách nás čekalo tažení, které bohužel skončilo ve prospěch bílé strany. 
A znovu hlásky a zase tažení.
Katapult, na který se všichni zpočátku dívali dost nedůvěřivě, se pod obratnýma rukama Terky a Kořena změnil ve smrtonosnou zbraň, spojenci a fotografy obdivovanou, nepřáteli proklínanou ...
V neděli nás čekaly ještě jedny hlásky, jedno tažení a závěrečné bitvy. Tentokrát jsme hlásky nedobyli, zato při tažení jsme slavili úspěch. To ovšem nic nemění na tom, že přesně dle páně Tolkiena opět dobro vítězí a temnota se musí stáhnout zase na rok do ústraní... Inu, snad příště.

Celkově hodnotím akci kladně, nejlepšími a nejčestnějšími protivníky, jsem se shodli, že byli lidé – čest jim! Nejzákeřnější naopak bylo počasí, které nám moc nepřálo. Rozhodně musím pochválit motivaci koláčky, na druhou stranu pokud se udrží tendence zvyšování ceny akce, tak bude příští rok už hodně na pováženou. 
No uvidíme, ahoj skřeti, třeba se příště zase uvidíme...

PS: Ne, ve skřetím táboře fakt nemá smysl budíček typu: „Máme tu krásné ráno, tak prosím buďte tak laskavi a vstávejte...“ ;-)
', '2009-06-02 21:12:42', 'novinky');
INSERT INTO clanky VALUES (22, 'sirkubador', 'Pilirion.ic.cz  beta 2', 'Stránky bly kompletně přepsány.', '<p>Žádnou změnu, co se týče komfortu ale <strong>zatím</strong> nečekejte. Jediný, ale opravdu obrovský přínos je, že (ač je koncepce pořád zastaralá) stránky jsou v novém, lepším, udržovatelnějším a čistším.</p>
<p>
Postupně si najdu čas a odstraním všechny nahlášené chyby, nebojte se zahlásit ještě nějaké nové, pak přijde kompletní redakční systém, přesun na jiný hosting a postupné nasunutí všech projektů naší skupiny pod jednu doménu.</p>
<p>
Každopádně se je ještě na co těšit .
</p>', '2010-04-15 16:00:09.289111', 'novinky');
INSERT INTO clanky VALUES (24, 'kořen', 'Carpe 2010', '2. &ndash; 6. 7. Špičková akce, na kterou se nezapomíná.', '<p>
Ačkoliv mi nebylo dopřáno dopravit se na akci s ostatními v klidu a pohodlí už v pátek, což způsobilo, že jsem si celou cestu náležitě vychutnal (Tišnov má krásné okolí), mé očekávání, co se akce týče, to nijak neovlivnilo. Konečně se dostanu na akci, na kterou se pějí ódy, co se týče její legendárnosti.
</p><p>
Pražilo sluníčko a sametový honosák, který nedával příliš prostoru k odlehčení si, se mi nepříjemně lepil, kam mohl. Po zhruba šesti kilometrech do Železného (vzhledem k absenci mapy jsem odčítal informace z tabulí) mě přišel vysvobodit Pachol, a to alespoň od plachty k áčku. Myslel jsem si, že nejhorší část mám za sebou, ale cesta z vesničky, kde se od 17:00 mimo pondělků otvírala geniální hospůdka s uzenými žebry, byla křivolaká, rozbahněná, úzká a zoufale do kopce.
</p><p>
Konečně jsme dorazili. Jaké bylo mé překvapení, když mě uvítal sám velký, příjemně naladěný (i přes to úmorné vedro) organizátor Azrik. Velký gotičák i jehla už stály, a tak jsem u nich na chvilku umřel, pak se zkulturnil a šel se zaregistrovat a pozdravit s ostatními - se Světlem (která přišla k funkci maharadži a tím tak trochu nabourala původní plány naší frakce), Terinkou, Pillym, Alkym, Hádětem a Magdou. (O tom, na co všechno jsem zapomněl, psát sice nebudu, ale každopádně se všechno v pořádku a s úsměvem vyřešilo, což mě příjemně překvapilo.)
</p><p>
A pak přišla hra. Už ze začátku jsem pochopil, že co se obchodu týče, možnosti Bezkrálí ani Erinoru Carpe nenabízí. Pravidla nejsou, vše je hráčská iniciativa. S postavou obchodníka jsem měl ze začátku problémy, ale díky Azrikovu nakopávání a mému druhému povolání jsem měl o zábavu postaráno jako valná většina všech účastníků, jediné, co kalilo požitek ze hry, bylo vedro a zástupy hmyzu a breberek všeho druhu.
</p><p>
Co o hře - své si našel snad každý, prostoru bylo dost, ať už pro bádání o tom, co může za události, které zasáhly celý Knedopus (země, kde se hra nově odehrávala), nebo jejich napravováním, došlo i na boje, kouzla a přepadení, alchymisté a léčitelé měli plné ruce práce, řešila se ekonomika, hamounila se moc, a to jak papírová, tak politická, božilo se - prostě fantazákův ráj.
</p><p>
Své jsem si užil a odjížděl jsem přeplněn inspirací a zážitky, které si budu pamatovat ještě dlouho, po dlouhé době naprosto skvělá akce, která určitě patří k těm nejlepším.
</p>', '2010-07-26 17:37:36.426719', 'recenze');
INSERT INTO clanky VALUES (26, 'Pilly', 'Gothic LARP 2010 &ndash; Pád kolonie', 'Můj pohled na tuto akci je dosti poznamenán tím, že sám jsem organizátorem. Pod herními okamžiky a efekty vidím práci a organizaci lidí, která tomu nutně předcházela. Tedy názor mám velmi subjektivní...', '<p>... Další vadou, jak jsem zjistil, bylo to, že jsem samotnou hru Gothic nikdy nehrál.</p><p>

Akce začala velmi slibným ránem, kdy se množství stráží starého tábora s Gomézem jalo vytáhnout lidi z postele a začít s výcvikem a armádní mašinérií. Bohužel celý začátek byl poznamenán tím, že začal jaksi bez varování, ničeho co by hru zahájilo. Organizační pokec se dostavil až o něco déle. Jako kopáči jsme hned potom byli nahnáni do dolů a nuceni kopat magickou rudu. Samotné kopání nebylo nic zajímavého a nebýt malého povstání, byla by to nuda. Od kopáče jsem se dostal s trochou zručnosti boje s dýkou na stína a později s přímluvou na strážného. Toť velmi ve zkratce k průběhu hry a nyní samotná recenze.</p><p>

Gothic ze začátku působil velice nadějným dojmem a chuť lidí si hrát byla velmi dobrá. Jako kopáč měl člověk obrovskou možnost se vydat nějakým směrem a přidat se tam nebo tuhle. Jakmile ale hráči začali dosahovat svých postů a získali potřebné zbraně a zbroje, hra se změnila. Pro moji postavu strážného už nebylo moc do čeho investovat a na co dávat pozor. Příjemné bylo například kupování jablek, ale na tom se dva dni člověk nezabaví. Byla to pro většinu hráčů ztráta motivace něco podnikat. K čemu by byly peníze, když nebylo kam je vložit kromě hospody. Nezbývalo než hrát svojí postavu a postupně se dostavil všudypřítomný kopr. Kvesty vymyšlené do hry se snažily dávat zábavu hráčům a zaměstnávat skupinky – např. sháněním něčeho, vybíjením něčeho apod.</p><p>

Ale mělo to své ale... Některé kvesty se povedly a byly zajímavé, ale celkově vzato se rychle staly stereotypní. Jdi tam a udělej tohle. Poměrně dost mi vadilo, že jsem leckdy nevěděl, co se děje a proč. Zásadní problém byl v tom, že jako vojákovi mi bylo řečeno: Nástup u brány, odchod, atd. a nic víc. V tom selhala některá CP, která měla o kvestech přehled. Jako opravdu hrubě nedostačující bych viděl kvesty typu najděte mi meč či magickou knihu, které měly zaměstnat snad patnáct lidí. Další věc, z které jsem opravdu neměl dobrý pocit, bylo to, že v rámci zachování dějové linie bylo v kvestech napsáno, kdo má vyhrát a jak. </p><p>

Když jedu na LARP typu svět, který byl Gothicem inzerován, rozhodně si nepředstavím hru s časovým harmonogramem kvestů, a už vůbec ne s poměrně pevnou příběhovou linií. Jako taková měla postava na Gothicu minimální možnosti samostatně něco podnikat, vytvářet a interagovat s herním světem. 
</p><p>
Na druhou stranu nutno říct, že výkony některých hráčů, například Goméze, byly velmi dobré a budu na ně dlouho vzpomínat. Prostředí hradu Točník je také úžasné, akorát mi přišlo dost líto, že potenciál hradu mohl být využit daleko více, po většinu doby se hrálo jen na spodním nádvoří. Také jsem si báječně odpočinul a díky přítomnosti skvělé hospody a mé úžasné slečny se vždy něčím zabavil. 
</p><p>
Shrnuto a podtrženo, Gothic byl zajímavou a poměrně rozumnou akcí, kterou bych ale rozhodně nenazval světem. Z mého pohledu se hra spíše jevila jako velmi netradiční bitva s LARPovými prvky. Celkově hodnotím za 3.
</p>', '2010-09-15 12:58:47.457286', 'recenze');
INSERT INTO clanky VALUES (27, 'Alky', 'Bitva o mrkev IV.', '23. 10. 2010 - Již čtvrtý ročník lokální šarvátky mezi králíky a zajíci o oranžovou pochutinu. ', 'Bitva o mrkev pořádaná skupinou Fanatici je už zaběhlou menší bitvou, která na první pohled překvapí svým tématem. V konfliktu o mrkvová pole se střetávají kapitalističtí králíci a levicově zaměření zajíci. Bitva, která dle mého odhadu měla letos okolo 40 účastníků, je přátelsky nakloněná především lidem, kteří více než realistický šerm ocení  veselou atmosféru a nováčkům - bitva neklade vysoké nároky na kostým a vybavení. Je tedy vhodnou příležitostí pro první vykročení do světa fantasy a LARPu.

Organizátoři i letos dokázali, že o nápady nemají nouzi. Kromě již klasických obyvatel zahrádky a přilehlých mrkvových plantáží jako je zahradník se psem, sysel nebo vrány se na scéně objevili i postavy jako Krajíc (kříženec králíka a zajíce) a další. Soupeřící strany máme, nástin příběhu též. Jak tedy celá bitva probíhala? Zpočátku šlo vše jako po másle. Obě strany si užívaly jak boj, tak netradiční úkoly. Přibližně v polovině hry však organizace někde zaspala a tok informací směrem k hráčům začínal být zkalený. Občas měl hráč jít do konfliktu a neveděl proč a leckdy ani kam. Sbírání mrkve však i nadále pokračovalo než se objevil další nedostatek - tentokráte v oblasti ekonomiky. Záhy se ukázalo, že je výhodnější mrkev skladovat než za ní kupovat nové budovy a jednotky  pro svůj národ (ač byli velmi zajímavé a dle prvního zdání užitečné). Poslední černý puntík, který si neodpustím ač je čistě subjektivní jsou dlouhé zásahové plochy (po zápěstí a kotníky). Ty podle mého názoru kvalitnímu zážitku z boje nijak nepřidávají. 

Sečteno a podtrženo: netradiční bitva se skvělou atmosférou. Každý, komu nevadí mít během boje na hlavě uši se bude skvěle bavit. Zkušení šermíři hledající adrenalin a ostré souboje ať zůstanou raději doma.', '2010-10-25 15:48:24.171795', 'recenze');
INSERT INTO clanky VALUES (28, 'Pilly', 'Tenkrát v Danielsu', 'Steampunklarp, 11.-13. března 2011', 'Nevím proč, ale svojí recenzi začnu závěrečným hodnocením. Všem bych chtěl říct, že mě hra zaujala a i docela bavila. Na příští ročník, pokud to čas dovolí, určitě pojedu. Zároveň se snažím napsat objektivní recenzi a nikoli reportáž z akce, a proto je určitá kritika nutná.
    V celkovém pojetí bylo tenkrát v Danielsu příjemným zpestřením víkendového pobytu v Praze. Hra jako taková měla spoustu velmi zajímavých aspektů a taky několik organizátorských neduhů. Celkově bych ji hodnotil známkou 2- (3 je standart).
   Organizátoři dokázali naprosto ukázkově nadchnout hráče do herní situace a podpořit tak jejich vžití do role. Posloužil k tomu velmi dobře páteční seznamovací večer. V jejich notě pracovala také novost tématu a neotřepané zápletky. Také například vydávání Záhrobních news  byl velmi zajímavý aspekt.      Na druhou stranu hra byla výhradně postavena na interakci mezi hráči a jakékoli ostatní stránky hry šli do pozadí. Jednotlivé postavy byly důsledně zpracovány a jejich pojetí se velkou měrou podobalo klasickým komorním larpům. A v tom byl háček. Každý měl své kvesty a dějové linie poměrně důsledně zpracované. Možnost vzniku nových linií byla ale tímto trochu svázaná. Komorní larp většinou trvá kolem tří hodin. Larp byl ale od začátku plánován na více jak 12 hodin, z čehož postupně pramenilo všeobecné vyprchávání děje, podpořené únavou. Tento stav nakonec vyústil ke koncentraci hráčů v hospodě. Seděli u piva, a když do putyky vtrhli dva nejmenovaní desperáti a zastřelili jednoho ze spoluobčanů, téměř nikdo nezareagoval. Nicméně organizátoři zareagovali pohotově zkrácením času do voleb a hru tak zachránili. 
   Za jedinou opravdovou chybu larpu považuji nezvládnutí herního území. Bylo příliš rozsáhlé a sloužilo pouze jako nevýznamná kulisa. Ačkoli člověk mohl hledat jednotlivé herní lokace, nebylo mu to k ničemu a neměl kromě výbuchu žádnou možnost jak z nich něco získat, objevit, apod. Přejít herní území z jednoho konce na druhý trvalo přes půl hodiny a tak se stávalo, že poměrně klíčoví hráči na dlouhou dobu zmizeli. Nakonec se všichni hráči pohybovali pouze mezi saloonem a obchodníkem (org. bytem). 
   Ke zvážení pro další pokračování bych organizátorům doporučil zamyslet se nad počtem různých hráčských skupinek a jejich velikostí. Ve hře se vyskytovaly prakticky tři velké frakce. Výsledkem toho bylo, že po herním území chodili skupinky cca o deseti lidech a až na pár výjimek něco jako přepadení neexistovalo.
   Poslední mojí výhradou je soubojový systém. Vyřazení jedním zásahem způsobilo, že se nekonaly žádné přestřelky, právě tak typické pro divoký západ. Jakmile se začalo střílet, tak během pár vteřin všichni leželi na zemi a pobíhali kolem nich léčitelé, takže k žádné pořádné přestřelce vlastně nedošlo. Samotnou kapitolou pak byl systém oživování, který vám téměř vždy zajistil po první smrti oživení. Proč ale pak někoho vlastně vůbec zabíjet, když bude oživen.   
   Na konec bych rád přidal poděkování za dobrou hru. A z pozice organizátora organizátorům popřál co nejvíce energie, nápadů a dobrých hráčů pro příští akce.

Pilly', '2011-03-27 21:38:52.452242', 'recenze');
INSERT INTO clanky VALUES (29, 'Alky', 'Larpově-divadelní večer ', '2. 4. 2011, Plzeň', 'Od samého začátku jsem byl velmi zvědavý a plný očekávání. Nevěděl jsem pořádně, co od tohoto projektu čekat, ale nadšení organizátorů mě utvrzovalo v tom, že bude nač se těšit. Mé očekávání rozhodně nezklamali, spíše předčili. Škoda jen některých neduhů, bez kterých by celý večer vystoupal o několik řádů výš.

Spojování LARPu s divadlem je v poslední době velmi oblíbené především při vysvětlování "nezasvěcenci", o co v LARPu vlastně jde. Nyní se ukázalo, že to není pouze clona, za kterou se komunita schovává, ale že poměrně přesně odpovídá skutečnosti. Prosty divadla Dialog v Plzni, daly večeru navíc ještě trochu "opravdovosti".  Samotný program se skládal ze dvou částí: nácviku některých divadelních technik a řízené improvizace v divadelní hře, kde si všichni účastníci měli možnost zahrát. Samotný úvod, však byl poněkud zmatený. Než se organizátoři naplno zhostili role,   rozkutáleli se některé důležité informace o průběhu večera a někoho jako jsem já, kdo vůbec netušil, co má od programu vlastně čekat, to zprvu značně mátlo. Vše se, ale nakonec ustálilo a započal nácvik jednotlivých technik.

Tato část byla spíše hrou a pomohla účastníkům  si zvyknout na pódium a interakci s ostatními. Byla vtipně a nápaditě provedena, nicméně osobně bych ocenil i více praktických rad, ne jen pouhé rozcvičení. S druhou částí přišelo to hlavní a dění z ničeho nic dostalo obrovský spád. Hráči byli postaveni před úkol zaimprovizovat předem napsaný příběh a to scénu po scéně, aiž by věděli, co přijde v scéně další. Vše bylo úhledně zpracováno v brožuře - co se v scéně bude dít, s jakou motivací tvá postava vstupuje do děje a kdy scéna končí. Velice pěkně provedené, ale i tak se vyskytlo mnoho chybiček, ať už ze strany organizátorů nebo nás - divadelníků amatérů. Největším problémem byl časový pres. Pravidelně se stávalo, že jsme nestíhali scény nastudovat a už se zhášela světla a na podiu poskakoval první herec. Zvláště klíčové okamžiky dramatu to citelně ovlivnilo. Dále pak popisy scén, ač na nich jistě bylo už tak mnoho práce, by potřebovaly delší zamyšlení. Nezřídka se stávalo, že pochopit svůj part byl herkulovský výkon a ve chvíli kolize s dalším hercem se na podium vnesl zmatek. Ten by diváka zřejmě tolik neovlivnil, ale herec pak z dané scény odcházel jen zmatený a nespokojený. A o něj tu přece šlo. Přes všechny nepříjemnosti jsme však úspěšně dospěli až k závěrečné scéně (a mnoho hereckých výkonů stálo za to sledovat), celý příběh se rozuzlil a donutil si člověka sáhnout do duše. Pokud bylo cílem vyvovat znechucení, nevolnost v krajině břišní a zamyšlení nad svým údělem rozhodně se to podařilo.

Závěrem si postesknu ještě nad časovým zařazením večera. Podobný počin by si zasloužil být číslem jedna na pořadníku dne a ne hrát jakéhosi "doskokana" předcházejícím larpům. Je to role nevděná a po již tak namáhavém dni v sobě hledá člověk energii velmi těžko - zvláště pro tak psychicky náročný akt. Pro příště bude také nutné zavést, ač to bude nepříjemné, limit pro počet účastníků. Nadpočet divadelních nadšenců bohužel negativně ovlivňoval večer od začátku do konce.

Závěrem už jen skládám poklonu. Nejen, že oraganizátoři připravili úžasný zážitek pro mnoho lidí, ale posunuli hranice LARPu (nebo divadla?) zase o kousek dál.', '2011-04-04 09:18:43.013388', 'recenze');
INSERT INTO clanky VALUES (30, 'Zagro', 'Příhody bratří Coltonů ', '11.-13.3. Steampun-westernový larp; Příběhy z postav bratrů Coltonů z Danielsu', '<p style="TEXT-ALIGN: center"><strong>Příběh první: Co dál</strong></p><p>
<a href="http://pilirion.cz/img/puvodni_obrazky/image-20110313222733-03.jpeg"><img class="image" src="http://pilirion.cz/img/puvodni_obrazky/image-20110313222733-03.jpeg" border="0" width="150" height="113" border="0" style="MARGIN: 5px; FLOAT: left"/></a>
<p>Jednoho krásného večera se toulaví bratři Coltnové usadili v hospodě v nemalém městečku kdesi v pustinách. Toto městečko se vyjímalo několika krásnými romantickými lokacemi :D.
</p><p>Kdesi v dáli zapadalo slunce nad ropnými jezírky, ze ztroskotané parolodi stoupal dým, štětky měly syfilis. To celé, když naši bratři vypovídali neuvěřitelné výmysly šerifovy, který řešil nějakou nepodstatnou mrtvolu v lokálu. „Co proboha snad my se budem zabývat nějakou mrtvolou“ řekli si svorně bratři a šli dál, bavit se na učet svých nevelkých kont ale velkých ambicí. 
</p><p>Po této malé příhodě s nějakou otravnou mrtvolou se pilo, veselilo, balilo, karbanilo, sralo na šerifa a vlastně tak všechno co si „normální“ bandité mohou dovolit. 
Jistě jste poznali, o jaké to město jde, kam naši proslavení bandité dorazili. Ale ovšem byl to  New Daniels, to neskutečné město plné nových příležitostí pro už tak známé a prosáklé, hledané bratry.
</p><p> „Tak pánové přijeli jsme, chlastali jsme, tak teď musíme udělat něco pořádného“. 
„Já sem pro banku“ nadhodil brat Georg (nejstarší a nejchytřejší z bratrů “občas až moc“).
„Já sem pro to abychom vykradli lékárníka a přivlastnili si všechny jeho mastě a lektvary. Jo a taky je tu pěkná neteř toho velkého ropáka, to by mohla bejt pěkná štěrbina.“ Už jen z toho co řekl je vám jasné, že jde o nejmladšího z bratrů Johna Paka Coltona .
</p><p>Ten svým bratrům trochu dělá problémy, pořád se do něčeho vrtá „hlavně do postelí“ a bratři ho z toho musí většinou chtě nechtě tahat. Prostě rodina musí držet pohromadě.
</p><p> „Banka počká, mastičkář taky, ale co nepočká, jsou ty mizerní Daltoni, co si hrajou na lepší než my. Musíme se o ně postarat jakýmikoli prostředky,“ řekl Rafíí (Rafael) Colton. Ten je přesně mezi bratry. Paka vychovává, s Georgem se radí a má taky pro sebe jeden malý ocásek s kterým rád chodí lovit bobry do ropných polí :D.
</p><p>Takto si bratři nastínili postup, jo, ale kdyby jim to bylo bývalo vyšlo. Jak všichni dobře ví, v branži pistolníků se pořád něco mění a děje jinak.
</p>
<p style="TEXT-ALIGN: justify">&nbsp;</p>
<p class="MsoNormal" style="TEXT-ALIGN: left; MARGIN-BOTTOM: 0pt"><a href="http://pilirion.cz/img/puvodni_obrazky/image-20110313222351-09.jpeg"><img class="image image-thumbnail  mceItem" src="http://pilirion.cz/img/puvodni_obrazky/image-20110313222351-09.jpeg" border="0" width="150" height="113" border="0" style="MARGIN: 5px; FLOAT: right"/></a>
</p><p style="TEXT-ALIGN: center"><strong>Příběh druhý: Poctivý den!! </strong></p><p>
<p>Ráno byl krásný a slunný den. Starší bratrové byli líní a buď se jim nechtělo z teplých postelí s živými topidly, nebo byli prostě namol. 
</p><p>Zato náš malý Pako to udělal chytře. Ten totiž ani nedojel do doupěte teplých prošukaných postelí, a proto byl ráno čilý a procházel se uličkami nově poznávaného městečka.
</p><p>Mno jo no, prochlastal celou noc a promrdal kdejakou šťěrbinu, ale to je přece každému úplně jasné a ukradené. :D
</p><p>Na své ranní procházce poznával romantická místa, kde by chtěl jednoho dne provádět svou vyvolenou, „aspoň si to přál“. Tou nebyl nikdo jiný, než vnučka O´Donella, dobře zajištěného a vysoce postaveného občana města. Mimochodem vlastnil moc krásné ropné pole, které bylo právě tím romantickým místem.
</p><p>Ale dost o blábolách, prostě se bratři chtěli držet koryta do kterého nejvíc teče.
<p class="MsoNormal" style="TEXT-ALIGN: left; MARGIN-BOTTOM: 0pt"><a href="http://pilirion.cz/img/puvodni_obrazky/image-20110313222351-05.jpeg"><img class="image image-thumbnail  mceItem" src="http://pilirion.cz/img/puvodni_obrazky/image-20110313222351-05.jpeg" border="0" width="150" height="113" border="0" style="MARGIN: 5px; FLOAT: right"/></a>
</p>
Po procházkách, kde ještě objevil pár dalších užitečných míst, se konečně setkal se svými bratry a tou malou umouněnou cácorkou, kterou Ralfí s sebou už tak dlouho tahá. 
„Mno co, možná se jednou bude hodit,“ řekl si John a nestaral se dál zase o nic.
Setkání bratrů proběhlo jako vždy velmi přátelsky, slovy „ty vole, kde se zase taháš“ a raním přídělem potravy, ve formě půlky pečeného kuřete. Po takové noci si prostě rád člověk něco napere do bachoru, ať je to studený nebo „však to znáte“.
</p><p>Cesta pokračuje dál směrem neobvyklým pro ranní bohoslužbu, kde se navíc musí pod nátlakem šerifa odendat zbraně. K tomu jen poznámka: „Proč odendávat všechny zbraně, když je jich takovej nedostatek po ruce ostatním.“
Přeskočme nudné bláboly kněze, který stejně neví co je život, krom jeptišek. Byla to nudná prožvatlaná pitomina, na kterou se prostě muselo jít. 
Ale potom se hned začalo něco dít. Bratři pozorovali své budoucí přátele, své odvěké rivaly Daltony a všechny podstatné obyvatele města, které budou časem chtít okrádat, vraždit, znásilňovat a spoustu jiných příjemností. 
</p><p>Po následující období si bratři usmysleli, že bude nejlepší se chytnout velkého, mohutného a ozbrojeného balíku peněz jménem Bill O´Donells. Velkostatkář s pořádným jměním a mocnou pumpou, nejen na ropu. 
Všechny smlouvy a dohody řešili bratři, a tak náš malý Pako měl čas procházet se po ropných polích, dělat nestydaté návrhy slečinkám a vytahovat svého kamaráda na slunce před oči nebohých přepadených. Jistě, že se hovoří o pistoli, „nechutná domýšlivá hovada přece vymřela“. 
</p><p>Dlouho mu to ale nevydrželo, musel s bratry jít hned po dojednání úmluv vybírat výpalné.
Jednalo se o malou splátku dluhu panu O´Donellsovi od pana hraběte, který byl neobyčejně rozumný a nechal si vysvětlit, že nebude dobré se hádat s nabitými zbraněmi. 
První zkouška proběhla a bylo to. 
</p><p>A teď začíná ta pravá flákárna, u koryta snadno a rychle. Dál už jen tak sem tam něco sfouknout a být v klidu a nikdo nás nebude podezírat z toho, že jsme hledaný taky kde liboli za leccokoli.</p>
<p style="TEXT-ALIGN: justify">&nbsp;</p>
<p style="TEXT-ALIGN: center"><strong>Příběh třetí: Neodolatelná touha!</strong></p> 
', '2011-04-06 16:19:51.766522', 'novinky');
INSERT INTO clanky VALUES (31, 'Mates', 'Bitva o Vlčí máky 5 - Bitva zeleného úsvitu', 'aneb mravenčí řež pohledem štítonoše; 26.3.2011, Praha-Klánovice', '<p>Tento pokus o recenzi bych nerad nějak výrazně ovlivnil svým začátečnickým nadšením umocněným zážitkem, který byl pro mě novinkou, ale už teď musím říct, že jsem z akce odjížděl opravdu silně potěšen. I když jsem čekal, že spousta věcí bude probíhat jinak, než jsem si představoval, stejně mě dokázalo dost věcí překvapit. A to nejen skvělé zpracování chytlavého tématu, ale i nečekaná CP nebo záškodnické komunity a v neposlední řadě hojný počet "malých" bojovníků. Byla to však překvapení povětšinou příjemná. Díky organizaci questů si myslím, že byli vždy všichni nadšeni do nějaké akce (obzvláště do questu "zasouvání"), i když bohužel mnohdy netušili, kam vlastně běží nebo za jakým účelem. Já jako štítař jsem to asi necítil tak silně... přeci jen u častého rozkazu:<strong> "Stůj tady a braň!"</strong>není moc co jiného chápat, ale mrzelo mě že i já jsem od spousty úkolů vůbec neslyšel zadání nebo jsem nevěděl, čeho tedy máme docílit.
</p><p> Jinak jsem byl zklamán vypuštěním příběhové linie nebo návaznosti jednotlivých částí, zkrátka nepřečíst si název akce, ani nevím že nějaké město Zeleného úsvitu existuje. Ale rozhodně jsme si všichni zahráli víc než dost a jsem rád, že se zde plnohodnotně uplatnili i válečníci mladší (zvláštní poctu má asi pětičlenná jednotka trpasličích termitů s průměrným věkem tak 10 let - postrach všech nepřátel).
</p><p>A jak to zhruba probíhalo? Inu my co jsme přijeli z Plzně (Alienka, Lenča, Pachol, Kačka, Liwka a Mates) jsme byli u trpasličích mravenců roztrženi a já pak povětšinou někde stál se štítem a sledoval jak zbytek této party řeže nepřátele někde v houfu naší obří nepřemožitelné armády :-). Po každém questu následovalo 45min jednoho období kdy se daly shromažďovat potraviny, shánět herní předměty nebo bezhlavě nabíhat na mraveniště jiného státu. Po prvních trpasličách akcích zrzaví pochopili, že by s námi měli něco dělat a za "nezaujaté" pomoci komunity naimbených Křižáků to s námi občas šlo z kopce.
</p><p> Z úkolů jsme pak většinou vycházeli vítězně, a ač nám byla v závěrečné bitvě zrušena naše hlavní síla - reinkarnace v poli, a nevypadalo to s námi vůbec dobře, nakonec jsme přec jen zvítězili. 
</p>', '2011-04-20 00:18:10.020222', 'recenze');
INSERT INTO clanky VALUES (32, 'Pilly', 'Logo Pilirion o.s.', 'Líbí/ Nelíbí se vám? Ovlivněte svým názorem budoucí vizuální prezentaci o.s.', '<p>
<a href="http://pilirion.cz/img/puvodni_obrazky/image-20110420104700-00.jpeg"><img class="image" src="http://pilirion.cz/img/puvodni_obrazky/image-20110420104700-00.jpeg" border="0" width="150" height="113" border="0" style="MARGIN: 5px; FLOAT: left"/></a>
<p>Nechávám zde na přetřes první návrh loga od Kiary. Logo by mělo být využíváno na stránkách, průvodkách her a k propagaci. Vyjadřujte se prosím na fóru.
</p>', '2011-04-20 10:56:54.129786', 'novinky');
INSERT INTO clanky VALUES (33, 'Pilly', 'Pilirion, o.s. II', 'Druhá verze loga na přetřes.', '<p>
<a href="http://pilirion.cz/img/puvodni_obrazky/image-20110507195825-00.jpeg"><img class="image" src="http://pilirion.cz/img/puvodni_obrazky/image-20110507195825-00.jpeg" border="0" width="150" height="113" border="0" style="MARGIN: 5px; FLOAT: left"/></a>
</p><p>Vzhledem k připomínkám k textu u loga sem dávám několik možných verzí. Prosím vyjadřujte se na fóru. 
</p>   ', '2011-05-07 20:05:07.914707', 'novinky');
INSERT INTO clanky VALUES (34, 'Světlo', 'Bezkrálí XIII.', 'Bezkrálí XIII.- Dějiny píší vítězové
Tak to vidím já...', 'Bezkrálí XIII. 19. – 22.5.2011

Už notoricky profláknutá hra s dlouhou historií, do které jsme se více či méně zapsali. Organizátorský tým po vedením Dariona odvedl kus práce, aby nám – hráčům – připravil zajímavé příběhy k řešení. Co se kostýmů týče, jde o hru již náročnější, ačkoliv někdy je náročné odlišit herní smetánku od „obyčejných“ lidí, což vidím jako největší mínus, na hře, která je z větší části koncipována právě pro šlechtu.
Nováčkům rozhodně doporučuji projet si napřed jinou akci a pak teprve vyrazit se skupinkou ostřílených kamarádů, protože ve hře se nachází „hluchá“ místa, která si člověk (nebo jiná bytost) musí vyplnit ve vlastní režii a někdy jsou prostoje i dost dlouhé. To se odrazilo (společně s počasím, které nám letos obzvlášť přálo – bylo kolem 25°C ve stínu) i v množství „kopru“. Kvesty měly patřičně zajímavé a propracované pozadí, ale člověk se jich musel prakticky dopídit aby zjistil, co je už kvest a co ještě popis lokace. Abych však jenom nehanila, tak musím říct, že osobně velice kladně hodnotím obrázky u lokací.
Na letošním díle se hrálo podle pravidel ultralight, což většina hráčů přijala s nadšením. Rozhodně to zvýšilo paranoiu a urychlilo případný odchod na věčnost.
Hra se tentokrát odehrávala ve zničené a znovu postavené Ak-Krayně. Zde se otevíralo dost možností na prozkoumání doobnovujících se čtvrtí, splnění několika kvestů, politikaření a pletichaření. Na druhé straně se na hře nevyskytoval prakticky žádný obchod, vyjma několika transakcí typu hráč-hráč, takže ačkoliv peněz bylo ve hře více než dost, nenaskytovaly se téměř žádné příležitosti jak je utratit.
Ačkoliv letos většina našich jela za vyslance temných elfů, já jsem zůstala se starou postavou u knížete Honerota (Lumík), i s přihlédnutím k některým nedostatků jsem si hru celkem slušně užila, včetně své smrti asi tak hodinku před koncem.
Suma sumárum, Bezkrálí je hra pro opravdu zkušené kráče, které nechybí určité kouzlo. Svoji další účast však zvážím až podle příštího backgroundu a systému pravidel pro následující díl.

', '2011-05-25 19:10:37.663756', 'novinky');
INSERT INTO clanky VALUES (35, 'Pilly', 'Vývoj loga', 'Není to tak dávno co jsme si logo vybrali a už je tu na přetřes další, jak by se v budoucnu naše logo mohlo změnit.', '<a href="http://pilirion.cz/img/puvodni_obrazky/image-20110822083913-00.jpeg"><img class="image" src="http://pilirion.cz/img/puvodni_obrazky/image-20110822083913-00.jpeg" border="0" width="150" height="113" border="0" style="MARGIN: 5px; FLOAT: left"/></a>
</p><p>Původní logo je roztomilejší a takové trochu pohádkové. Na druhou stranu evokuje rybu (rybovitý tvar) případně delfína. Nový návrh loga je modernější, není roztomilý a neevokuje rybu. Co na něj říkáte?  
</p> ', '2011-08-22 08:46:39.694319', 'novinky');


--
-- Data for Name: obrazky; Type: TABLE DATA; Schema: pilirion; Owner: test
--

INSERT INTO obrazky VALUES (2, 'Odpočinek', 'Pilly po boku Glorventa', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070425113018.jpg', 1, '2007-04-25 23:30:18');
INSERT INTO obrazky VALUES (3, 'Kulometné hnízdo', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070425113331.jpg', 1, '2007-04-25 23:33:31');
INSERT INTO obrazky VALUES (4, 'Zranění', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070425113541.jpg', 1, '2007-04-25 23:35:42');
INSERT INTO obrazky VALUES (5, 'Vřava', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070425113854.jpg', 1, '2007-04-25 23:38:54');
INSERT INTO obrazky VALUES (6, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426053839.jpg', 1, '2007-04-26 17:38:39');
INSERT INTO obrazky VALUES (7, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426053850.jpg', 1, '2007-04-26 17:38:50');
INSERT INTO obrazky VALUES (8, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426053858.jpg', 1, '2007-04-26 17:38:58');
INSERT INTO obrazky VALUES (9, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426053907.jpg', 1, '2007-04-26 17:39:07');
INSERT INTO obrazky VALUES (10, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426053916.jpg', 1, '2007-04-26 17:39:16');
INSERT INTO obrazky VALUES (11, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426053928.jpg', 1, '2007-04-26 17:39:28');
INSERT INTO obrazky VALUES (12, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426053937.jpg', 1, '2007-04-26 17:39:37');
INSERT INTO obrazky VALUES (13, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426053946.jpg', 1, '2007-04-26 17:39:46');
INSERT INTO obrazky VALUES (14, '', 'Pilly - trolí léčitel', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426055123.jpg', 2, '2007-04-26 17:51:23');
INSERT INTO obrazky VALUES (15, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426055133.jpg', 2, '2007-04-26 17:51:33');
INSERT INTO obrazky VALUES (16, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426055143.jpg', 2, '2007-04-26 17:51:43');
INSERT INTO obrazky VALUES (17, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426055208.jpg', 2, '2007-04-26 17:52:08');
INSERT INTO obrazky VALUES (18, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426055216.jpg', 2, '2007-04-26 17:52:17');
INSERT INTO obrazky VALUES (19, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426055226.jpg', 2, '2007-04-26 17:52:26');
INSERT INTO obrazky VALUES (20, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426055235.jpg', 2, '2007-04-26 17:52:35');
INSERT INTO obrazky VALUES (21, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426055244.jpg', 2, '2007-04-26 17:52:44');
INSERT INTO obrazky VALUES (22, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426055254.jpg', 2, '2007-04-26 17:52:54');
INSERT INTO obrazky VALUES (23, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426055303.jpg', 2, '2007-04-26 17:53:03');
INSERT INTO obrazky VALUES (24, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426055311.jpg', 2, '2007-04-26 17:53:11');
INSERT INTO obrazky VALUES (25, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426055321.jpg', 2, '2007-04-26 17:53:21');
INSERT INTO obrazky VALUES (26, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426055328.jpg', 2, '2007-04-26 17:53:28');
INSERT INTO obrazky VALUES (27, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426063459.jpg', 3, '2007-04-26 18:35:00');
INSERT INTO obrazky VALUES (28, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426063514.jpg', 3, '2007-04-26 18:35:14');
INSERT INTO obrazky VALUES (29, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070426063528.jpg', 3, '2007-04-26 18:35:28');
INSERT INTO obrazky VALUES (30, '', '', 'Petr', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Petr-070513091324.jpg', 4, '2007-05-13 21:13:24');
INSERT INTO obrazky VALUES (31, '', '', 'Petr', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Petr-070513091345.jpg', 4, '2007-05-13 21:13:45');
INSERT INTO obrazky VALUES (32, '', '', 'Petr', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Petr-070513091402.jpg', 4, '2007-05-13 21:14:05');
INSERT INTO obrazky VALUES (33, '', '', 'Petr', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Petr-070513091428.jpg', 4, '2007-05-13 21:14:28');
INSERT INTO obrazky VALUES (34, '', '', 'Petr', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Petr-070513091444.jpg', 4, '2007-05-13 21:14:44');
INSERT INTO obrazky VALUES (35, '', '', 'Petr', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Petr-070513091501.jpg', 4, '2007-05-13 21:15:01');
INSERT INTO obrazky VALUES (36, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070514090147.jpg', 4, '2007-05-14 21:01:47');
INSERT INTO obrazky VALUES (37, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070514090204.jpg', 4, '2007-05-14 21:02:04');
INSERT INTO obrazky VALUES (38, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070514090229.jpg', 4, '2007-05-14 21:02:30');
INSERT INTO obrazky VALUES (39, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070514090352.jpg', 4, '2007-05-14 21:03:53');
INSERT INTO obrazky VALUES (40, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070514090419.jpg', 4, '2007-05-14 21:04:19');
INSERT INTO obrazky VALUES (41, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070514090543.jpg', 4, '2007-05-14 21:05:44');
INSERT INTO obrazky VALUES (42, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070514090558.jpg', 4, '2007-05-14 21:05:58');
INSERT INTO obrazky VALUES (61, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100501.jpg', 4, '2007-05-28 22:05:01');
INSERT INTO obrazky VALUES (43, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100117.jpg', 5, '2007-05-28 22:01:18');
INSERT INTO obrazky VALUES (44, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100133.jpg', 5, '2007-05-28 22:01:33');
INSERT INTO obrazky VALUES (45, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100146.jpg', 5, '2007-05-28 22:01:46');
INSERT INTO obrazky VALUES (46, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100156.jpg', 5, '2007-05-28 22:01:56');
INSERT INTO obrazky VALUES (47, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100208.jpg', 5, '2007-05-28 22:02:08');
INSERT INTO obrazky VALUES (48, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100219.jpg', 5, '2007-05-28 22:02:19');
INSERT INTO obrazky VALUES (49, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100232.jpg', 5, '2007-05-28 22:02:32');
INSERT INTO obrazky VALUES (50, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100242.jpg', 5, '2007-05-28 22:02:42');
INSERT INTO obrazky VALUES (51, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100255.jpg', 5, '2007-05-28 22:02:55');
INSERT INTO obrazky VALUES (52, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100308.jpg', 5, '2007-05-28 22:03:08');
INSERT INTO obrazky VALUES (53, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100325.jpg', 5, '2007-05-28 22:03:25');
INSERT INTO obrazky VALUES (54, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100336.jpg', 5, '2007-05-28 22:03:36');
INSERT INTO obrazky VALUES (55, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100350.jpg', 5, '2007-05-28 22:03:50');
INSERT INTO obrazky VALUES (56, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100402.jpg', 5, '2007-05-28 22:04:02');
INSERT INTO obrazky VALUES (57, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100414.jpg', 5, '2007-05-28 22:04:14');
INSERT INTO obrazky VALUES (58, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100424.jpg', 5, '2007-05-28 22:04:24');
INSERT INTO obrazky VALUES (59, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100438.jpg', 5, '2007-05-28 22:04:38');
INSERT INTO obrazky VALUES (60, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070528100450.jpg', 5, '2007-05-28 22:04:50');
INSERT INTO obrazky VALUES (62, 'vlajky a prapory', 'reakce na mail/icq dík', 'Světlo', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Světlo-070606103856.jpg', 6, '2007-06-06 10:38:57');
INSERT INTO obrazky VALUES (63, '...a v barvách', '', 'Světlo', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Světlo-070606023539.jpg', 6, '2007-06-06 14:35:40');
INSERT INTO obrazky VALUES (64, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072250.jpg', 7, '2007-06-06 19:22:51');
INSERT INTO obrazky VALUES (65, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072312.jpg', 7, '2007-06-06 19:23:12');
INSERT INTO obrazky VALUES (66, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072346.jpg', 7, '2007-06-06 19:23:46');
INSERT INTO obrazky VALUES (67, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072431.jpg', 7, '2007-06-06 19:24:31');
INSERT INTO obrazky VALUES (68, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072444.jpg', 7, '2007-06-06 19:24:45');
INSERT INTO obrazky VALUES (69, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072457.jpg', 7, '2007-06-06 19:24:57');
INSERT INTO obrazky VALUES (70, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072512.jpg', 7, '2007-06-06 19:25:12');
INSERT INTO obrazky VALUES (71, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072525.jpg', 7, '2007-06-06 19:25:26');
INSERT INTO obrazky VALUES (72, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072602.jpg', 7, '2007-06-06 19:26:02');
INSERT INTO obrazky VALUES (73, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072617.jpg', 7, '2007-06-06 19:26:17');
INSERT INTO obrazky VALUES (74, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072635.jpg', 7, '2007-06-06 19:26:36');
INSERT INTO obrazky VALUES (75, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072650.jpg', 7, '2007-06-06 19:26:51');
INSERT INTO obrazky VALUES (76, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072707.jpg', 7, '2007-06-06 19:27:08');
INSERT INTO obrazky VALUES (77, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072727.jpg', 7, '2007-06-06 19:27:27');
INSERT INTO obrazky VALUES (78, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072740.jpg', 7, '2007-06-06 19:27:40');
INSERT INTO obrazky VALUES (79, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072755.jpg', 7, '2007-06-06 19:27:55');
INSERT INTO obrazky VALUES (80, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072817.jpg', 7, '2007-06-06 19:28:18');
INSERT INTO obrazky VALUES (81, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072832.jpg', 7, '2007-06-06 19:28:32');
INSERT INTO obrazky VALUES (82, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072847.jpg', 7, '2007-06-06 19:28:48');
INSERT INTO obrazky VALUES (83, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072905.jpg', 7, '2007-06-06 19:29:06');
INSERT INTO obrazky VALUES (84, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072920.jpg', 7, '2007-06-06 19:29:20');
INSERT INTO obrazky VALUES (85, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072936.jpg', 7, '2007-06-06 19:29:37');
INSERT INTO obrazky VALUES (86, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070606072951.jpg', 7, '2007-06-06 19:29:51');
INSERT INTO obrazky VALUES (87, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070619091933.jpg', 8, '2007-06-19 21:19:34');
INSERT INTO obrazky VALUES (88, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070619092046.jpg', 8, '2007-06-19 21:20:46');
INSERT INTO obrazky VALUES (89, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070619092105.jpg', 8, '2007-06-19 21:21:06');
INSERT INTO obrazky VALUES (90, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070619092126.jpg', 8, '2007-06-19 21:21:26');
INSERT INTO obrazky VALUES (91, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070619092140.jpg', 8, '2007-06-19 21:21:40');
INSERT INTO obrazky VALUES (92, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070619092158.jpg', 8, '2007-06-19 21:21:59');
INSERT INTO obrazky VALUES (93, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070619092220.jpg', 8, '2007-06-19 21:22:20');
INSERT INTO obrazky VALUES (94, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070619092238.jpg', 8, '2007-06-19 21:22:38');
INSERT INTO obrazky VALUES (95, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070619092257.jpg', 8, '2007-06-19 21:22:57');
INSERT INTO obrazky VALUES (96, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070619092319.jpg', 8, '2007-06-19 21:23:19');
INSERT INTO obrazky VALUES (97, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070619092332.jpg', 8, '2007-06-19 21:23:32');
INSERT INTO obrazky VALUES (98, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070808023614.jpg', 9, '2007-08-08 14:36:14');
INSERT INTO obrazky VALUES (99, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070808023629.jpg', 9, '2007-08-08 14:36:29');
INSERT INTO obrazky VALUES (100, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070808023644.jpg', 9, '2007-08-08 14:36:44');
INSERT INTO obrazky VALUES (101, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070808023713.jpg', 9, '2007-08-08 14:37:13');
INSERT INTO obrazky VALUES (102, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070808023726.jpg', 9, '2007-08-08 14:37:26');
INSERT INTO obrazky VALUES (103, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070808023738.jpg', 9, '2007-08-08 14:37:38');
INSERT INTO obrazky VALUES (104, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070808023749.jpg', 9, '2007-08-08 14:37:50');
INSERT INTO obrazky VALUES (105, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070808023802.jpg', 9, '2007-08-08 14:38:02');
INSERT INTO obrazky VALUES (106, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012145.jpg', 10, '2007-08-13 13:21:45');
INSERT INTO obrazky VALUES (107, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012212.jpg', 10, '2007-08-13 13:22:12');
INSERT INTO obrazky VALUES (108, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012228.jpg', 10, '2007-08-13 13:22:28');
INSERT INTO obrazky VALUES (109, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012241.jpg', 10, '2007-08-13 13:22:42');
INSERT INTO obrazky VALUES (110, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012345.jpg', 10, '2007-08-13 13:23:45');
INSERT INTO obrazky VALUES (111, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012405.jpg', 10, '2007-08-13 13:24:05');
INSERT INTO obrazky VALUES (112, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012419.jpg', 10, '2007-08-13 13:24:19');
INSERT INTO obrazky VALUES (113, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012431.jpg', 10, '2007-08-13 13:24:31');
INSERT INTO obrazky VALUES (114, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012447.jpg', 10, '2007-08-13 13:24:47');
INSERT INTO obrazky VALUES (115, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012502.jpg', 10, '2007-08-13 13:25:02');
INSERT INTO obrazky VALUES (116, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012514.jpg', 10, '2007-08-13 13:25:14');
INSERT INTO obrazky VALUES (117, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012530.jpg', 10, '2007-08-13 13:25:30');
INSERT INTO obrazky VALUES (118, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012545.jpg', 10, '2007-08-13 13:25:45');
INSERT INTO obrazky VALUES (119, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012600.jpg', 10, '2007-08-13 13:26:00');
INSERT INTO obrazky VALUES (120, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012613.jpg', 10, '2007-08-13 13:26:13');
INSERT INTO obrazky VALUES (121, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012628.jpg', 10, '2007-08-13 13:26:28');
INSERT INTO obrazky VALUES (122, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012646.jpg', 10, '2007-08-13 13:26:46');
INSERT INTO obrazky VALUES (123, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012703.jpg', 10, '2007-08-13 13:27:03');
INSERT INTO obrazky VALUES (124, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012720.jpg', 10, '2007-08-13 13:27:20');
INSERT INTO obrazky VALUES (125, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012740.jpg', 10, '2007-08-13 13:27:40');
INSERT INTO obrazky VALUES (126, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012754.jpg', 10, '2007-08-13 13:27:54');
INSERT INTO obrazky VALUES (127, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012819.jpg', 10, '2007-08-13 13:28:19');
INSERT INTO obrazky VALUES (128, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012832.jpg', 10, '2007-08-13 13:28:33');
INSERT INTO obrazky VALUES (129, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012850.jpg', 10, '2007-08-13 13:28:50');
INSERT INTO obrazky VALUES (130, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012908.jpg', 10, '2007-08-13 13:29:08');
INSERT INTO obrazky VALUES (131, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-070813012934.jpg', 10, '2007-08-13 13:29:35');
INSERT INTO obrazky VALUES (133, 'Znavení herci', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831121003.jpg', 11, '2007-08-31 12:10:03');
INSERT INTO obrazky VALUES (134, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831121806.jpg', 11, '2007-08-31 12:18:06');
INSERT INTO obrazky VALUES (135, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831122126.jpg', 11, '2007-08-31 12:21:26');
INSERT INTO obrazky VALUES (136, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831122452.jpg', 11, '2007-08-31 12:24:52');
INSERT INTO obrazky VALUES (137, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831122550.jpg', 11, '2007-08-31 12:25:50');
INSERT INTO obrazky VALUES (138, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831122611.jpg', 11, '2007-08-31 12:26:11');
INSERT INTO obrazky VALUES (139, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831122632.jpg', 11, '2007-08-31 12:26:32');
INSERT INTO obrazky VALUES (140, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831122716.jpg', 11, '2007-08-31 12:27:16');
INSERT INTO obrazky VALUES (141, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831122858.jpg', 11, '2007-08-31 12:28:58');
INSERT INTO obrazky VALUES (142, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831122920.jpg', 11, '2007-08-31 12:29:20');
INSERT INTO obrazky VALUES (143, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831122947.jpg', 11, '2007-08-31 12:29:47');
INSERT INTO obrazky VALUES (144, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831123008.jpg', 11, '2007-08-31 12:30:08');
INSERT INTO obrazky VALUES (145, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831123038.jpg', 11, '2007-08-31 12:30:38');
INSERT INTO obrazky VALUES (146, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831123108.jpg', 11, '2007-08-31 12:31:08');
INSERT INTO obrazky VALUES (147, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831123132.jpg', 11, '2007-08-31 12:31:32');
INSERT INTO obrazky VALUES (148, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831123212.jpg', 11, '2007-08-31 12:32:12');
INSERT INTO obrazky VALUES (149, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831123237.jpg', 11, '2007-08-31 12:32:37');
INSERT INTO obrazky VALUES (150, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831123302.jpg', 11, '2007-08-31 12:33:02');
INSERT INTO obrazky VALUES (151, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070831123332.jpg', 11, '2007-08-31 12:33:32');
INSERT INTO obrazky VALUES (152, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916013530.jpg', 11, '2007-09-16 13:35:30');
INSERT INTO obrazky VALUES (153, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916013904.jpg', 11, '2007-09-16 13:39:04');
INSERT INTO obrazky VALUES (154, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916013921.jpg', 11, '2007-09-16 13:39:21');
INSERT INTO obrazky VALUES (155, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916013936.jpg', 11, '2007-09-16 13:39:36');
INSERT INTO obrazky VALUES (156, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916013954.jpg', 11, '2007-09-16 13:39:54');
INSERT INTO obrazky VALUES (157, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916014015.jpg', 11, '2007-09-16 13:40:15');
INSERT INTO obrazky VALUES (158, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916014034.jpg', 11, '2007-09-16 13:40:34');
INSERT INTO obrazky VALUES (159, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916014054.jpg', 11, '2007-09-16 13:40:54');
INSERT INTO obrazky VALUES (160, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916014125.jpg', 11, '2007-09-16 13:41:25');
INSERT INTO obrazky VALUES (161, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916014141.jpg', 11, '2007-09-16 13:41:41');
INSERT INTO obrazky VALUES (162, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916014200.jpg', 11, '2007-09-16 13:42:01');
INSERT INTO obrazky VALUES (163, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916014248.jpg', 11, '2007-09-16 13:42:48');
INSERT INTO obrazky VALUES (164, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916014307.jpg', 11, '2007-09-16 13:43:07');
INSERT INTO obrazky VALUES (165, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916014328.jpg', 11, '2007-09-16 13:43:29');
INSERT INTO obrazky VALUES (166, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916014354.jpg', 11, '2007-09-16 13:43:54');
INSERT INTO obrazky VALUES (167, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-070916014411.jpg', 11, '2007-09-16 13:44:11');
INSERT INTO obrazky VALUES (168, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-071020035403.jpg', 12, '2007-10-20 15:54:03');
INSERT INTO obrazky VALUES (169, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-071020035431.jpg', 12, '2007-10-20 15:54:31');
INSERT INTO obrazky VALUES (170, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-071020035456.jpg', 12, '2007-10-20 15:54:56');
INSERT INTO obrazky VALUES (171, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-071020035520.jpg', 12, '2007-10-20 15:55:20');
INSERT INTO obrazky VALUES (172, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-071020035540.jpg', 12, '2007-10-20 15:55:40');
INSERT INTO obrazky VALUES (173, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-071020035601.jpg', 12, '2007-10-20 15:56:01');
INSERT INTO obrazky VALUES (174, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-071020035622.jpg', 12, '2007-10-20 15:56:22');
INSERT INTO obrazky VALUES (175, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-071020035636.jpg', 12, '2007-10-20 15:56:36');
INSERT INTO obrazky VALUES (176, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513051131.jpg', 12, '2008-05-13 17:11:31');
INSERT INTO obrazky VALUES (177, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513051159.jpg', 12, '2008-05-13 17:11:59');
INSERT INTO obrazky VALUES (178, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513051219.jpg', 12, '2008-05-13 17:12:19');
INSERT INTO obrazky VALUES (179, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513051233.jpg', 12, '2008-05-13 17:12:33');
INSERT INTO obrazky VALUES (180, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513051254.jpg', 12, '2008-05-13 17:12:54');
INSERT INTO obrazky VALUES (181, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513051318.jpg', 12, '2008-05-13 17:13:18');
INSERT INTO obrazky VALUES (182, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513051355.jpg', 12, '2008-05-13 17:13:55');
INSERT INTO obrazky VALUES (234, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042455.jpg', 15, '2008-08-15 16:24:55');
INSERT INTO obrazky VALUES (235, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042520.jpg', 15, '2008-08-15 16:25:20');
INSERT INTO obrazky VALUES (236, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042533.jpg', 15, '2008-08-15 16:25:33');
INSERT INTO obrazky VALUES (237, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042544.jpg', 15, '2008-08-15 16:25:44');
INSERT INTO obrazky VALUES (238, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042556.jpg', 15, '2008-08-15 16:25:56');
INSERT INTO obrazky VALUES (239, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042606.jpg', 15, '2008-08-15 16:26:06');
INSERT INTO obrazky VALUES (240, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042626.jpg', 15, '2008-08-15 16:26:26');
INSERT INTO obrazky VALUES (241, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042638.jpg', 15, '2008-08-15 16:26:38');
INSERT INTO obrazky VALUES (242, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042652.jpg', 15, '2008-08-15 16:26:52');
INSERT INTO obrazky VALUES (243, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042704.jpg', 15, '2008-08-15 16:27:04');
INSERT INTO obrazky VALUES (244, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042715.jpg', 15, '2008-08-15 16:27:15');
INSERT INTO obrazky VALUES (245, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042725.jpg', 15, '2008-08-15 16:27:25');
INSERT INTO obrazky VALUES (246, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042737.jpg', 15, '2008-08-15 16:27:37');
INSERT INTO obrazky VALUES (247, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042747.jpg', 15, '2008-08-15 16:27:47');
INSERT INTO obrazky VALUES (248, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042757.jpg', 15, '2008-08-15 16:27:57');
INSERT INTO obrazky VALUES (249, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042808.jpg', 15, '2008-08-15 16:28:08');
INSERT INTO obrazky VALUES (250, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042821.jpg', 15, '2008-08-15 16:28:21');
INSERT INTO obrazky VALUES (251, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042830.jpg', 15, '2008-08-15 16:28:30');
INSERT INTO obrazky VALUES (252, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042840.jpg', 15, '2008-08-15 16:28:40');
INSERT INTO obrazky VALUES (253, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042901.jpg', 15, '2008-08-15 16:29:01');
INSERT INTO obrazky VALUES (254, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042914.jpg', 15, '2008-08-15 16:29:14');
INSERT INTO obrazky VALUES (255, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042925.jpg', 15, '2008-08-15 16:29:25');
INSERT INTO obrazky VALUES (256, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080815042937.jpg', 15, '2008-08-15 16:29:37');
INSERT INTO obrazky VALUES (257, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103621.jpg', 16, '2008-09-08 22:36:23');
INSERT INTO obrazky VALUES (258, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103641.jpg', 16, '2008-09-08 22:36:41');
INSERT INTO obrazky VALUES (259, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103703.jpg', 16, '2008-09-08 22:37:03');
INSERT INTO obrazky VALUES (260, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103720.jpg', 16, '2008-09-08 22:37:20');
INSERT INTO obrazky VALUES (261, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103730.jpg', 16, '2008-09-08 22:37:30');
INSERT INTO obrazky VALUES (262, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103746.jpg', 16, '2008-09-08 22:37:46');
INSERT INTO obrazky VALUES (263, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103803.jpg', 16, '2008-09-08 22:38:07');
INSERT INTO obrazky VALUES (264, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103822.jpg', 16, '2008-09-08 22:38:23');
INSERT INTO obrazky VALUES (265, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103840.jpg', 16, '2008-09-08 22:38:41');
INSERT INTO obrazky VALUES (266, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103858.jpg', 16, '2008-09-08 22:38:59');
INSERT INTO obrazky VALUES (267, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103912.jpg', 16, '2008-09-08 22:39:13');
INSERT INTO obrazky VALUES (268, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103926.jpg', 16, '2008-09-08 22:39:27');
INSERT INTO obrazky VALUES (269, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103939.jpg', 16, '2008-09-08 22:39:39');
INSERT INTO obrazky VALUES (270, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908103951.jpg', 16, '2008-09-08 22:39:51');
INSERT INTO obrazky VALUES (271, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908104004.jpg', 16, '2008-09-08 22:40:09');
INSERT INTO obrazky VALUES (272, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908104020.jpg', 16, '2008-09-08 22:40:20');
INSERT INTO obrazky VALUES (273, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908104035.jpg', 16, '2008-09-08 22:40:35');
INSERT INTO obrazky VALUES (274, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908104046.jpg', 16, '2008-09-08 22:40:56');
INSERT INTO obrazky VALUES (275, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908104108.jpg', 16, '2008-09-08 22:41:08');
INSERT INTO obrazky VALUES (276, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-080908104122.jpg', 16, '2008-09-08 22:41:23');
INSERT INTO obrazky VALUES (277, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-091015091335.jpg', 17, '2009-10-15 21:13:36');
INSERT INTO obrazky VALUES (278, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-091015091355.jpg', 17, '2009-10-15 21:13:55');
INSERT INTO obrazky VALUES (279, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-091015091419.jpg', 17, '2009-10-15 21:14:19');
INSERT INTO obrazky VALUES (280, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-091015091443.jpg', 17, '2009-10-15 21:14:43');
INSERT INTO obrazky VALUES (281, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-091015091515.jpg', 17, '2009-10-15 21:15:15');
INSERT INTO obrazky VALUES (282, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-091015091539.jpg', 17, '2009-10-15 21:15:39');
INSERT INTO obrazky VALUES (283, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-091015091611.jpg', 17, '2009-10-15 21:16:11');
INSERT INTO obrazky VALUES (284, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-091015091644.jpg', 17, '2009-10-15 21:16:44');
INSERT INTO obrazky VALUES (285, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-091015091712.jpg', 17, '2009-10-15 21:17:12');
INSERT INTO obrazky VALUES (286, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-091015091735.jpg', 17, '2009-10-15 21:17:35');
INSERT INTO obrazky VALUES (287, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-091015091800.jpg', 17, '2009-10-15 21:18:00');
INSERT INTO obrazky VALUES (183, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513051742.jpg', 14, '2008-05-13 17:17:42');
INSERT INTO obrazky VALUES (184, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513051803.jpg', 14, '2008-05-13 17:18:03');
INSERT INTO obrazky VALUES (185, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513051901.jpg', 14, '2008-05-13 17:19:01');
INSERT INTO obrazky VALUES (186, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513051919.jpg', 14, '2008-05-13 17:19:19');
INSERT INTO obrazky VALUES (187, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513051938.jpg', 14, '2008-05-13 17:19:38');
INSERT INTO obrazky VALUES (188, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052018.jpg', 14, '2008-05-13 17:20:18');
INSERT INTO obrazky VALUES (189, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052034.jpg', 14, '2008-05-13 17:20:34');
INSERT INTO obrazky VALUES (190, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052051.jpg', 14, '2008-05-13 17:20:51');
INSERT INTO obrazky VALUES (191, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052106.jpg', 14, '2008-05-13 17:21:06');
INSERT INTO obrazky VALUES (192, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052125.jpg', 14, '2008-05-13 17:21:25');
INSERT INTO obrazky VALUES (193, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052141.jpg', 14, '2008-05-13 17:21:42');
INSERT INTO obrazky VALUES (194, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052226.jpg', 14, '2008-05-13 17:22:26');
INSERT INTO obrazky VALUES (195, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052244.jpg', 14, '2008-05-13 17:22:44');
INSERT INTO obrazky VALUES (196, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052300.jpg', 14, '2008-05-13 17:23:00');
INSERT INTO obrazky VALUES (197, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052319.jpg', 14, '2008-05-13 17:23:19');
INSERT INTO obrazky VALUES (198, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052335.jpg', 14, '2008-05-13 17:23:35');
INSERT INTO obrazky VALUES (199, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052351.jpg', 14, '2008-05-13 17:23:51');
INSERT INTO obrazky VALUES (200, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052425.jpg', 14, '2008-05-13 17:24:26');
INSERT INTO obrazky VALUES (201, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052447.jpg', 14, '2008-05-13 17:24:47');
INSERT INTO obrazky VALUES (202, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052515.jpg', 14, '2008-05-13 17:25:15');
INSERT INTO obrazky VALUES (203, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052605.jpg', 14, '2008-05-13 17:26:05');
INSERT INTO obrazky VALUES (204, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052628.jpg', 14, '2008-05-13 17:26:28');
INSERT INTO obrazky VALUES (205, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052647.jpg', 14, '2008-05-13 17:26:47');
INSERT INTO obrazky VALUES (206, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052706.jpg', 14, '2008-05-13 17:27:06');
INSERT INTO obrazky VALUES (207, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052722.jpg', 14, '2008-05-13 17:27:22');
INSERT INTO obrazky VALUES (208, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052740.jpg', 14, '2008-05-13 17:27:40');
INSERT INTO obrazky VALUES (209, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052817.jpg', 14, '2008-05-13 17:28:17');
INSERT INTO obrazky VALUES (210, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052834.jpg', 14, '2008-05-13 17:28:34');
INSERT INTO obrazky VALUES (211, 'Ženich a nevěsta', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052856.jpg', 14, '2008-05-13 17:28:56');
INSERT INTO obrazky VALUES (212, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052938.jpg', 14, '2008-05-13 17:29:38');
INSERT INTO obrazky VALUES (213, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513052956.jpg', 14, '2008-05-13 17:29:56');
INSERT INTO obrazky VALUES (214, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513053013.jpg', 14, '2008-05-13 17:30:14');
INSERT INTO obrazky VALUES (215, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513053057.jpg', 14, '2008-05-13 17:30:57');
INSERT INTO obrazky VALUES (216, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513053111.jpg', 14, '2008-05-13 17:31:11');
INSERT INTO obrazky VALUES (217, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Alky-080513053127.jpg', 14, '2008-05-13 17:31:27');
INSERT INTO obrazky VALUES (218, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021041.jpg', 13, '2008-06-24 14:10:41');
INSERT INTO obrazky VALUES (219, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021118.jpg', 13, '2008-06-24 14:11:18');
INSERT INTO obrazky VALUES (220, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021132.jpg', 13, '2008-06-24 14:11:32');
INSERT INTO obrazky VALUES (221, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021205.jpg', 13, '2008-06-24 14:12:05');
INSERT INTO obrazky VALUES (222, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021219.jpg', 13, '2008-06-24 14:12:19');
INSERT INTO obrazky VALUES (223, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021233.jpg', 13, '2008-06-24 14:12:33');
INSERT INTO obrazky VALUES (224, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021246.jpg', 13, '2008-06-24 14:12:46');
INSERT INTO obrazky VALUES (225, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021301.jpg', 13, '2008-06-24 14:13:01');
INSERT INTO obrazky VALUES (226, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021316.jpg', 13, '2008-06-24 14:13:16');
INSERT INTO obrazky VALUES (227, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021348.jpg', 13, '2008-06-24 14:13:48');
INSERT INTO obrazky VALUES (228, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021401.jpg', 13, '2008-06-24 14:14:01');
INSERT INTO obrazky VALUES (229, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021415.jpg', 13, '2008-06-24 14:14:15');
INSERT INTO obrazky VALUES (230, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021429.jpg', 13, '2008-06-24 14:14:29');
INSERT INTO obrazky VALUES (231, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021502.jpg', 13, '2008-06-24 14:15:03');
INSERT INTO obrazky VALUES (232, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021520.jpg', 13, '2008-06-24 14:15:20');
INSERT INTO obrazky VALUES (233, '', '', 'alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-alky-080624021534.jpg', 13, '2008-06-24 14:15:34');
INSERT INTO obrazky VALUES (290, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121055.jpeg', 20, '2010-07-08 12:10:55.803842');
INSERT INTO obrazky VALUES (291, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121132.jpeg', 20, '2010-07-08 12:11:32.551032');
INSERT INTO obrazky VALUES (292, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121150.jpeg', 20, '2010-07-08 12:11:50.888617');
INSERT INTO obrazky VALUES (293, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121203.jpeg', 20, '2010-07-08 12:12:03.480299');
INSERT INTO obrazky VALUES (294, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121216.jpeg', 20, '2010-07-08 12:12:16.636201');
INSERT INTO obrazky VALUES (295, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121232.jpeg', 20, '2010-07-08 12:12:33.017022');
INSERT INTO obrazky VALUES (296, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121248.jpeg', 20, '2010-07-08 12:12:48.331595');
INSERT INTO obrazky VALUES (297, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121305.jpeg', 20, '2010-07-08 12:13:05.582907');
INSERT INTO obrazky VALUES (298, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121322.jpeg', 20, '2010-07-08 12:13:22.883684');
INSERT INTO obrazky VALUES (299, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121338.jpeg', 20, '2010-07-08 12:13:38.108392');
INSERT INTO obrazky VALUES (300, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121349.jpeg', 20, '2010-07-08 12:13:49.873828');
INSERT INTO obrazky VALUES (301, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121411.jpeg', 20, '2010-07-08 12:14:11.149003');
INSERT INTO obrazky VALUES (302, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121426.jpeg', 20, '2010-07-08 12:14:26.275498');
INSERT INTO obrazky VALUES (303, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121439.jpeg', 20, '2010-07-08 12:14:39.567046');
INSERT INTO obrazky VALUES (304, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121457.jpeg', 20, '2010-07-08 12:14:57.584084');
INSERT INTO obrazky VALUES (305, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121511.jpeg', 20, '2010-07-08 12:15:11.912672');
INSERT INTO obrazky VALUES (306, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121526.jpeg', 20, '2010-07-08 12:15:27.01744');
INSERT INTO obrazky VALUES (307, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121541.jpeg', 20, '2010-07-08 12:15:41.193672');
INSERT INTO obrazky VALUES (308, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121554.jpeg', 20, '2010-07-08 12:15:54.326569');
INSERT INTO obrazky VALUES (309, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121609.jpeg', 20, '2010-07-08 12:16:09.509828');
INSERT INTO obrazky VALUES (310, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121623.jpeg', 20, '2010-07-08 12:16:23.224913');
INSERT INTO obrazky VALUES (311, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121638.jpeg', 20, '2010-07-08 12:16:38.964768');
INSERT INTO obrazky VALUES (312, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121655.jpeg', 20, '2010-07-08 12:16:55.083086');
INSERT INTO obrazky VALUES (313, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121710.jpeg', 20, '2010-07-08 12:17:10.65107');
INSERT INTO obrazky VALUES (314, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-Pilly-100708121724.jpeg', 20, '2010-07-08 12:17:25.018024');
INSERT INTO obrazky VALUES (315, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-kořen-100904120928.jpeg', 21, '2010-09-04 12:09:28.422878');
INSERT INTO obrazky VALUES (316, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162240-00.jpeg', 21, '2010-09-04 16:22:40.725243');
INSERT INTO obrazky VALUES (317, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162240-01.jpeg', 21, '2010-09-04 16:22:40.750249');
INSERT INTO obrazky VALUES (318, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162240-02.jpeg', 21, '2010-09-04 16:22:40.78252');
INSERT INTO obrazky VALUES (319, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162240-03.jpeg', 21, '2010-09-04 16:22:40.802778');
INSERT INTO obrazky VALUES (320, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162240-04.jpeg', 21, '2010-09-04 16:22:40.821772');
INSERT INTO obrazky VALUES (321, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162240-05.jpeg', 21, '2010-09-04 16:22:40.844029');
INSERT INTO obrazky VALUES (322, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162240-06.jpeg', 21, '2010-09-04 16:22:40.951284');
INSERT INTO obrazky VALUES (323, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162240-07.jpeg', 21, '2010-09-04 16:22:41.059587');
INSERT INTO obrazky VALUES (324, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162241-08.jpeg', 21, '2010-09-04 16:22:41.171268');
INSERT INTO obrazky VALUES (325, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162241-09.jpeg', 21, '2010-09-04 16:22:41.295924');
INSERT INTO obrazky VALUES (326, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162420-00.jpeg', 21, '2010-09-04 16:24:20.157024');
INSERT INTO obrazky VALUES (327, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162420-01.jpeg', 21, '2010-09-04 16:24:20.181551');
INSERT INTO obrazky VALUES (328, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162420-02.jpeg', 21, '2010-09-04 16:24:20.220879');
INSERT INTO obrazky VALUES (329, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162420-03.jpeg', 21, '2010-09-04 16:24:20.253802');
INSERT INTO obrazky VALUES (330, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162420-04.jpeg', 21, '2010-09-04 16:24:20.28056');
INSERT INTO obrazky VALUES (331, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162420-05.jpeg', 21, '2010-09-04 16:24:20.305799');
INSERT INTO obrazky VALUES (332, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162420-06.jpeg', 21, '2010-09-04 16:24:20.428946');
INSERT INTO obrazky VALUES (333, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162420-07.jpeg', 21, '2010-09-04 16:24:20.535123');
INSERT INTO obrazky VALUES (334, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162420-08.jpeg', 21, '2010-09-04 16:24:20.642027');
INSERT INTO obrazky VALUES (335, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162420-09.jpeg', 21, '2010-09-04 16:24:20.76467');
INSERT INTO obrazky VALUES (336, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162612-00.jpeg', 21, '2010-09-04 16:26:12.571299');
INSERT INTO obrazky VALUES (337, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162612-01.jpeg', 21, '2010-09-04 16:26:12.595325');
INSERT INTO obrazky VALUES (338, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162612-02.jpeg', 21, '2010-09-04 16:26:12.616538');
INSERT INTO obrazky VALUES (339, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162612-03.jpeg', 21, '2010-09-04 16:26:12.641852');
INSERT INTO obrazky VALUES (340, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162612-04.jpeg', 21, '2010-09-04 16:26:12.667026');
INSERT INTO obrazky VALUES (341, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162612-05.jpeg', 21, '2010-09-04 16:26:12.688871');
INSERT INTO obrazky VALUES (342, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162612-06.jpeg', 21, '2010-09-04 16:26:12.804918');
INSERT INTO obrazky VALUES (343, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162612-07.jpeg', 21, '2010-09-04 16:26:12.925984');
INSERT INTO obrazky VALUES (344, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162612-08.jpeg', 21, '2010-09-04 16:26:13.033442');
INSERT INTO obrazky VALUES (345, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162613-09.jpeg', 21, '2010-09-04 16:26:13.143808');
INSERT INTO obrazky VALUES (346, '', '', 'kořen', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20100904162624-00.jpeg', 21, '2010-09-04 16:26:25.014105');
INSERT INTO obrazky VALUES (347, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013211704-00.jpeg', 22, '2010-10-13 21:17:04.967639');
INSERT INTO obrazky VALUES (348, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013211704-01.jpeg', 22, '2010-10-13 21:17:05.02017');
INSERT INTO obrazky VALUES (349, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013211705-02.jpeg', 22, '2010-10-13 21:17:05.056363');
INSERT INTO obrazky VALUES (350, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013211705-03.jpeg', 22, '2010-10-13 21:17:05.129626');
INSERT INTO obrazky VALUES (351, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013211705-04.jpeg', 22, '2010-10-13 21:17:05.259498');
INSERT INTO obrazky VALUES (352, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013211705-05.jpeg', 22, '2010-10-13 21:17:05.421308');
INSERT INTO obrazky VALUES (353, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013211705-06.jpeg', 22, '2010-10-13 21:17:05.583277');
INSERT INTO obrazky VALUES (354, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013211705-07.jpeg', 22, '2010-10-13 21:17:05.744879');
INSERT INTO obrazky VALUES (355, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013211705-08.jpeg', 22, '2010-10-13 21:17:05.903586');
INSERT INTO obrazky VALUES (356, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013211705-09.jpeg', 22, '2010-10-13 21:17:06.061096');
INSERT INTO obrazky VALUES (357, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013212003-00.jpeg', 22, '2010-10-13 21:20:03.940893');
INSERT INTO obrazky VALUES (358, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013212003-01.jpeg', 22, '2010-10-13 21:20:04.029547');
INSERT INTO obrazky VALUES (359, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013212004-02.jpeg', 22, '2010-10-13 21:20:04.09412');
INSERT INTO obrazky VALUES (360, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013212004-03.jpeg', 22, '2010-10-13 21:20:04.179842');
INSERT INTO obrazky VALUES (361, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013212004-04.jpeg', 22, '2010-10-13 21:20:04.236481');
INSERT INTO obrazky VALUES (362, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013212004-05.jpeg', 22, '2010-10-13 21:20:04.2812');
INSERT INTO obrazky VALUES (363, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013212004-06.jpeg', 22, '2010-10-13 21:20:04.319308');
INSERT INTO obrazky VALUES (364, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013212004-07.jpeg', 22, '2010-10-13 21:20:04.474316');
INSERT INTO obrazky VALUES (365, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013212004-08.jpeg', 22, '2010-10-13 21:20:04.601132');
INSERT INTO obrazky VALUES (366, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013212004-09.jpeg', 22, '2010-10-13 21:20:04.761667');
INSERT INTO obrazky VALUES (367, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013213452-00.jpeg', 23, '2010-10-13 21:34:52.053255');
INSERT INTO obrazky VALUES (368, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013213452-01.jpeg', 23, '2010-10-13 21:34:52.085785');
INSERT INTO obrazky VALUES (369, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013213452-02.jpeg', 23, '2010-10-13 21:34:52.114258');
INSERT INTO obrazky VALUES (370, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013213452-03.jpeg', 23, '2010-10-13 21:34:52.143383');
INSERT INTO obrazky VALUES (371, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013213452-04.jpeg', 23, '2010-10-13 21:34:52.203736');
INSERT INTO obrazky VALUES (372, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013213452-05.jpeg', 23, '2010-10-13 21:34:52.362899');
INSERT INTO obrazky VALUES (373, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013213452-06.jpeg', 23, '2010-10-13 21:34:52.522415');
INSERT INTO obrazky VALUES (374, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013213452-07.jpeg', 23, '2010-10-13 21:34:52.697354');
INSERT INTO obrazky VALUES (375, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013213452-08.jpeg', 23, '2010-10-13 21:34:52.842365');
INSERT INTO obrazky VALUES (376, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101013213452-09.jpeg', 23, '2010-10-13 21:34:53.004129');
INSERT INTO obrazky VALUES (377, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101228113409-00.jpeg', 24, '2010-12-28 11:34:09.301741');
INSERT INTO obrazky VALUES (378, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101228113515-00.jpeg', 24, '2010-12-28 11:35:15.893913');
INSERT INTO obrazky VALUES (379, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101228113515-01.jpeg', 24, '2010-12-28 11:35:15.923195');
INSERT INTO obrazky VALUES (380, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101228113515-02.jpeg', 24, '2010-12-28 11:35:15.967269');
INSERT INTO obrazky VALUES (381, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101228113515-03.jpeg', 24, '2010-12-28 11:35:16.013927');
INSERT INTO obrazky VALUES (382, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101228113516-04.jpeg', 24, '2010-12-28 11:35:16.123972');
INSERT INTO obrazky VALUES (383, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101228113516-05.jpeg', 24, '2010-12-28 11:35:16.302627');
INSERT INTO obrazky VALUES (384, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101228113516-06.jpeg', 24, '2010-12-28 11:35:16.484052');
INSERT INTO obrazky VALUES (385, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20101228113516-07.jpeg', 24, '2010-12-28 11:35:16.666555');
INSERT INTO obrazky VALUES (386, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110128174556-00.jpeg', 25, '2011-01-28 17:45:56.656925');
INSERT INTO obrazky VALUES (387, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110128174655-00.jpeg', 25, '2011-01-28 17:46:55.326635');
INSERT INTO obrazky VALUES (388, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110128174655-01.jpeg', 25, '2011-01-28 17:46:55.383479');
INSERT INTO obrazky VALUES (389, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110130122332-00.jpeg', 25, '2011-01-30 12:23:32.427676');
INSERT INTO obrazky VALUES (390, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110130122332-01.jpeg', 25, '2011-01-30 12:23:32.576171');
INSERT INTO obrazky VALUES (391, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110130122332-02.jpeg', 25, '2011-01-30 12:23:32.593554');
INSERT INTO obrazky VALUES (392, '', '', 'Zagro', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110211215450-00.jpeg', 25, '2011-02-11 21:54:50.751204');
INSERT INTO obrazky VALUES (393, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222350-00.jpeg', 26, '2011-03-13 22:23:50.92463');
INSERT INTO obrazky VALUES (394, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222350-01.jpeg', 26, '2011-03-13 22:23:50.997072');
INSERT INTO obrazky VALUES (395, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222350-02.jpeg', 26, '2011-03-13 22:23:51.037103');
INSERT INTO obrazky VALUES (396, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222351-03.jpeg', 26, '2011-03-13 22:23:51.070733');
INSERT INTO obrazky VALUES (397, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222351-04.jpeg', 26, '2011-03-13 22:23:51.122349');
INSERT INTO obrazky VALUES (398, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222351-05.jpeg', 26, '2011-03-13 22:23:51.251577');
INSERT INTO obrazky VALUES (399, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222351-06.jpeg', 26, '2011-03-13 22:23:51.382062');
INSERT INTO obrazky VALUES (400, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222351-07.jpeg', 26, '2011-03-13 22:23:51.531616');
INSERT INTO obrazky VALUES (401, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222351-08.jpeg', 26, '2011-03-13 22:23:51.658447');
INSERT INTO obrazky VALUES (402, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222351-09.jpeg', 26, '2011-03-13 22:23:51.794458');
INSERT INTO obrazky VALUES (403, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222733-02.jpeg', 26, '2011-03-13 22:27:33.228272');
INSERT INTO obrazky VALUES (404, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222733-03.jpeg', 26, '2011-03-13 22:27:33.263503');
INSERT INTO obrazky VALUES (405, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222733-04.jpeg', 26, '2011-03-13 22:27:33.29535');
INSERT INTO obrazky VALUES (406, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110313222733-05.jpeg', 26, '2011-03-13 22:27:33.328538');
INSERT INTO obrazky VALUES (407, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110326170024-00.jpeg', 25, '2011-03-26 17:00:24.204844');
INSERT INTO obrazky VALUES (408, '', '', 'Alky', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110326170024-01.jpeg', 25, '2011-03-26 17:00:24.374547');
INSERT INTO obrazky VALUES (409, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110509-00.jpeg', 27, '2011-04-04 11:05:09.833249');
INSERT INTO obrazky VALUES (410, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110509-01.jpeg', 27, '2011-04-04 11:05:09.881917');
INSERT INTO obrazky VALUES (411, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110509-02.jpeg', 27, '2011-04-04 11:05:09.915877');
INSERT INTO obrazky VALUES (412, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110509-03.jpeg', 27, '2011-04-04 11:05:09.952251');
INSERT INTO obrazky VALUES (413, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110509-04.jpeg', 27, '2011-04-04 11:05:09.979851');
INSERT INTO obrazky VALUES (414, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110509-05.jpeg', 27, '2011-04-04 11:05:10.005673');
INSERT INTO obrazky VALUES (415, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110510-06.jpeg', 27, '2011-04-04 11:05:10.075711');
INSERT INTO obrazky VALUES (416, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110510-07.jpeg', 27, '2011-04-04 11:05:10.172983');
INSERT INTO obrazky VALUES (417, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110510-08.jpeg', 27, '2011-04-04 11:05:10.270235');
INSERT INTO obrazky VALUES (418, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110510-09.jpeg', 27, '2011-04-04 11:05:10.367937');
INSERT INTO obrazky VALUES (419, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110809-00.jpeg', 27, '2011-04-04 11:08:09.187712');
INSERT INTO obrazky VALUES (420, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110809-01.jpeg', 27, '2011-04-04 11:08:09.214881');
INSERT INTO obrazky VALUES (421, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110809-02.jpeg', 27, '2011-04-04 11:08:09.239702');
INSERT INTO obrazky VALUES (422, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110809-03.jpeg', 27, '2011-04-04 11:08:09.265575');
INSERT INTO obrazky VALUES (423, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110809-04.jpeg', 27, '2011-04-04 11:08:09.299252');
INSERT INTO obrazky VALUES (424, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110809-05.jpeg', 27, '2011-04-04 11:08:09.324521');
INSERT INTO obrazky VALUES (425, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110809-06.jpeg', 27, '2011-04-04 11:08:09.370543');
INSERT INTO obrazky VALUES (426, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110809-07.jpeg', 27, '2011-04-04 11:08:09.695457');
INSERT INTO obrazky VALUES (427, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110809-08.jpeg', 27, '2011-04-04 11:08:09.728664');
INSERT INTO obrazky VALUES (428, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404110809-09.jpeg', 27, '2011-04-04 11:08:09.75513');
INSERT INTO obrazky VALUES (429, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111107-00.jpeg', 27, '2011-04-04 11:11:07.087054');
INSERT INTO obrazky VALUES (430, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111107-01.jpeg', 27, '2011-04-04 11:11:07.125788');
INSERT INTO obrazky VALUES (431, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111107-02.jpeg', 27, '2011-04-04 11:11:07.150553');
INSERT INTO obrazky VALUES (432, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111107-03.jpeg', 27, '2011-04-04 11:11:07.179229');
INSERT INTO obrazky VALUES (433, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111107-04.jpeg', 27, '2011-04-04 11:11:07.208747');
INSERT INTO obrazky VALUES (434, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111107-05.jpeg', 27, '2011-04-04 11:11:07.23769');
INSERT INTO obrazky VALUES (435, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111107-06.jpeg', 27, '2011-04-04 11:11:07.318977');
INSERT INTO obrazky VALUES (436, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111107-07.jpeg', 27, '2011-04-04 11:11:07.418944');
INSERT INTO obrazky VALUES (437, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111107-08.jpeg', 27, '2011-04-04 11:11:07.505554');
INSERT INTO obrazky VALUES (438, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111107-09.jpeg', 27, '2011-04-04 11:11:07.621869');
INSERT INTO obrazky VALUES (439, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111144-00.jpeg', 27, '2011-04-04 11:11:44.978153');
INSERT INTO obrazky VALUES (440, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111144-01.jpeg', 27, '2011-04-04 11:11:45.011013');
INSERT INTO obrazky VALUES (441, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111145-02.jpeg', 27, '2011-04-04 11:11:45.040969');
INSERT INTO obrazky VALUES (442, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111355-00.jpeg', 28, '2011-04-04 11:13:55.127082');
INSERT INTO obrazky VALUES (443, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111355-01.jpeg', 28, '2011-04-04 11:13:55.160388');
INSERT INTO obrazky VALUES (444, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111355-02.jpeg', 28, '2011-04-04 11:13:55.198005');
INSERT INTO obrazky VALUES (445, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111355-03.jpeg', 28, '2011-04-04 11:13:55.224238');
INSERT INTO obrazky VALUES (446, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111355-04.jpeg', 28, '2011-04-04 11:13:55.24874');
INSERT INTO obrazky VALUES (447, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110404111355-05.jpeg', 28, '2011-04-04 11:13:55.273406');
INSERT INTO obrazky VALUES (448, '', '', 'keret', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110417082035-00.jpeg', 29, '2011-04-17 08:20:35.39173');
INSERT INTO obrazky VALUES (449, '', '', 'keret', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110417082035-01.jpeg', 29, '2011-04-17 08:20:35.61249');
INSERT INTO obrazky VALUES (450, '', '', 'keret', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110417082035-02.jpeg', 29, '2011-04-17 08:20:35.672281');
INSERT INTO obrazky VALUES (451, '', '', 'keret', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110417082035-03.jpeg', 29, '2011-04-17 08:20:35.725194');
INSERT INTO obrazky VALUES (452, '', '', 'keret', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110417082035-04.jpeg', 29, '2011-04-17 08:20:35.770936');
INSERT INTO obrazky VALUES (453, '', '', 'keret', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110417082035-05.jpeg', 29, '2011-04-17 08:20:35.884886');
INSERT INTO obrazky VALUES (454, '', '', 'keret', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110417082035-06.jpeg', 29, '2011-04-17 08:20:36.013448');
INSERT INTO obrazky VALUES (455, '', '', 'keret', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110417082036-07.jpeg', 29, '2011-04-17 08:20:36.136441');
INSERT INTO obrazky VALUES (456, '', '', 'keret', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110417082036-08.jpeg', 29, '2011-04-17 08:20:36.267034');
INSERT INTO obrazky VALUES (457, '', '', 'keret', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110417082036-09.jpeg', 29, '2011-04-17 08:20:36.391783');
INSERT INTO obrazky VALUES (458, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110420104700-00.jpeg', 29, '2011-04-20 10:47:00.512157');
INSERT INTO obrazky VALUES (459, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110507195825-00.jpeg', 29, '2011-05-07 19:58:25.154755');
INSERT INTO obrazky VALUES (460, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123113-00.jpeg', 30, '2011-08-17 12:31:13.223095');
INSERT INTO obrazky VALUES (461, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123113-01.jpeg', 30, '2011-08-17 12:31:13.263371');
INSERT INTO obrazky VALUES (462, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123113-02.jpeg', 30, '2011-08-17 12:31:13.275322');
INSERT INTO obrazky VALUES (463, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123113-03.jpeg', 30, '2011-08-17 12:31:13.288036');
INSERT INTO obrazky VALUES (464, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123113-04.jpeg', 30, '2011-08-17 12:31:13.300572');
INSERT INTO obrazky VALUES (465, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123113-05.jpeg', 30, '2011-08-17 12:31:13.312675');
INSERT INTO obrazky VALUES (466, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123113-06.jpeg', 30, '2011-08-17 12:31:13.32565');
INSERT INTO obrazky VALUES (467, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123113-07.jpeg', 30, '2011-08-17 12:31:13.338025');
INSERT INTO obrazky VALUES (468, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123113-08.jpeg', 30, '2011-08-17 12:31:13.349618');
INSERT INTO obrazky VALUES (469, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123113-09.jpeg', 30, '2011-08-17 12:31:13.361092');
INSERT INTO obrazky VALUES (470, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123246-00.jpeg', 30, '2011-08-17 12:32:46.646021');
INSERT INTO obrazky VALUES (471, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123246-01.jpeg', 30, '2011-08-17 12:32:46.65876');
INSERT INTO obrazky VALUES (472, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123246-02.jpeg', 30, '2011-08-17 12:32:46.690871');
INSERT INTO obrazky VALUES (473, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123246-03.jpeg', 30, '2011-08-17 12:32:46.710402');
INSERT INTO obrazky VALUES (474, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123246-04.jpeg', 30, '2011-08-17 12:32:46.720694');
INSERT INTO obrazky VALUES (475, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123246-05.jpeg', 30, '2011-08-17 12:32:46.732909');
INSERT INTO obrazky VALUES (476, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123246-06.jpeg', 30, '2011-08-17 12:32:46.744336');
INSERT INTO obrazky VALUES (477, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123246-07.jpeg', 30, '2011-08-17 12:32:46.755917');
INSERT INTO obrazky VALUES (478, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123246-08.jpeg', 30, '2011-08-17 12:32:46.767144');
INSERT INTO obrazky VALUES (479, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123246-09.jpeg', 30, '2011-08-17 12:32:46.778014');
INSERT INTO obrazky VALUES (480, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123412-00.jpeg', 30, '2011-08-17 12:34:12.022711');
INSERT INTO obrazky VALUES (481, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123412-01.jpeg', 30, '2011-08-17 12:34:12.037899');
INSERT INTO obrazky VALUES (482, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123412-02.jpeg', 30, '2011-08-17 12:34:12.051321');
INSERT INTO obrazky VALUES (483, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123412-03.jpeg', 30, '2011-08-17 12:34:12.062689');
INSERT INTO obrazky VALUES (484, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123412-04.jpeg', 30, '2011-08-17 12:34:12.080212');
INSERT INTO obrazky VALUES (485, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123412-05.jpeg', 30, '2011-08-17 12:34:12.090754');
INSERT INTO obrazky VALUES (486, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110817123412-06.jpeg', 30, '2011-08-17 12:34:12.098096');
INSERT INTO obrazky VALUES (487, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110822083741-00.jpeg', 5, '2011-08-22 08:37:41.463275');
INSERT INTO obrazky VALUES (488, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110822083913-00.jpeg', 6, '2011-08-22 08:39:13.56701');
INSERT INTO obrazky VALUES (489, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192630-00.jpeg', 31, '2011-09-05 19:26:30.275366');
INSERT INTO obrazky VALUES (490, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192630-01.jpeg', 31, '2011-09-05 19:26:30.331265');
INSERT INTO obrazky VALUES (491, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192630-02.jpeg', 31, '2011-09-05 19:26:30.365386');
INSERT INTO obrazky VALUES (492, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192630-03.jpeg', 31, '2011-09-05 19:26:30.37254');
INSERT INTO obrazky VALUES (493, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192630-04.jpeg', 31, '2011-09-05 19:26:30.408836');
INSERT INTO obrazky VALUES (494, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192630-05.jpeg', 31, '2011-09-05 19:26:30.424654');
INSERT INTO obrazky VALUES (495, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192630-06.jpeg', 31, '2011-09-05 19:26:30.444267');
INSERT INTO obrazky VALUES (496, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192630-07.jpeg', 31, '2011-09-05 19:26:30.483974');
INSERT INTO obrazky VALUES (497, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192630-08.jpeg', 31, '2011-09-05 19:26:30.49483');
INSERT INTO obrazky VALUES (498, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192630-09.jpeg', 31, '2011-09-05 19:26:30.511151');
INSERT INTO obrazky VALUES (499, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192752-00.jpeg', 31, '2011-09-05 19:27:52.751819');
INSERT INTO obrazky VALUES (500, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192752-01.jpeg', 31, '2011-09-05 19:27:52.763489');
INSERT INTO obrazky VALUES (501, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192752-02.jpeg', 31, '2011-09-05 19:27:52.794873');
INSERT INTO obrazky VALUES (502, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192752-03.jpeg', 31, '2011-09-05 19:27:52.806868');
INSERT INTO obrazky VALUES (503, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192752-04.jpeg', 31, '2011-09-05 19:27:52.818113');
INSERT INTO obrazky VALUES (504, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192752-05.jpeg', 31, '2011-09-05 19:27:52.829487');
INSERT INTO obrazky VALUES (505, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192752-06.jpeg', 31, '2011-09-05 19:27:52.849607');
INSERT INTO obrazky VALUES (506, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192752-07.jpeg', 31, '2011-09-05 19:27:52.861305');
INSERT INTO obrazky VALUES (507, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192752-08.jpeg', 31, '2011-09-05 19:27:52.872785');
INSERT INTO obrazky VALUES (508, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192752-09.jpeg', 31, '2011-09-05 19:27:52.885534');
INSERT INTO obrazky VALUES (509, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192949-00.jpeg', 31, '2011-09-05 19:29:49.151613');
INSERT INTO obrazky VALUES (510, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192949-01.jpeg', 31, '2011-09-05 19:29:49.16205');
INSERT INTO obrazky VALUES (511, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192949-02.jpeg', 31, '2011-09-05 19:29:49.175754');
INSERT INTO obrazky VALUES (512, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192949-03.jpeg', 31, '2011-09-05 19:29:49.18729');
INSERT INTO obrazky VALUES (513, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192949-04.jpeg', 31, '2011-09-05 19:29:49.199501');
INSERT INTO obrazky VALUES (514, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192949-05.jpeg', 31, '2011-09-05 19:29:49.211549');
INSERT INTO obrazky VALUES (515, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192949-06.jpeg', 31, '2011-09-05 19:29:49.228323');
INSERT INTO obrazky VALUES (516, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192949-07.jpeg', 31, '2011-09-05 19:29:49.239922');
INSERT INTO obrazky VALUES (517, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192949-08.jpeg', 31, '2011-09-05 19:29:49.252128');
INSERT INTO obrazky VALUES (518, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905192949-09.jpeg', 31, '2011-09-05 19:29:49.27667');
INSERT INTO obrazky VALUES (519, '', '', 'Pilly', 'puvodni_obrazky', 'tvorene_obrazky', 'image-20110905193046-00.jpeg', 31, '2011-09-05 19:30:47.158409');


--
-- Data for Name: tracker; Type: TABLE DATA; Schema: pilirion; Owner: test
--

INSERT INTO tracker VALUES (1, 'Duplicitní text v sekci \\"O nás\\"', 'V sekci \\"O nás\\" se zobrazuje 2x text: V červnu je datován ... na podzim téhož roku.', 1, 'sirkubador', '2007-09-03 17:01:54', 4, '2007-09-03 17:01:54', 'Opraveno, takhle vypadá vzorové hlášení chyby.');
INSERT INTO tracker VALUES (2, 'Alba', 'Když máš v albu víc fotek - musí se ti listovat na další stránky, tak se nezobrazuje nápis další (listování stránkymi)', 1, 'Pilly', '2007-09-03 20:33:22', 4, '2007-09-04 17:48:22', 'Uděláno.');
INSERT INTO tracker VALUES (3, 'Fórum', 'Nevím jak na jiných prohlížečích, ale na mozille se jaksi nevejde na šířku do okna a je nutné scrollovat doprava. Sice se svět nezboří, ale je to nepříjemné', 1, 'Alky', '2007-09-04 20:36:28', 1, '2007-09-05 17:51:25', 'Chyba, způsobují ji příliš dlouhá (např. odkazy) slova a konstelace hvězd. ');
INSERT INTO tracker VALUES (4, 'pravidla Erinor', 'nejdou stáhnout pravidla na Erinor - hlásí to že soubor neexistuje', 1, 'Pilly', '2007-09-04 22:16:21', 4, '2007-09-05 17:51:25', 'Opraveno. Přidána verze nových, přepracovaných a zčásti gramaticky opravených pravidel.');
INSERT INTO tracker VALUES (5, 'Status oprav', 'Při některém nastavení to hází ve statusu oprav nějaký blbě kódovaný text - jsou tam místo písmen znaky atd.', 1, 'Pilly', '2007-09-14 20:03:54', 4, '2007-09-14 20:03:54', 'Opraveno.');
INSERT INTO tracker VALUES (6, 'Odkaz na Erinor', 'Odkazuje na neaktuální stránky, které se teprve vyvíjí.', 1, 'Alky', '2007-09-15 13:03:07', 4, '2007-09-15 13:03:07', 'opraveno. Je možné si nyní vybrat ze dvou.');
INSERT INTO tracker VALUES (7, 'Přidávání článků', 'Bylo by možno nějak zpříjemnit vkládání článků? Aby bylo možno  text při přidávání různě upravovat a formátovat a ne jen jednoduše vložit.', 2, 'Alky', '2007-09-15 17:52:13', 3, '2007-09-15 17:52:13', 'Už teď to lze se znalostí HTML, možná přibude tato funkcionalita časem.');
INSERT INTO tracker VALUES (8, 'přidávání fotek', 'Bylo by možno zavést možnost přidávání fotek ve větším počtu?', 2, 'Alky', '2007-09-16 13:47:09', 3, '2007-09-16 13:47:09', 'To bohužel není jenom moje vina - webhoster objem přenesených dat bohužel limituje. Odkládám, možná vyřídím.');
INSERT INTO tracker VALUES (9, 'Chyba ve zdrojáku', 'Když se poprvé zobrazí stránky, tak se tam na chvíli zobrazí změť kódu ze zdrojáku s nějakejma odkazama, ale po chvíli to zmizí', 1, 'Pilly', '2007-09-20 23:05:59', 2, '2007-09-20 23:05:59', 'Chyba v klientském PC/prohlížeči.');
INSERT INTO tracker VALUES (10, 'pravidla erinoru ke stažení', 'Bylo by fajn kdyby byly ke stažení funkční aspoň v nějaké verzi... nezajímá mě jak, ale aby byly', 1, 'Terka', '2007-09-25 21:38:40', 4, '2007-09-25 21:38:40', 'Bylo. Už tam jsou. Pokud se změní, prosím, nejdříve mě informujte, že se tak stalo. Nemám věšteckou kouli, díky.');
INSERT INTO tracker VALUES (11, 'Seznam chyb', 'zobrazuje se mi jako změť písmen, záměny znaků...', 1, 'Terka', '2007-09-26 22:11:26', 4, '2007-09-26 22:11:26', 'Duplicitní k 9. Opraveno.');
INSERT INTO tracker VALUES (12, 'Dotaz', 'Proč když dám odeslat článek na nástěnku tak mi to nahlásí chybu - pokus o experimentální přístup - a stejně to na nástěnku zapíše? Co to zanmená', 1, 'Terka', '2007-10-09 20:45:10', 4, '2007-10-09 20:45:10', 'Opraveno. Nový systém obsahoval jeden chybný řádek v kódu, chyba se zobrazí při pokusu o nabourání systému.');
INSERT INTO tracker VALUES (13, 'fotky', 'šlo by zařídit aby se při prohlížení fotek nemuselo vracet z5 na galerii?', 3, 'Světlo', '2007-10-16 11:31:22', 4, '2007-10-16 11:31:22', 'Je dokonáno.');
INSERT INTO tracker VALUES (14, 'Seznam akcí', 'Vzhledem k tomu, že nikdo z nás není nějak extra hrr do psaní recenzí, tak by bylo fajn přidat prostý seznam akcí, na kterých jsme byli. Jen  jméno akce, místo,  datum a účastníky', 3, 'Alky', '2008-08-12 22:00:06', 0, '2008-08-12 22:00:06', 'Nevyřízeno');
INSERT INTO tracker VALUES (15, 'Upozorňování na příspěvky', 'Nešlo by zařídit, aby se při přidání příspěvku do soukromých odeslal členům upozorňovací email? Dala by se tím dost zrychlit komunikace', 3, 'Alky', '2008-10-18 10:02:03', 0, '2008-10-18 10:02:03', 'Nevyřízeno');
INSERT INTO tracker VALUES (16, 'Nezobrazování', 'Nezobrazuje se mi ta malá kniha vpravo na stránce.Prohlíženo v IE6. Můžu kouknout jak mi to bere mozila mam obojí a ozvat se.', 1, 'Pilly', '2009-04-15 21:48:42', 0, '2009-04-15 21:48:42', 'Nevyřízeno');


SET search_path = erinor, pg_catalog;

--
-- Name: kz_postavy_jmeno_key; Type: CONSTRAINT; Schema: erinor; Owner: test; Tablespace: 
--

ALTER TABLE ONLY kz_postavy
    ADD CONSTRAINT kz_postavy_jmeno_key UNIQUE (jmeno);


--
-- Name: kz_postavy_pkey; Type: CONSTRAINT; Schema: erinor; Owner: test; Tablespace: 
--

ALTER TABLE ONLY kz_postavy
    ADD CONSTRAINT kz_postavy_pkey PRIMARY KEY (id);


--
-- Name: kz_postavy_skritci_jmeno_key; Type: CONSTRAINT; Schema: erinor; Owner: test; Tablespace: 
--

ALTER TABLE ONLY kz_postavy_skritci
    ADD CONSTRAINT kz_postavy_skritci_jmeno_key UNIQUE (jmeno);


--
-- Name: kz_postavy_skritci_pkey; Type: CONSTRAINT; Schema: erinor; Owner: test; Tablespace: 
--

ALTER TABLE ONLY kz_postavy_skritci
    ADD CONSTRAINT kz_postavy_skritci_pkey PRIMARY KEY (id);


--
-- Name: kz_prihlasky_generic_pkey; Type: CONSTRAINT; Schema: erinor; Owner: test; Tablespace: 
--

ALTER TABLE ONLY kz_prihlasky_generic
    ADD CONSTRAINT kz_prihlasky_generic_pkey PRIMARY KEY (id);


--
-- Name: kz_prihlasky_pkey; Type: CONSTRAINT; Schema: erinor; Owner: test; Tablespace: 
--

ALTER TABLE ONLY kz_prihlasky
    ADD CONSTRAINT kz_prihlasky_pkey PRIMARY KEY (id);


--
-- Name: kz_zajmoveskupiny_pkey; Type: CONSTRAINT; Schema: erinor; Owner: test; Tablespace: 
--

ALTER TABLE ONLY kz_zajmoveskupiny
    ADD CONSTRAINT kz_zajmoveskupiny_pkey PRIMARY KEY (id);


SET search_path = pilirion, pg_catalog;

--
-- Name: alba_pkey; Type: CONSTRAINT; Schema: pilirion; Owner: test; Tablespace: 
--

ALTER TABLE ONLY alba
    ADD CONSTRAINT alba_pkey PRIMARY KEY (id);


--
-- Name: clanky_pkey; Type: CONSTRAINT; Schema: pilirion; Owner: test; Tablespace: 
--

ALTER TABLE ONLY clanky
    ADD CONSTRAINT clanky_pkey PRIMARY KEY (id);


--
-- Name: obrazky_pkey; Type: CONSTRAINT; Schema: pilirion; Owner: test; Tablespace: 
--

ALTER TABLE ONLY obrazky
    ADD CONSTRAINT obrazky_pkey PRIMARY KEY (id);


--
-- Name: tracker_pkey; Type: CONSTRAINT; Schema: pilirion; Owner: test; Tablespace: 
--

ALTER TABLE ONLY tracker
    ADD CONSTRAINT tracker_pkey PRIMARY KEY (id);
