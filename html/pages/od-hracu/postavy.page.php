<?php /*
title = "Stránky LARPu Erinor (pořádané skupinou Pilirion) &ndash; od hráčů: Postavy";
keywords = "larp, erinor, fantasy, dřevárny, roleplay, svět, hráči, postavy";
description = "Stránky LARPu Erinor, sekce od hráčů, Postavy";

Sem lze napsat libovolný komentář, nebude zobrazen. Zobrazí se pouze text pod čarou.
----------
*/ ?>

<?php
if(!isset($_GET['ss'])){?>
<h1>Postavy</h1>
<p>V této sekci se nachází popis postav ze světa Erinoru.</p>
 <?php
   seznam_pisemnosti("postavy");
}
else{
   echo vypis_pisemnost("pisemnosti/postavy/".najdi_pisemnost($_GET['ss'], "postavy"));
}
?>