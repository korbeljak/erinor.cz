<?php /*
title = "Stránky LARPu Erinor (pořádané skupinou Pilirion) &ndash; od hráčů: Ostatní";
keywords = "larp, erinor, fantasy, dřevárny, roleplay, svět, hráči, ostatní";
description = "Stránky LARPu Erinor, sekce od hráčů, Ostatní";

Sem lze napsat libovolný komentář, nebude zobrazen. Zobrazí se pouze text pod čarou.
----------
*/ ?>
<h1>Ostatní</h1>
<p>V této sekci se nachází ostatní dokumenty ze světa Erinoru.</p>
<?php
$name = "ostatni";
if (!empty($this->ss))
{
    seznam_pisemnosti($name);
}
else
{
    echo vypis_pisemnost("pisemnosti/$name/".najdi_pisemnost($this->ss, $name));
}
?>