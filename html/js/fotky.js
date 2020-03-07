lastOne = null;

jQuery.fn.center = function () {
    this.css("position","absolute");
    var oh = $(this).outerHeight();
    var ow = $(this).outerWidth();
    var top = Math.max(0, (($(window).height() - oh) / 2) + 
            $(window).scrollTop());
    var left = Math.max(0, (($(window).width() - ow) / 2) + 
            $(window).scrollLeft());
    
    this.css("top", top + "px");
    this.css("left", left + "px");
    return this;
}

function oknoFotky(element)
{
	var a = element;
	if (a.nodeName != "A")
	{
		a = element.parentElement;
	}
	
	console.log("Looking for "+a.href);
	
	if (lastOne != null)
	{
		lastOne.remove();
	}
	
	lastOne = $('<img src="'+a.href+'">');
	lastOne.on('load', function() { lastOne.center(); })
	
	lastOne.click(function(event)
    {
        event.target.remove();
    });
	
	$("div#telo").append(lastOne);
}


$(document).ready(function() {
    $("a.thumb").click(function(event)
    {
    	event.preventDefault();
        oknoFotky(event.target);
    });
});
