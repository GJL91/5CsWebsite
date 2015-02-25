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
				<h1>Upcoming Events</h1>
				<div class="bigBox first">
					<h5>Miss Jones</h5>
					<p class="block-text">
						On 17th November we will be kick starting our fundraising for next year’s Summer Camp with
						an evening at Miss Jones cocktail bar in Whitchurch from 7pm.<br />
						<br />
						Join us for a 3 course meal and/or drinks while listening to some great entertainment.
					</p>

					<h5>Christmas Film Night</h5>
					<p class="block-text">
						On 14th December we will be holding a Christmas Film Night at Whitchurch Community Centre from 6.30 – 9.30<br />
						<br />
						Please join us for an evening of Christmas films while warming yourselves with Hot Chocolate and popcorn.
					</p>
					
					<h5>St Davids Day 10km Run</h5>
					<p class="block-text">
						On St Davids Day, 1st March, a team of us here at the Five C’s alongside some volunteers from our partner
						organisation in Germany will be completing a sponsored 10km run here in Cardiff.
					</p>

					<h5>Cocktail Party</h5>
					<p class="block-text">
						Our annual cocktail party fundraiser will be in the spring. The theme is yet to be decided but please
						check back soon for more updates.
					</p>

					<h5>Hitchhike</h5>
					<p class="block-text">
						We are in the process of organising a group sponsored hitchhike to Belarus with our partner organisation in Germany.<br />
						<br />
						More news of this will be updated soon.
					</p>

					<h5>Hamburg 10km Run</h5>
					<p class="block-text">
						On April 26th a team of us here at the Five C’s will be travelling to Hamburg, Germany to join our partner
						organisation in Germany to complete another sponsored 10km run.
					</p>
				</div>
			</div>
		</div>
	
		<%@ include file="/footer.html" %>
	</body>
</html>