<%@page import="java.io.File"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>The Five C's</title>
		<script src="/5Cs/jquery.js" type="text/javascript"></script>
		<script src="/5Cs/jquery.slides.js" type="text/javascript"></script>
<!-- 		<script src="/5Cs/slideshow.js" type="text/javascript"></script> -->
		<link rel="stylesheet" type="text/css" href="/5Cs/meyerreset.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/slideshow.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleMain.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleHeader.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleFooter.css" />
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
												<img src="/5Cs/Images/gallery-images/<%= files[i] %>" alt="Slideshow image" />
										<%  }
										}
									}
								}
							%>
					      <button type="button" class="slidesjs-previous slidesjs-navigation nextprevious"></button>
					      <button type="button" class="slidesjs-next slidesjs-navigation nextprevious"></button>
					    </div>
					</div>
				</div>
			</div>
		</div>
	
		<%@ include file="/footer.html" %>
	</body>
</html>