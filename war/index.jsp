<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="initial-scale=1" />
		<meta name="msapplication-TileColor" content="#f7f7f7">
		<meta name="msapplication-TileImage" content="/mstile-144x144.png">
		<meta name="theme-color" content="#ffffff">
		<title>The Five C's - Homepage</title>
		<meta name="description" content="Chernobyl Children Cancer Care Cardiff (5Cs) is a non political, non denominational, Cardiff based charity that is officially twinned with the BCH.">
		<meta name="robots" content="index,follow">
		<meta name="keywords" content="Five Cs,5Cs,Chernobyl,Children,Cancer,Care,Cardiff,Charity,Belarus,Zabrodia,Minsk">
		<script src="/scripts/jquery.js" type="text/javascript"></script>
        <script src="/scripts/common.js" type="text/javascript"></script>
		<script src="/scripts/tickertape.js" type="text/javascript"></script>
		<script src="/scripts/homeSlideshow.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="/styles/meyerreset.css" />
		<link rel="stylesheet" type="text/css" href="/styles/bootstrap.css" />
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
	</head>
	<body>
		<%@ include file="header.jsp" %>

		<div class="newsStory">
			<span class="bold">Latest News: </span>
			<%  String filename = application.getRealPath("/") + "/headlines.txt";
				// URL resource = getServletContext().getResource("/WEB-INF/headlines.txt");
				File file = new File(filename);
				BufferedReader br = new BufferedReader(new FileReader(file));
				String line;
				int i = 0;
				while ((line = br.readLine()) != null) {
					String linkText = line;
					String linkRef = br.readLine(); 
					String classes = "headline-story";
					if (i != 0) classes += " hidden"; %>
					<a id="news<%= i %>" href="<%= linkRef %>" class="<%= classes %>"><%= linkText %></a>
				<%  i++;
			    }
				br.close(); 
				%>
			<div class="ticker-buttons">
				<button type="button" id="playpause" class="play"></button>
				<button type="button" class="previous"></button>
				<button type="button" class="next"></button>
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