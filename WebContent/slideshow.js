$(function () {
	$("#slides").slidesjs({
		width: 940,
      	height: 658,
      	navigation: {
    	  	active: false,
    	  	effect: "fade"
      	},
      	pagination: false,
      	play: {
    	  	active: true,
    	  	auto: true,
    	  	swap: true
      	}
    });
    
    $('#previousBtn').mousedown(function () {
    	$('#previousBtn').addClass('mousedown');
    });
    
    $('#previousBtn').mouseup(function () {
    	$('#previousBtn').removeClass('mousedown');
    });
    
    $('#nextBtn').mousedown(function () {
    	$('#nextBtn').addClass('mousedown');
    });
    
    $('#nextBtn').mouseup(function () {
    	$('#nextBtn').removeClass('mousedown');
    });
});