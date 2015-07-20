"use strict";

var dropdown = false;
var submenu = false;
var subsubmenu = false;

var itemClicked = false;
var showingMenu = false;

$(function() {
	// Hide the no javascript warning.
	$('.javascript').hide();
	
	$('.menu-btn').click(function (e) {
		e.preventDefault();
		showingMenu = !showingMenu;
		$('.navbar-default .navbar-nav > li:not(.menu-btn)').toggle();
	});
	
	// Change the dropdown items to toggle for the menu system. This will be changed back if screen large enough for dropdowns.
	$('.dropdown').addClass('toggle').removeClass('dropdown');
	$('.dropdown-submenu').addClass('toggle-submenu').removeClass('dropdown-submenu');
	
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
		
		if ($(this).hasClass('toggle-submenu')) {
			submenu = true;
			if ($(this).hasClass('sub-sub-menu')) {
				subsubmenu = true;
			}
		}
		
		var child = $(this).children()[1];
		$(child).slideToggle();
	});
	
	$('.dropdown-menu li a').click(function (e) {
		if (dropdown) {
			return;
		}
		
		if (!$(this).parent().hasClass('toggle-submenu')) {
			itemClicked = true;
		}
	});
	
	if ($(window).width() > 800) {
		dropdown = true;
		$('.toggle').addClass('dropdown').removeClass('toggle');
		$('.toggle-submenu').addClass('dropdown-submenu').removeClass('toggle-submenu');
	}
	
	$(window).resize(function () {
		if ($(window).width() < 800 && dropdown) {
			$('.dropdown').addClass('toggle').removeClass('dropdown');
			$('.dropdown-submenu').addClass('toggle-submenu').removeClass('dropdown-submenu');
			dropdown = false;
		} else {
			if ($(window).width() > 800 && !dropdown) {
				if (!showingMenu) {
					$('.navbar-default .navbar-nav > li:not(.menu-btn)').show();
				}
				
				$('.dropdown-menu').css('display', '');
				$('.toggle').addClass('dropdown').removeClass('toggle');
				$('.toggle-submenu').addClass('dropdown-submenu').removeClass('toggle-submenu');
				dropdown = true;
			}
		}
	});
	
});