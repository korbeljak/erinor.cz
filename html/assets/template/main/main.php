<?php
$rootPath = (!empty($_SERVER['HTTPS']) ? 'https' : 'http') . '://' . $_SERVER['SERVER_NAME'] . $_SERVER['SCRIPT_NAME'];
$GLOBALS['path'] = substr($rootPath, 0, strrpos($rootPath, "/"))."/";

require_once "kalendar/lithensky_kalendar.php";
require_once "lib/pisemnosti.function.php";
require_once "lib/texy.min.php";
?>
<!DOCTYPE html>
<html>
<head>
<title><?=$this->title;?></title>
<meta name="author" content="sirkubador">
<meta name="keywords" content="<?=$this->keywords;?>">
<meta name="description" content="<?=$this->description;?>">
<meta name="robots" content="index, follow">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" href="<?=$GLOBALS['path'];?>css/css.css" type="text/css" media="screen">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<?=$GLOBALS['path'];?>js/fotky.js"></script>
<base href="<?=$GLOBALS['path'];?>">
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
<?php include($this->menu); ?>
<div id="erinorske_datum">Dnešní Erinorské datum: <?=lithen_date(new \DateTime())?></div>
</div>
<div id="obsah">
<?php @include($this->page); ?>
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

