<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="initial-scale=1" />
		<title>The Five C's</title>
		<script src="/5Cs/jquery.js" type="text/javascript"></script>
        <script src="/5Cs/common.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="/5Cs/meyerreset.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleMain.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleHeader.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleFooter.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/mobile.css" />
	</head>
	<body>
		<%@ include file="/header.jsp" %>

		<div class="mainContent">
			<div class="container">
				<h1>2013 Newsletters</h1>
				<div class="bigBox first">
					<%
						String path = application.getRealPath("/news/2013/newsletters");
						File yearDirectory = new File(path);
						String[] newsletters = yearDirectory.list();
						for (int j = 0; j < newsletters.length; j++) {
							if (!"index.jsp".equals(newsletters[j])) { 
								String[] parts = newsletters[j].split("\\."); %>
								<div class="newsletter">
									<img src="/5Cs/Images/pdf.png" alt="PDF image" />
									<a class="text-large" href="/5Cs/news/2013/newsletters/<%= newsletters[j] %>" target="_blank"><span></span><%= parts[1] %></a>
								</div>
					 	<%  } %>
					<%  } %>
				</div>
			</div>
		</div>
	
		<%@ include file="/footer.html" %>
	</body>
</html>