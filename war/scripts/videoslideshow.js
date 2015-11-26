var current = 0;
var scrollPosition = 0;
var totalVideos;
var maxTop;
var scrollable = false;

$(function() {
	totalVideos = $('#linksHolder button').length;
	maxTop = ((totalVideos * 80) - 445) * -1;
	if (totalVideos < 5) {
		$('.video-links .link-down').hide();
	}
	
	// If the links are next to the videos, enable scrolling
	if ($('#slides').width() !== $('.gallery-container-videos').width()) {
		scrollable = true;
	}
	
	$(window).resize(function () {
		if ($('#slides').width() !== $('.gallery-container-videos').width()) {
			if (!scrollable) {
				showButtons();
			}
			
			scrollable = true;
		} else {
			if (scrollable) {
				$('.link-up, .link-down').css('display', '');
			}
			
			scrollable = false;
		}
	});
});

function showButtons() {
	if (scrollPosition === 0) {
		$('.video-links .link-up').hide();
		$('.video-links .link-down').show();
	} else {
		if (scrollPosition === maxTop) {
			$('.video-links .link-up').show();
			$('.video-links .link-down').hide();
		} else {
			$('.video-links .link-up').show();
			$('.video-links .link-down').show();
		}
	}
}

function changeTo(position) {
	if (current != position) {
		var leftPos = "-" + (position * 100) + "%";

		$('#slideHolder').css('left', leftPos);
		$('#link' + current).removeClass("active");
		$('#link' + position).addClass("active");

		current = position;
		if (scrollable) {
			scroll(position);
		}
	}
	
	$('#link' + current).blur();
};

function scroll(position) {
	if (position < 2) {
		scrollPosition = 0;
		$('#linksHolder').animate({
			top: scrollPosition
		});
		$('.video-links .link-up').hide();
		$('.video-links .link-down').show();
	} else {
		if (position > totalVideos - 3) {
			scrollPosition = maxTop;
			$('#linksHolder').animate({
				top: scrollPosition
			});
			$('.video-links .link-up').show();
			$('.video-links .link-down').hide();
		} else {
			var t = $('#linksHolder').position().top;
			if (80 * (position + 1) + t > 390) {
				scrollPosition = 400 - (80 * (position + 2));
				$('#linksHolder').animate({
					top: scrollPosition
				});
				$('.video-links .link-up').show();
			} else {
				if (80 * (position + 1) + t < 130) {
					scrollPosition = t + 80;
					$('#linksHolder').animate({
						top: scrollPosition
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
		scrollPosition = 0;
		$('#linksHolder').animate({
			top: scrollPosition
		});
		$('.video-links .link-up').hide();
		$('.video-links .link-down').show();
	} else {
		scrollPosition = t + 160;
		$('#linksHolder').animate({
			top: scrollPosition
		});
		$('.video-links .link-down').show();
	}
}

function scrollDown() {
	var t = $('#linksHolder').position().top;
	if (t - 160 <= maxTop) {
		scrollPosition = maxTop;
		$('#linksHolder').animate({
			top: scrollPosition
		});
		$('.video-links .link-up').show();
		$('.video-links .link-down').hide();
	} else {
		scrollPosition = t - 160;
		$('#linksHolder').animate({
			top: scrollPosition
		});
		$('.video-links .link-up').show();
	}
}