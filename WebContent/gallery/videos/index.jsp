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
		<title>The Five C's</title>
		<script src="/5Cs/jquery.js" type="text/javascript"></script>
        <script src="/5Cs/common.js" type="text/javascript"></script>
		<script src="/5Cs/videoslideshow.js" type="text/javascript"></script>
<!-- 		<script src="/5Cs/jquery.videoslides.js" type="text/javascript"></script> -->
<!-- 		<script src="/5Cs/slideshow.js" type="text/javascript"></script> -->
		<link rel="stylesheet" type="text/css" href="/5Cs/meyerreset.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/slideshow.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleMain.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleHeader.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleFooter.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/mobile.css" />
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
<!-- 					      <button type="button" class="slidesjs-previous slidesjs-navigation nextprevious"></button> -->
<!-- 					      <button type="button" class="slidesjs-next slidesjs-navigation nextprevious"></button> -->
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
						    	
	<!-- 							<button type="button">Test Button</button> -->
	<!-- 							<button type="button">Test Button</button> -->
	<!-- 							<button type="button">Test Button</button> -->
	<!-- 							<button type="button">Test Button</button> -->
	<!-- 							<button class="last" type="button">Test Button</button> -->
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