<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="initial-scale=1" />
		<meta name="msapplication-TileColor" content="#f7f7f7">
		<meta name="msapplication-TileImage" content="/mstile-144x144.png">
		<meta name="theme-color" content="#ffffff">
		<title>The Five C's - 2015 Newsletters</title>
		<meta name="description" content="Chernobyl Children Cancer Care Cardiff, The Five Cs. Catch up with our 2015 newsletters">
		<meta name="robots" content="index,follow">
		<meta name="keywords" content="Five Cs,5Cs,Chernobyl,Children,Cancer,Care,Cardiff,Charity,2015,Newsletters">
		<script src="/scripts/jquery.js" type="text/javascript"></script>
        <script src="/scripts/common.js" type="text/javascript"></script>
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
		<%@ include file="/header.jsp" %>

		<div class="mainContent">
			<div class="container">
				<h1>2015 Newsletters</h1>
				<div class="bigBox first">
					<%
						String path = application.getRealPath("/news/2015/newsletters");
						File yearDirectory = new File(path);
						String[] newsletters = yearDirectory.list();
						for (int j = 0; j < newsletters.length; j++) {
							if (!"index.jsp".equals(newsletters[j])) { 
								String[] parts = newsletters[j].split("\\."); %>
								<div class="newsletter">
									<img src="/Images/pdf.png" alt="PDF image" />
									<a class="text-large" href="/news/2015/newsletters/<%= newsletters[j] %>" target="_blank"><span></span><%= parts[1] %></a>
								</div>
					 	<%  } %>
					<%  } %>
				</div>
			</div>
		</div>
	
		<%@ include file="/footer.html" %>
	</body>
</html>