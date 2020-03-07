<?php /*
title = "Stránky LARPu Erinor (pořádané skupinou Pilirion) &ndash; od hráčů: Ostatní";
keywords = "larp, erinor, fantasy, dřevárny, roleplay, svět, hráči, ostatní";
description = "Stránky LARPu Erinor, sekce od hráčů, Ostatní";

Sem lze napsat libovolný komentář, nebude zobrazen. Zobrazí se pouze text pod čarou.
----------
*/ ?>

<?php
if(!isset($_GET['ss'])){?>
<h1>Ostatní</h1>
<p>V této sekci se nachází ostatní dokumenty ze světa Erinoru.</p>
 <?php
   seznam_pisemnosti("ostatni");
}
else{
   echo vypis_pisemnost("pisemnosti/ostatni/".najdi_pisemnost($_GET['ss'], "ostatni"));
}
?>