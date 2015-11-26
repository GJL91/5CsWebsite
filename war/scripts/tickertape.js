var tickerPlaying = 0;
var showing = 0;
var totalStories;

var timeout;

$(function() {
	totalStories = $('.newsStory a').length;
	showing = totalStories - 1;
	
	setTimeout(play(), 12000);
	
	$('#playpause').click(function () {
		if (!tickerPlaying) {
			play();
		} else {
			stop();
		}
		$(this).blur();
	});
	
	$('.next').click(function () {
		stop();
		nextImage();
		$(this).blur();
	});
	
	$('.previous').click(function () {
		stop();
		previousImage();
		$(this).blur();
	});
	
	$('.story').mouseover(function () {
		stop();
	});
});

function nextImage() {
	var id = '#news' + showing;
	$(id).addClass('hidden');
	showing = (showing + 1) % totalStories;
	id = '#news' + showing;
	$(id).removeClass('hidden');
	if (tickerPlaying) {
		timeout = setTimeout('nextImage()', 12000);
	}
};

function previousImage() {
	var id = '#news' + showing;
	$(id).addClass('hidden');
	if (showing == 0) showing = totalStories - 1;
	else showing--;
	id = '#news' + showing;
	$(id).removeClass('hidden');
};

function play() {
	tickerPlaying = 1;
	$('.play').addClass('pause');
	$('.play').removeClass('play');
	nextImage();
}

function stop() {
	clearTimeout(timeout);
	tickerPlaying = 0;
	$('.pause').addClass('play');
	$('.pause').removeClass('pause');
}