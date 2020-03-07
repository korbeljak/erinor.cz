<?php

$rootPath = (!empty($_SERVER['HTTPS']) ? 'https' : 'http') . '://' . $_SERVER['SERVER_NAME'] . $_SERVER['SCRIPT_NAME'];
$GLOBALS['path'] = substr($rootPath, 0, strrpos($rootPath, "/"))."/";

require_once "kalendar/lithensky_kalendar.php";
require_once "lib/pisemnosti.function.php";
require_once "lib/texy.min.php";

class ParsePage
{
   public $separator = "----------";
   protected $source = "";

   public $meta = "";
   public $page = "";

   public $title = ""; // Default values.
   public $description = ""; // Default values.
   public $keywords = ""; // Default values.

   protected $chyby;

   public function __construct($source)
   {
      if (is_file($source))
      {
         $this->source = file_get_contents($source);
      }
      else
      {
         $this->chyby[] = "Zdrojový soubor nemohl být načten";
      }
   }
   public function splitPage()
   {
      if (preg_match("/".preg_quote($this->separator)."/", $this->source))
      {
         $page_part = explode($this->separator, $this->source);
         $this->meta = $page_part[0];
         $this->page = $page_part[1];
      }
      else
      {
         $this->varovani[] = "Soubor nemá uvedené žádné metainformace";
         $this->meta = "";
         $this->page = $this->source;
      }
   }
   public function extractMeta()
   {
      if ($this->meta != "")
      {
         if(preg_match("/title[ ]*=[ ]*\"([^\"]*)\";/im", $this->meta, $t)) $this->title = $t[1];
         if(preg_match("/description[ ]*=[ ]*\"([^\"]*)\";/im", $this->meta, $d)) $this->description = $d[1];
         if(preg_match("/keywords[ ]*=[ ]*\"([^\"]*)\";/im", $this->meta, $k)) $this->keywords = $k[1];
      }
      else $this->varovani[] = "Soubor nemá uvedené žádné metainformace - není co extrahovat";
   }
}

if (isset($_GET['ca'])
   && !isset($_GET['sc'])
   && !empty($_GET['ca'])
   && is_file('pages/'.$_GET['ca'].'.page.php'))
{
   $source = 'pages/'.$_GET['ca'].'.page.php';
}
elseif (isset($_GET['ca'])
        && isset($_GET['sc'])
        && !empty($_GET['ca'])
        && !empty($_GET['sc'])
        && is_file('pages/'.$_GET['ca'].'/'.$_GET['sc'].'.page.php'))
{
   $source = 'pages/'.$_GET['ca'].'/'.$_GET['sc'].'.page.php';
}
else
{
   $source = 'pages/uvod.page.php';
}

/*MENU*/

if (isset($_GET['ca'])
    && !empty($_GET['ca'])
    && is_file('menus/'.$_GET['ca'].'.menu.php'))
{
   $menu = 'menus/'.$_GET['ca'].'.menu.php';
}
else
{
   $menu = 'menus/uvod.menu.php';
}

/*ASSIGN*/

$pg = new ParsePage($source);
$pg->title = "Stránky LARPu Erinor (pořádané skupinou Pilirion)";
$pg->keywords = "larp, erinor, fantasy, dřevárny, roleplay";
$pg->description = "Stránky LARPu Erinor";
$pg->splitPage();
$pg->extractMeta();
$title = $pg->title;
$keywords = $pg->keywords;
$description = $pg->description;
$contents = $pg->page;
$tmpfname = tempnam(sys_get_temp_dir(), "t");
$l = fopen($tmpfname, "w");
fwrite($l, $contents);
fclose($l);
?>
<?php /*TEMPLATE*/ ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title><?=$title;?></title>
<meta name="author" content="sirkubador">
<meta name="keywords" content="<?=$keywords;?>">
<meta name="description" content="<?=$description;?>">
<meta name="robots" content="index, follow">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" href="<?=$GLOBALS['path'];?>css/css.css" type="text/css" media="screen">
<base href="<?=$GLOBALS['path'];?>">
<script type="text/javascript" src="<?=$GLOBALS['path'];?>js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<?=$GLOBALS['path'];?>js/fotky.js"></script>
<!--[if lte IE 6]>
<link rel="shortcut icon" href="favicon.ico">
<![endif]-->
<link href="favicon.ico" rel="icon">
</head>
<body>
<div id="telo">
<img src="img/had.png" id="pos-had" alt="Pilirionský hádek">
<img src="img/h-strom.png" id="h-strom" class="strom" alt="vršek erinorského stromu">
<img src="img/s-strom.png" id="s-strom" class="strom" alt="střed erinorského stromu">
<img src="img/d-strom.png" id="d-strom" class="strom" alt="kořeny erinorského stromu">
<div id ="hlavicka">
   <a id="head" href="index.php">
   <img src="img/h-erinor.png" id="erinor">
   </a>
</div>
<ul class="menu">
   <li><a href="<?=$GLOBALS['path'];?>">Úvod</a></li>
   <li><a href="poradane/">Pořádané</a></li>
   <li><a href="pravidla/">Pravidla</a></li>
   <li><a href="svet/">Svět</a></li>
   <li><a href="knihovna/">Knihovna</a></li>
   <li><a href="od-hracu/">Od hráčů</a></li>
   <li><a href="dotazy/">Dotazy</a></li>
   <li><a href="kontakty/">Kontakty</a></li>
</ul>
<div id="podmenu">
<?php include($menu); ?>
<div id="erinorske_datum">Dnešní Erinorské datum: <?=lithen_date(new \DateTime())?></div>
</div>
<div id="obsah">
<?php @include($tmpfname); ?>
</div>
<div id="patka">
Copyright note:<br>
design &amp; code: <a href="mailto:sirkubadorZAVINACseznamTECKAcz">sirkubador</a>,
content: <a href="http://pilirion.cz">Pilirion</a> &amp; members<br>
All rights reserved.<br>
last modified: <?php echo date("j. n. Y H:i:s",filemtime("changelog.txt")); ?>
</div>
</div>
</body>

</html>
<?php @unlink($tmpfname); ?>

