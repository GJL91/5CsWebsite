<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="initial-scale=1" />
		<title>The Five C's</title>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<script src="/5Cs/jquery.js" type="text/javascript"></script>
        <script src="/5Cs/common.js" type="text/javascript"></script>
		<script src="/5Cs/betterinnerhtml.js" type="text/javascript"></script>
		<script src="/5Cs/contact.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="/5Cs/meyerreset.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleMain.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleHeader.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleFooter.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/mobile.css" />
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
					
					<form id="form" method="post" action="/5Cs/Submit">
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