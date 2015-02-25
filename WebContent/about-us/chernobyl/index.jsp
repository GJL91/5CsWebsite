<%@page import="java.io.File"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>The Five C's</title>
		<script src="/5Cs/jquery.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="/5Cs/meyerreset.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleMain.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleHeader.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleFooter.css" />
	</head>
	<body>
		<%@ include file="/header.jsp" %>

		<div class="mainContent">
			<div class="container">
				<h1>Chernobyl</h1>
				<div class="bigBox first">
					<p class="block-text">
						Belarus is situated east of Poland, north of Ukraine, south of Latvia and Lithuania and west of Russia. 
					</p>
					<p class="block-text">
						On 26 April 1986 reactor number four at the Chernobyl plant, near Pripyat in the Ukraine exploded.
						Further explosions and the resulting fire sent a plume of highly radioactive fallout into the atmosphere
						and over an extensive geographical area. One hundred times more fallout was released than had been by the
						atomic bombing of Hiroshima. The prevailing wind was northerly, thus carrying the escaping radioactivity
						across the border into Belarus affecting 23% of its territory, 3,678 towns and 2mn of its 10mn population.
						Belarus received around 70% of the fallout. Many areas were then evacuated and there is still a Closed
						Zone near the border that is still uninhabitable. 
					</p>
					<p class="block-text">
						There are high cancer rates among children, especially those whose parents were exposed to radiation.
						Cancer of the thyroid and widespread immune deficiency syndrome, which makes them prone to other
						diseases, are most common. 
					</p>
					<p class="block-text">
						The full extent of the damage is difficult to assess. The effect of Chernobyl will take thousands of
						years to disappear. Only 8% of the children of Belarus are free from illness.
					</p>
				</div>
			</div>
		</div>
	
		<%@ include file="/footer.html" %>
	</body>
</html>