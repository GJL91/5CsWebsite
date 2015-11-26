"use strict";

var msgBox;
var lastDate = 0;
var mostRecentDate = 0;

var expanded = false;

window.onload = start;

function start() {
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
	
	$('.close').click(function (e) {
		e.preventDefault();
		$('#modal').hide();
		$('#referralModal').hide();
		$('body').removeClass('modal-open');
	});
	
	$('.btn-cancel').click(function (e) {
		e.preventDefault();
		$('#referralId').val('');
		$('#referralModal').hide();
		$('body').removeClass('modal-open');
	});
	
	fetchOldPosts();
	setInterval(function() {
		poll()
	}, 120000);
}

function expandMsg() {
	if (!expanded) {
		if (msgBox == null) msgBox = document.getElementById("postTable");
		$('.row').each(function(i, obj) {
			$(this).show();
		});
		
		expanded = true;
		document.getElementById("commentText").focus();
		autosize($('#commentText'));
	}
}

function postMessage() {
	var content = $('#commentText').val();
	var imgURL = $('#imageUrl').val();
	var videoURL = $('#videoUrl').val();
	
	if (content === '' && imgURL === '' && videoURL === '') {
		return;
	}
	
	var request = $.ajax({
		url: '/PostComment',
		method: 'POST',
		data: {
			uploader: $('#uploader').val(),
			content: content,
			imgURL: imgURL,
			videoURL: videoURL
		}
	});
	
	request.done(function (response) {
		resetPostBox();
		fetchNewPosts();
	});
	
	request.fail(function (response) {
		console.log('Something\'s gone wrong trying to post');
	});
}

function fetchOldPosts() {
	$('#loading').removeClass('hidden');
	$('#post_last').addClass('hidden');
	
	var request = $.ajax({
		url: '/FetchOldPosts',
		method: 'GET',
		data: { lastDate: lastDate },
	});
	
	request.done(function (responseJson) {
		if (responseJson != null) {
			$.each(responseJson, function(key, value) {
				var code = getHTML(false, value);
				code.appendTo($('#feedContainer'));
			});
			
			if (responseJson.length === 10) {
				$('#post_last').html('<button class="btn-link fetch-btn" onClick="fetchOldPosts()">Load more</button>').addClass('btn');
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

function resetPostBox() {
	$('#uploader').val(''),
	$('#commentText').val(''),
	$('#imageUrl').val(''),
	$('#videoUrl').val('')
	
	$('.row').each(function(i, obj) {
		$(this).hide();
	});
	
	expanded = false;
}

function fetchNewPosts() {
	$('#loadingNew').removeClass('hidden');
	$('#newPosts').addClass('hidden');
	
	var request = $.ajax({
		url: '/FetchNewPosts',
		method: 'GET',
		data: { mostRecentDate: mostRecentDate }
	});
	
	request.done(function (responseJson) {
		if (responseJson != null) {
			$.each(responseJson, function(key, value) {
				var code = getHTML(true, value);
				code.prependTo($('#feedContainer'));
			});
		} else {
			$('#newPosts').html('<button class="btn-link fetch-btn" onClick="fetchNewPosts()">Sorry! Something\'s gone wrong. Click to try again.</button>').removeClass('hidden');
		}
		
		$('#loadingNew').addClass('hidden');
	});
	
	request.fail(function (responseJson) {
		$('#newPosts').html('<button class="btn-link fetch-btn" onClick="fetchNewPosts()">Sorry! Something\'s gone wrong. Click to try again.</button>').removeClass('hidden');
		$('#loadingNew').addClass('hidden');
	});
}

function poll() {
	if (mostRecentDate === 0) {
		return;		
	}
	
	var request = $.ajax({
		url: '/Poll',
		method: 'GET',
		data: { mostRecentDate: mostRecentDate }
	});
	
	request.done(function (response) {
		if (response === 1) {
			$('#newPosts').removeClass('hidden');
		}
	});
	
	request.fail(function (response) {
	});
}

function showReferralDialog(button, e) {
	e.preventDefault();
	
	var postId = $(button).closest('li').attr('id').substr(5);
	$('#referralId').val(postId);
	$('#failText').addClass('hidden');
	
	$('#referralModal').show();
	$('body').addClass('modal-open');
}

function referPost() {
	$('#failText').addClass('hidden');
	
	var id = $('#referralId').val();
	if (id.length == 0) {
		return;
	}
	
	var request = $.ajax({
		url: '/ReferPost',
		method: 'POST',
		data: { PostId: id }
	});
	
	request.done(function (response) {
		if (response === 1) {
			hideReferredPost(id);
		}
		
		$('#referralId').val('');
		$('#referralModal').hide();
		$('body').removeClass('modal-open');
	});
	
	request.fail(function (response) {
		$('#failText').removeClass('hidden');
	});
}

function hideReferredPost(postId) {
	var post = $('#post_' + postId);
	$('#post_' + postId + ' :gt(1)').remove();
	$(post).append('<p>This post has been referred for moderation.</p>');
}

// Converts an object to html. If mode is true, called by FetchNew
function getHTML(mode, value) {
	var id = value['date'];
	
	if (mode === true || mostRecentDate === 0) {
		mostRecentDate = id;
	}
	
	if (mode === false) {
		lastDate = id;
	}
	
	var referred = value['referred'];
	if (referred) {
		var code = $('<li id="post_' + id + '">' + 
						'<strong>' + value['author'] + '</strong>' +
						'<span class="rightAlign">' + value['dateString'] + '</span>' +
						'<p>This post has been referred for moderation.</p>' +
					 '</li>');
		return code;
	}
	
	var content = value['content'];
	var imageUrl = value['imageUrl'];
	var videoUrl = value['videoUrl'];
	var isReferrable = value['referrable'];
	
	var vidSrc = videoUrl.replace("youtube.com","youtube-nocookie.com").replace("https://","");
	
	var code = 
		$('<li id="post_' + id + '">' +
			'<strong>' + value['author'] + '</strong>' +
			'<span class="rightAlign">' + value['dateString'] + '</span>' +
			'<p>' + content + '</p>' +
			'<img id="img_' + id + '" src="' + imageUrl + '" alt="Image" />' +
			'<iframe id="vid_' + id + '" width="640" height="390" src="https://' + vidSrc + '" frameborder="0" allowfullscreen></iframe>' +
			'<div class="clearfix">' +
				'<span class="rightAlign">' + 
					'<strong><a href="#referralModal" class="text-black" onClick="showReferralDialog(this, event)">Refer for moderation</a></strong>' +
				'</span>' +
			'</div>' +
		'</li>');
		
	if (!isReferrable) {
		code.children().eq(5).remove();
	} 
	
	if (vidSrc == null || vidSrc.length == 0) {
		code.children().eq(4).remove();
	}
	
	if (imageUrl == null || imageUrl.length == 0) {
		code.children().eq(3).remove();
	}
	
	if (content == null || content.length == 0) {
		code.children().eq(2).remove();
	}
		
	return code;
}