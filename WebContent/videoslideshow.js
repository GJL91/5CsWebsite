var current = 0;
var scrollPosition = 0;
var totalVideos;
var maxTop;


$(function() {
	totalVideos = $('#linksHolder button').length;
	maxTop = ((totalVideos * 80) - 445) * -1;
	if (totalVideos < 5) {
		$('.video-links .link-down').hide();
	}
});

function changeTo(position) {
	if (current != position) {
		var leftPos = "-" + (position * 100) + "%";
		$('#slideHolder').animate({
			left: leftPos
		});
		
		$('#link' + current).removeClass("active");
		$('#link' + position).addClass("active");

		current = position;
		
		scroll(position);
	}
	
	$('#link' + current).blur();
};

function scroll(position) {
	if (position < 2) {
		$('#linksHolder').animate({
			top: 0
		});
		$('.video-links .link-up').hide();
		$('.video-links .link-down').show();
	} else {
		if (position > totalVideos - 3) {
			$('#linksHolder').animate({
				top: maxTop
			});
			$('.video-links .link-up').show();
			$('.video-links .link-down').hide();
		} else {
			var t = $('#linksHolder').position().top;
			if (80 * (position + 1) + t > 390) {
				$('#linksHolder').animate({
					top: 400 - (80 * (position + 2))
				});
				$('.video-links .link-up').show();
			} else {
				if (80 * (position + 1) + t < 130) {
					$('#linksHolder').animate({
						top: t + 80
					});
					$('.video-links .link-down').show();
				}
			}
		}
	}
}

function scrollUp() {
	var t = $('#linksHolder').position().top;
	if (t + 160 >= 0) {
		$('#linksHolder').animate({
			top: 0
		});
		$('.video-links .link-up').hide();
		$('.video-links .link-down').show();
	} else {
		$('#linksHolder').animate({
			top: t + 160
		});
		$('.video-links .link-down').show();
	}
}

function scrollDown() {
	var t = $('#linksHolder').position().top;
	if (t - 160 <= maxTop) {
		$('#linksHolder').animate({
			top: maxTop
		});
		$('.video-links .link-up').show();
		$('.video-links .link-down').hide();
	} else {
		$('#linksHolder').animate({
			top: t - 160
		});
		$('.video-links .link-up').show();
	}
}