"use strict";

var result;

$(function() {
//	window.history.replaceState({}, '', '/5Cs/contact-us/form');
	
	var a = Math.floor((Math.random() * 10) + 1),
		b = Math.floor((Math.random() * 10) + 1);
	
	BetterInnerHTML(document.getElementById("captcha"), "What is " + a + " + " + b + "?");
	
	result = a + b; 
	
	$('#captchaAnswer').keypress(function (e) {
		if (e.which == 13) {
			send();
		}
	});
});

function send() {
	if (isEmpty('name') || isEmpty('email') || isEmpty('subject') || isEmpty('message')) {
		$('.captchaValidation').addClass("hidden");
		$('.validation').removeClass("hidden");
		return;
	}
	
	$('.validation').addClass("hidden");
	if (result == $('#captchaAnswer').val()) {
		$('.captchaValidation').addClass("hidden");
		$('#form').submit();
	} else {
		$('.captchaValidation').removeClass("hidden");
	}
	
};

var isEmpty = function(field) {
	return $('#' + field).val().length === 0;
};
