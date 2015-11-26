<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="initial-scale=1" />
		<meta name="msapplication-TileColor" content="#f7f7f7">
		<meta name="msapplication-TileImage" content="/mstile-144x144.png">
		<meta name="theme-color" content="#ffffff">
		<title>The Five C's</title>
		<script src="/scripts/jquery.js" type="text/javascript"></script>
        <script src="/scripts/common.js" type="text/javascript"></script>
		<script src="/scripts/jquery.slides.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="/styles/meyerreset.css" />
		<link rel="stylesheet" type="text/css" href="/styles/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="/styles/slideshow.css" />
		<link rel="stylesheet" type="text/css" href="/styles/StyleMain.css" />
		<link rel="stylesheet" type="text/css" href="/styles/StyleHeader.css" />
		<link rel="stylesheet" type="text/css" href="/styles/StyleFooter.css" />
		<link rel="stylesheet" type="text/css" href="/styles/mobile.css" />
		<link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
		<link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
		<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
		<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
		<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
		<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
		<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
		<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
		<link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32">
		<link rel="icon" type="image/png" href="/favicon-96x96.png" sizes="96x96">
		<link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">
		<link rel="manifest" href="/manifest.json">
		<script type="text/javascript">
			$(function () {
				$("#slides").slidesjs({
					width: 940,
			      	height: 658,
			      	navigation: {
			    	  	active: false,
			    	  	effect: "fade"
			      	},
			      	pagination: {
			      		active: false
			      	},
			      	play: {
			    	  	active: true,
			    	  	auto: true,
			    	  	swap: true
			      	}
			    });
			    
			    $('#previousBtn').mousedown(function () {
			    	$('#previousBtn').addClass('mousedown');
			    });
			    
			    $('#previousBtn').mouseup(function () {
			    	$('#previousBtn').removeClass('mousedown');
			    });
			    
			    $('#nextBtn').mousedown(function () {
			    	$('#nextBtn').addClass('mousedown');
			    });
			    
			    $('#nextBtn').mouseup(function () {
			    	$('#nextBtn').removeClass('mousedown');
			    });
			});
		</script>
	</head>
	<body>
		<%@ include file="/header.jsp" %>

		<div class="mainContent">
			<div class="container">
				<h1>Photos</h1>
				<div class="bigBox first">
					<div class="gallery-container-photos">
					    <div id="slides">
					    	<% 	File galleryDirectory = new File(application.getRealPath("/Images/gallery-images/"));
								if (galleryDirectory != null) {
									String[] files = galleryDirectory.list();
									if (files != null) {
										for (int i = 0; i < files.length; i++) {
											File file = new File(application.getRealPath("/Images/gallery-images/" + files[i]));
											if (!file.isDirectory()) { %>
												<img src="/Images/gallery-images/<%= files[i] %>" alt="Slideshow image" />
										<%  }
										}
									}
								}
							%>
					      <button type="button" class="slidesjs-previous slidesjs-navigation nextprevious"></button>
					      <button type="button" class="slidesjs-next slidesjs-navigation nextprevious"></button>
					    </div>
					</div>
					<p class="topText">More photos can be found on our <a href="https://www.flickr.com/photos/131546752@N06/sets/">Flickr page</a> and <a href="https://instagram.com/The_five_cs">Instagram account</a>.</p>
				</div>
			</div>
		</div>
	
		<%@ include file="/footer.html" %>
	</body>
</html>