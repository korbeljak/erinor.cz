function oknoFotky(a){
   okno = window.open("", "fotka", "width=660, height=680");
   //okno.document.write("<html><body><img src=\""+a+"\" onclick=\"window.close()\"></body></html>");
   //okno.onclick(okno.close());
}
/*fotky = document.getElementById("fotky").getElementsByClassName("a");
document.write(fotky.length);
for(i = 0; i < fotky.length; i++) {
document.write(fotky[i].value);
}*/

 $(document).ready(function() {
   $("div.fotky a:active").click(function() {
         oknoFotky($("div.fotky a:active").attr("href"));
         $("div.fotky a:active").attr("target", "fotka");
   });
 });
