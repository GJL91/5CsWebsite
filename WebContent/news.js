"use strict";

var feedUL;
var msgBox;
var postId = 100000000;

var expanded = false;
var contentBoxes;

window.onload = start;

function start() {
//	$('#commentText').autosize();
	autosize($('#commentText'));

	msgBox = document.getElementById("postTable");
	$('.row').each(function(i, obj) {
		$(this).hide();
	});

	$('.open-modal').click(function (e) {
		e.preventDefault();
		$('#modal').show();
		$('body').addClass('modal-open');
	});
	
	$('#close-modal').click(function (e) {
		e.preventDefault();
		$('#modal').hide();
		$('body').removeClass('modal-open');
	});
	
	fetchData();
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

function fetchData() {
	$('#loading').removeClass('hidden');
	$('#post_last').addClass('hidden');
	
	var request = $.ajax({
		url: '/5Cs/FetchData',
		method: 'GET',
		data: { postID: postId },
	});
	
	request.done(function (responseJson) {
		if (responseJson != null) {
			$.each(responseJson, function(key, value) {
				var code = getHTML(value);
				code.appendTo($('#feedContainer'));
			});
			
			if (responseJson.length === 10) {
				$('#post_last').html('<button class="btn-link fetch-btn" onClick="fetchData()">Load more</button>').addClass('btn');
			} else {
				$('#post_last').html('<p class="last">No more posts to display.</p>').removeClass('btn');
			}
		} else {
			$('#post_last').html('<p class="last">Sorry! Something\'s gone wrong, please try again later.</p>').removeClass('btn');
		}
		
		$('#loading').addClass('hidden');
		$('#post_last').removeClass('hidden');
	});
	
	request.fail(function (responseJson) {
		$('#post_last').html('<p class="last">Sorry! Something\'s gone wrong, please try again later.</p>').removeClass('btn');
		$('#loading').addClass('hidden');
		$('#post_last').removeClass('hidden');
	});
}

function getHTML(value) {
	var referred = value['referred'];
	if (referred) {
		var code = $('<li id="post_' + id + '"><p class="solo">This post has been referred for moderation.</p></li>');
		return code;
	}
	
	var id = value['id'];
	var imageUrl = value['imageUrl'];
	var videoUrl = value['videoUrl'];
	var vidSrc = videoUrl.replace("youtube.com","youtube-nocookie.com").replace("https://","");
	
	postId = id;
	
	var code = 
		$('<li id="post_' + id + '">' +
			'<strong>' + value['author'] + '</strong>' +
			'<span class="rightAlign">' + value['date'] + '</span>' +
			'<br /><p>' + value['content'] + '</p>' +
			'<img id="img_' + id + '" src="' + imageUrl + '" alt="Image" />' +
			'<iframe id="vid_' + id + '" width="640" height="390" src="https://' + vidSrc + '" frameborder="0" allowfullscreen></iframe>' +
		'</li>');
			
	if (vidSrc == null || vidSrc.length == 0) {
		code.children().eq(5).remove();
	}
	
	if (imageUrl == null || imageUrl.length == 0) {
		code.children().eq(4).remove();
	}
		
	return code;
}