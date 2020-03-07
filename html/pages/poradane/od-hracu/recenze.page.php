<?php /*
title = "Stránky LARPu Erinor (pořádané skupinou Pilirion) &ndash; od hráčů: Recenze";
keywords = "larp, erinor, fantasy, dřevárny, roleplay, svět, hráči, recenze";
description = "Stránky LARPu Erinor, sekce od hráčů, Recenze";

Sem lze napsat libovolný komentář, nebude zobrazen. Zobrazí se pouze text pod čarou.
----------
*/ ?>

<?php
if(!isset($_GET['ss'])){?>
<h1>Recenze</h1>
<p>V této sekci se nachází recenze dílů Erinoru.</p>
 <?php
   seznam_pisemnosti("recenze");
}
else{
   echo vypis_pisemnost("pisemnosti/recenze/".najdi_pisemnost($_GET['ss'], "recenze"));
}
?>