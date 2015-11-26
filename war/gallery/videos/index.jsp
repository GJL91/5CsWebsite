<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>

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
		<script src="/scripts/videoslideshow.js" type="text/javascript"></script>
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
	</head>
	<body>
		<%@ include file="/header.jsp" %>

		<div class="mainContent">
			<div class="container">
				<h1>Videos</h1>
				<div class="bigBox first">
					<div class="gallery-container-videos">
					    <div id="slides">
					    	<div id="slideHolder">
						    	<%  String filename = application.getRealPath("/gallery/videos/") + "/videos.txt";
									File file = new File(filename);
									BufferedReader br = new BufferedReader(new FileReader(file));
									
									List<String> videoNames = new ArrayList<String>(); 
									
									String line;
									int id = 0;
									while ((line = br.readLine()) != null) { 
										String[] lineParts = line.split("\\[-\\]");
										videoNames.add(lineParts[1]); %>
										<iframe id="video<%= id %>" src="https://<%= lineParts[0] %>&wmode=transparent" allowfullscreen style="left:<%= (id * 100) + "%" %>"></iframe>
								<%  	id++;
									}
									br.close(); %>
							</div>
					    </div>
					    <div class="video-links">
					    	<button type="button" class="link-up" onClick="scrollUp()"><span></span></button>
					    	<button type="button" class="link-down" onClick="scrollDown()"><span></span></button>
					    	<div id="linksHolder">
						    	
						    <%  for (int i = 0; i < videoNames.size(); i++) { 
						    		if (i == 0) { %>
										<button id="link<%= i %>" class="active link" type="button" onClick="changeTo(<%= i %>)"><%= videoNames.get(i) %></button>
								<%  } else { 
										if (i == videoNames.size() - 1) { %>
											<button id="link<%= i %>" class="last link" type="button" onClick="changeTo(<%= i %>)"><%= videoNames.get(i) %></button>
									<%  } else { %>
											<button id="link<%= i %>" class="link" type="button" onClick="changeTo(<%= i %>)"><%= videoNames.get(i) %></button>
									<%  } %>
								<%  }
						    	}
						    %>
						    
							</div>
						</div>
					</div>
					<p class="topText">More videos can be found on our <a href="https://www.youtube.com/channel/UCQBUkVah9dWqd0q7wO2jeUQ/videos">YouTube channel</a>.</p>
				</div>
			</div>
		</div>
	
		<%@ include file="/footer.html" %>
	</body>
</html>