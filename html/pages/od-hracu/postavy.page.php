<?php /*
title = "Stránky LARPu Erinor (pořádané skupinou Pilirion) &ndash; od hráčů: Postavy";
keywords = "larp, erinor, fantasy, dřevárny, roleplay, svět, hráči, postavy";
description = "Stránky LARPu Erinor, sekce od hráčů, Postavy";

Sem lze napsat libovolný komentář, nebude zobrazen. Zobrazí se pouze text pod čarou.
----------
*/ ?>
<h1>Postavy</h1>
<p>V této sekci se nachází popis postav ze světa Erinoru.</p>
<?php
$name = "postavy";
if (!isset($this->ss))
{
    seznam_pisemnosti($name);
}
else
{
    echo vypis_pisemnost("pisemnosti/$name/".najdi_pisemnost($this->ss, $name));
}
?>