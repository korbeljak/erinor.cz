title = "Stránky LARPu Erinor (pořádané skupinou Pilirion) &ndash; od hráčů: Dokumenty";
keywords = "larp, erinor, fantasy, dřevárny, roleplay, svět, hráči, dokumenty";
description = "Stránky LARPu Erinor, sekce od hráčů, Dokumenty";

Sem lze napsat libovolný komentář, nebude zobrazen. Zobrazí se pouze text pod čarou.
----------

<?php
if(!isset($_GET['ss'])){?>
<h1>Dokumenty</h1>
<p>V této sekci se nachází hráčské dokumenty ze světa Erinoru.</p>
 <?php
   seznam_pisemnosti("dokumenty");
}
else{
   echo vypis_pisemnost("pisemnosti/dokumenty/".najdi_pisemnost($_GET['ss'], "dokumenty"));
}
?>