"use strict";
var touchscreen = false;
var largeScreen = false;
var dropdown = false;
var submenu = false;
var subsubmenu = false;

var itemClicked = false;
var showingMenu = false;

function setCookie() {
	var date = new Date();
	date.setTime(date.getTime() + (180 * 86400000)); // Expire in 180 days
	document.cookie = "cookieDialog=1; expires=" + date.toUTCString();
}

// Searches for a cookie called cookieDialog. Returns true if the cookie exists, false otherwise.
function checkCookie() {
	var name = "cookieDialog=";
	var ca = document.cookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var cookie = ca[i].trim();
		if (cookie.indexOf(name) == 0) return true;
	}
	
	return false;
}

$(function() {
	// Hide the no javascript warning.
	$('.javascript').hide();
	
	// Check if cookies are enabled and haven't yet been set. Display the cookie message if so.
	if (navigator.cookieEnabled && !checkCookie()) {
		$('#closeCookie').click(function (e) {
			setCookie();
			$('#cookieDialog').hide();
		});
		
		$('#cookieDialog').show();
	}
	
	$('.menu-btn').click(function (e) {
		e.preventDefault();
		showingMenu = !showingMenu;
		$('.navbar-default .navbar-nav > li:not(.menu-btn)').toggle();
	});
	
	if (('ontouchstart' in window)
		|| (navigator.MaxTouchPoints > 0)
		|| (navigator.msMaxTouchPoints > 0)) {
		
		touchscreen = true;
	}
	
	// Change the dropdown items to toggle for the menu system. This will be changed back if screen large enough for dropdowns.
	$('.dropdown').addClass('toggle').removeClass('dropdown');
	$('.dropdown-submenu').addClass('toggle-submenu').removeClass('dropdown-submenu');
	if (touchscreen && $('.nav').css('max-width') !== '799px') {
		$('.toggle-submenu').addClass('large-screen');
		largeScreen = true;
	}
	
	// Stuff for the menu if no dropdown
	$('.toggle, .toggle-submenu').click(function (e) {
		if (dropdown) {
			return;
		}
		
		if (itemClicked) {
			if (!$(this).hasClass('toggle-submenu')) {
				itemClicked = false;
			}
			
			return;
		}
		
		e.preventDefault();
		
		if (subsubmenu) {
			subsubmenu = false;
			return;
		}
		
		if (submenu) {
			submenu = false;
			return;
		}
		
		if (touchscreen) {
			if ($($(this).children()[1]).css('display') !== 'block') {
				if ($(this).hasClass('toggle')) {
					$('.dropdown-menu').hide();
				} else {
					if ($(this).hasClass('sub-menu')) {
						$('.middle-dropdown').hide();
						$('.bottom-dropdown').hide();
					} else {
						if ($(this).hasClass('sub-sub-menu')) {
							$('.bottom-dropdown').hide();
						}
					}
				}
			}
		}
		
		if ($(this).hasClass('toggle-submenu')) {
			submenu = true;
			if ($(this).hasClass('sub-sub-menu')) {
				subsubmenu = true;
			}
		}
		
		var child = $(this).children()[1];
		if (largeScreen) {
			$(child).toggle();
		} else {
			$(child).slideToggle();
		}
	});
	
	$('.dropdown-menu li a').click(function (e) {
		if (dropdown) {
			return;
		}
		
		if (!$(this).parent().hasClass('toggle-submenu')) {
			itemClicked = true;
		}
	});
	
	$('.dropdown-menu li p').click(function (e) {
		if (dropdown) {
			return;
		}
		
		itemClicked = true;
	});
	
	if (!touchscreen && $('.nav').css('max-width') !== '799px') {
		dropdown = true;
		$('.toggle').addClass('dropdown').removeClass('toggle');
		$('.toggle-submenu').addClass('dropdown-submenu').removeClass('toggle-submenu');
	}
	
	$(window).resize(function () {
		setTimeout(function () {
			if (touchscreen) {
				if ($('.nav').css('max-width') === "799px") {
					$('.toggle-submenu').removeClass('large-screen');
					largeScreen = false;
				} else {
					$('.navbar-default .navbar-nav > li:not(.menu-btn)').show();
					$('.toggle-submenu').addClass('large-screen');
					largeScreen = true;
				}
				
				return;
			}
			
			if ($('.nav').css('max-width') === "799px" && dropdown) {
				$('.dropdown').addClass('toggle').removeClass('dropdown');
				$('.dropdown-submenu').addClass('toggle-submenu').removeClass('dropdown-submenu');
				dropdown = false;
			} else {
				if ($('.nav').css('max-width') !== "799px" && !dropdown) {
					if (!showingMenu) {
						$('.navbar-default .navbar-nav > li:not(.menu-btn)').show();
					}
					
					$('.dropdown-menu').css('display', '');
					$('.toggle').addClass('dropdown').removeClass('toggle');
					$('.toggle-submenu').addClass('dropdown-submenu').removeClass('toggle-submenu');
					dropdown = true;
				}
			}
		}, 200);
	});	
});