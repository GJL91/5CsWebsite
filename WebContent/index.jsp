<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>The Five C's</title>
		<script src="/5Cs/jquery.js" type="text/javascript"></script>
		<script src="/5Cs/jquery.autosize.min.js" type="text/javascript"></script>
		<script src="/5Cs/betterinnerhtml.js" type="text/javascript"></script>
		<script src="/5Cs/tickertape.js" type="text/javascript"></script>
		<script src="/5Cs/homeSlideshow.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="/5Cs/meyerreset.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleMain.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleHeader.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleFooter.css" />
	</head>
	<body>
		<%@ include file="header.jsp" %>

		<div class="newsStory">
			<span class="bold">Latest News: </span>
			<%  String filename = application.getRealPath("/") + "headlines.txt";
				File file = new File(filename);
				BufferedReader br = new BufferedReader(new FileReader(file));
				String line;
				int i = 0;
				while ((line = br.readLine()) != null) {
					String linkText = line;
					String linkRef = br.readLine(); 
					String classes = "story";
					if (i != 0) classes += " hidden";
			%>
					<a id="news<%= i %>" href="<%= linkRef %>" class="<%= classes %>"><%= linkText %></a>
				<%  i++;
			    }
				br.close(); 
				%>
			<div class="ticker-buttons">
				<button type="button" id="playpause" class="play" />
				<button type="button" class="previous" />
				<button type="button" class="next" />
			</div>
		</div>

		<div class="mainContent">
			<div class="container">
				<div class="bigBox">
					<p class="quote">&#8220;When  my life is finally measured in months, weeks, days, hours, I want to live free of pain, indignity and loneliness. Give me shelter, reach out your hand, give me understanding and give me your love. Then let me go peacefully and help my family to understand.&#8221;</p>
					<p class="quote author">Belarusian Children's Hospice</p>
					
					<div class="slideshow_home">
						<div class="imgHolder">
							<div class="imgs" id="Img1"></div>
							<div class="imgs" id="Img2"></div>
							<div class="imgs" id="Img3"></div>
							<div class="imgs" id="Img4"></div>
							<div class="imgs" id="Img5"></div>
							<div class="imgs" id="Img6"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<%@ include file="footer.html" %>
	</body>
</html>