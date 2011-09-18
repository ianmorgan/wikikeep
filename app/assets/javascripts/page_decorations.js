$(document).ready(function() {
    $(".initial_focus").focus();
    $("input").bind("keydown",
    function(event) {
        // track enter key
        var keycode = (event.keyCode ? event.keyCode: (event.which ? event.which: event.charCode));
        if (keycode == 13) {
            // keycode for enter key
            // force the 'Enter Key' to implicitly click the Update button
            $(".default_button").click();
            return false;
        } else {
            return true;
        }
    });

    $(".content_item_summary").mouseenter(function() {
	  $(this).addClass ("highlight_content");
	  //$('.highlight').gradient({
	  //    from: 'FFCC99',
	  //     to: 'FFEEDD',
	  //    direction: 'horizontal'
	  //  });
	});
	$(".content_item_summary").mouseleave(function() {
		
	//	 $('.highlight').gradient({
	//	      from: 'FFEEDD',
	//	       to: 'FFEEDD',
	//	      direction: 'horizontal'
	//	    });
		$(this).removeClass ("highlight_content");
	});
	
});

