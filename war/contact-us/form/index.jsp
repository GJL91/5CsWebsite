<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="initial-scale=1" />
		<meta name="msapplication-TileColor" content="#f7f7f7">
		<meta name="msapplication-TileImage" content="/mstile-144x144.png">
		<meta name="theme-color" content="#ffffff">
		<title>The Five C's - Contact Us Form</title>
		<meta name="description" content="Chernobyl Children Cancer Care Cardiff, The Five Cs. Use this form to send us a message">
		<meta name="robots" content="index,follow">
		<meta name="keywords" content="Five Cs,5Cs,Chernobyl,Children,Cancer,Care,Cardiff,Charity,Contact">
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<script src="/scripts/jquery.js" type="text/javascript"></script>
        <script src="/scripts/common.js" type="text/javascript"></script>
		<script src="/scripts/betterinnerhtml.js" type="text/javascript"></script>
		<script src="/scripts/contact.js" type="text/javascript"></script>
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
		<%-- <%@ include file="/header.jsp" %> --%>
		<c:import url="/header.jsp" />
		
		<div class="mainContent">
			<div class="container">
				<h1>Contact Us</h1>
				<div class="bigBox first">
					<h2 class="inner">Submit enquiry</h2>
					<% String success = request.getParameter("Success"); %>
					<% if ("1".equals(success)) { %>
						<p class="topText bold success">Thank you for your enquiry. We'll get back to you as soon as we can.</p>
					<% } %>
					
					<form id="form" method="post" action="/Submit">
						<table>
							<tbody>
								<tr>
									<th>Name:</th>
									<td colspan="2"><input id="name" type="text" name="Name" value="<c:out value="${name}"></c:out>" /></td>
								</tr>
								<tr>
									<th>Email:</th>
									<td colspan="2"><input id="email" type="text" name="Email" /></td>
								</tr>
								<tr>
									<th>Subject:</th>
									<td colspan="2"><input id="subject" type="text" name="Subject" /></td>
								</tr>
								<tr>
									<th>Message:</th>
									<td colspan="2"><textarea id="message" class="message" name="Message"></textarea></td>
								</tr>
								<tr>
									<th id="captcha">What is 2 + 2?</th>
									<td><input id="captchaAnswer" type="text" name="captcha" autocomplete="off"/></td>
									<td class="captchaValidation hidden">Please try again</td>
								</tr>
								<tr>
									<th></th>
									<td class="button"><button type="button" onclick="send()">Send</button></td>
									<td class="validation <%= "0".equals(success) ? "" : "hidden" %>">You must enter all fields<td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	
		<%@ include file="/footer.html" %>
	</body>
</html>