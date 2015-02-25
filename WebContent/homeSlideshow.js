"use strict";

var totalImgs = 6;
var imgs = [];

var fadeImg = 0;
var currentImg = 0;

var playing = 0;
var stopped = true;
var fOpaque;

window.onload = start;

function start() {
	totalImgs = $('.imgHolder div').length;
	
	for (var i = 0; i < totalImgs; i++) {
		imgs[i] = document.getElementById("Img" + (i + 1));
		imgs[i].style.backgroundImage = "URL(/5Cs/Images/Slideshow_Home/image_" + (i + 1) + ".jpg)";
		imgs[i].style.zIndex = 3 + (totalImgs - i);
	}
	
	playing = window.setInterval(function () {next()}, 5000);
}

//Display the next image, loop if currentImg == 7
function next() {
	fadeImg = currentImg;
	if (currentImg == (totalImgs - 1)) currentImg = 0;
	else currentImg++;

	if (fadeImg == (currentImg - 1)) fadeTransitionOut();
	else fadeTransitionIn();
	
	return false;
}

function fadeTransitionOut() {
	fOpaque = 1;
	stopped = false;

	imgs[fadeImg + 1].style.opacity = 1;
	imgs[fadeImg + 1].style.filter = "alpha(opacity=100)";
	
	function fadeFrameOut() {
		if (!stopped) {
			if (fOpaque > 0) fOpaque = fOpaque - 0.003;
			
			imgs[fadeImg].style.opacity = fOpaque;
			imgs[fadeImg].style.filter = "alpha(opacity=" + (fOpaque * 100) + ")";

			if (fOpaque < 0 && !stopped) {
				stopped = true;
				fOpaque = 1;
			} else {
				window.setTimeout(fadeFrameOut, 1);
			}
		}
	}
	
	if (!stopped) window.setTimeout(fadeFrameOut, 1);
}

function fadeTransitionIn() {
	fOpaque = -0.03;
	stopped = false;

	function fadeFrameIn() {
		if (!stopped) {
			if (fOpaque < 1) fOpaque = fOpaque + 0.003;
			
			imgs[0].style.opacity = fOpaque;
			imgs[0].style.filter = "alpha(opacity=" + (fOpaque * 100) + ")";

			if (fOpaque > 1 && !stopped) {
				stopped = true;
				
				for (var i = 1; i < totalImgs; i++) {
					imgs[i].style.opacity = 1;
					imgs[i].style.filter = "alpha(opacity=100)";
				}

				fOpaque = -0.03;
			} else {
				window.setTimeout(fadeFrameIn, 1);
			}
		}
	}
	
	if (!stopped) window.setTimeout(fadeFrameIn, 1);
}