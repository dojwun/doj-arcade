var gaming = false;
$(function(){
    function display(bool) {
        if (bool) {
            $("#body").show();		
        } else { 
            $("#body").hide();
        }
    }
    display(false);

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "on")
        {
            $("#loading").show();
            alreadydid = true;
            display(true);
            gaming = true;
            if(item.gpu === "ETX660")
            {
                $("#cont").css('max-height',300);
                $("#cont").css('max-width',500);
            }
            if(item.gpu === "ETX1050")
            {
                $("#cont").css('max-height',700);
                $("#cont").css('max-width',1100);
            }
            if(item.gpu === "ETX2080")
            {
                $("#cont").css('max-height',800);
                $("#cont").css('max-width',1600);
            }

            if(item.cpu === "U9_9900")  { loadGame(3*10);  }
            if(item.cpu === "U7_8700")  { loadGame(10*10); }
            if(item.cpu === "U3_6300")  { loadGame(15*10); }
            if(item.cpu === "BENTIUM")  { loadGame(20*10); }
        }
        if (item.type === "off") {
            display(false);
            loadIframe(true, "");
            gaming = false;
            $("#loading").hide();
            alreadydid = false;
            time_seconds = 0;
            kokotina = 0;
        }

        loadIframe(false, item.game);
    })
});  	

var url_game = "";
var alreadydid = false;
var time_seconds = 0,kokotina = 0;
function loadGame(seconds)
{
	time_seconds = seconds;
	$('#loading').attr('value', 0);
	$('#loading').attr('max', seconds / 10);
}

function progress()
{
	if(time_seconds == 0)
	{
		if(alreadydid == true){
			loadIframe(true, url_game);
			alreadydid = false;
			$("#loading").hide();
		}
		kokotina = 0;
	}
	else
	{	
		kokotina += 0.1;
		time_seconds --;
		$('#loading').attr('value', kokotina);
	}

	setTimeout(progress, 100);
}
setTimeout(progress, 100);

$(document).keyup(function(e) {
    if (e.keyCode === 27){
        $.post(`http://${GetParentResourceName()}/exit`, JSON.stringify({}));
    }
});


$( "#off_pc" ).click(function() {
    $.post(`http://${GetParentResourceName()}/exit`, JSON.stringify({}));
});
function loadIframe(give,url) {
	url_game = url;
	if(give == false) return false;
    var $iframe = $('#browser');
    if ( $iframe.length ) {
        $iframe.attr('src',url);   
        return false;
    }
    return true;
}
