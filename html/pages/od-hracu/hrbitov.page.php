<?php /*
title = "Stránky LARPu Erinor (pořádané skupinou Pilirion) &ndash; od hráčů: Hřbitov";
keywords = "larp, erinor, fantasy, dřevárny, roleplay, svět, hráči, hřbitov";
description = "Stránky LARPu Erinor, sekce od hráčů, Hřbitov";

Sem lze napsat libovolný komentář, nebude zobrazen. Zobrazí se pouze text pod čarou.
----------
*/ ?>
<?php
$name = "hrbitov";
if ($this->ss === null)
{
?>
<h1>Hřbitov postav</h1>
<p>V této sekci se nachází epilogy zemřelých postav Erinoru.</p>
<?php 
    seznam_pisemnosti($name);
}
else
{
    echo vypis_pisemnost("pisemnosti/$name/".najdi_pisemnost($this->ss, $name));
}
?>