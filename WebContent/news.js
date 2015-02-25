"use strict";

var feedUL;
var msgBox;

var expanded = false;
var contentBoxes;

window.onload = start;

function start() {
	$('textarea').autosize();

	msgBox = document.getElementById("postTable");
	$('.row').each(function(i, obj) {
		$(this).hide();
	});
}

function expandMsg() {
	if (!expanded) {
		if (msgBox == null) msgBox = document.getElementById("postTable");
		$('.row').each(function(i, obj) {
			$(this).show();
		});
		
		expanded = true;
		document.getElementById("commentText").focus();
		$('textarea').autosize();
	}
}