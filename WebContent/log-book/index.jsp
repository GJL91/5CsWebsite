<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.io.File" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- 		<meta name="viewport" content="initial-scale=1" /> -->
		<title>The Five C's</title>
		<script src="/5Cs/jquery.js" type="text/javascript"></script>
		<script src="/5Cs/jquery.autosize.min.js" type="text/javascript"></script>
		<script src="/5Cs/betterinnerhtml.js" type="text/javascript"></script>
		<script src="/5Cs/news.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="/5Cs/meyerreset.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleMain.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleHeader.css" />
		<link rel="stylesheet" type="text/css" href="/5Cs/StyleFooter.css" />
	</head>
	
	
	<%
		String database = "";
		String create = 
			"CREATE TABLE IF NOT EXISTS Posts (" +
			"PostID INTEGER GENERATED ALWAYS AS IDENTITY," +
			"Name VARCHAR(50) NOT NULL," +
			"CreatedDate DATETIME NOT NULL," +
			"UpdatedDate DATETIME," +
			"Month NUMERIC(2) NOT NULL," +
			"Year NUMERIC(4) NOT NULL," +
			"ImageURL VARCHAR(300)," +
			"VideoURL VARCHAR(300)," +
			"Post VARCHAR(9999) NOT NULL);";
			
		String sql = "SELECT * FROM Posts ORDER BY CreatedDate DESC";
// 		String sql = "SELECT * FROM INFORMATION_SCHEMA.SYSTEM_TABLES";
		//String sql = "ALTER TABLE Posts DROP COLUMN UpdatedDate";
		Connection conn = null;
		Statement statement = null;
		ResultSet rS = null;
		boolean failed = false;

		try {
			//database = "D:/Installed Programs/Apache Tomcat/webapps/ROOT/Database/5CsDB";
			database = application.getRealPath("/Database/5CsDB");
			Class.forName("org.hsqldb.jdbcDriver");
			conn = DriverManager.getConnection("jdbc:hsqldb:file:" + database, "sa", "");
			statement = conn.createStatement();
// 			statement.execute(create);
			rS = statement.executeQuery(sql);
		} catch (Exception e) {
			failed = true;
			%>
			<%= e %>
			<%
			e.printStackTrace();
		}
	%>
	
	<body>
		<%@ include file="/header.jsp" %>
	
		<div class="modal" id="modal">
			
			<div class="cover"></div>
			<div class="content">
				<a href="#" class="close">X</a>
				To help us keep our costs down, we don't host images or videos on our site. To add your
				videos or pictures to a post, we ask you to please upload your content to a hosting
				website of your choice. Once your video is online, you can add your link here.<br />
				<br />
				To get the link of an image, the process is slightly different depending on which browser you use.
				right click the image and "Copy image url", or there may be a link on the website of your choice
				for you to copy.<br />
				<br />
				If you have posted your video to YouTube, you simply need to copy the main link to the video.
				If you have used a different website, you need to post the embed link which should be somewhere
				on the page.			
			</div>
		</div>	
	
		<div class="mainContent container">
<!-- 			<div class="container"> -->
			<div class="postComment">
				<!--h3>Why not leave us a message...</h3-->
				<form action="/5Cs/post.jsp" method="post">
					<table>
						<tbody id="postTable">
							<tr>
								<td colspan="3"><textarea id="commentText" onfocus="expandMsg()" name="content" rows="2" placeholder="Why not leave us a message..." ></textarea></td>
							</tr>
							<tr class="row">
								<td class="post_head">Your Name:</td>
								<td class="post_name"><input type="text" name="uploader" autocomplete="off" /></td>
							</tr>
							<tr  class="row">
								<td class="post_head">Attach a picture? URL:</td>
								<td class="post_large"><input type="text" name="imgURL" /></td>
								<td class="post_info">
									<div class="post_image">
										<a href="#modal"><img class="atchPic" src="/5Cs/Images/info.png" alt="info" /></a>
									</div>
								</td>
							</tr>
							<tr  class="row">
								<td class="post_head">Attach a video? URL:</td>
								<td class="post_large"><input type="text" name="videoURL" /></td>
								<td class="post_info">
									<div class="post_image">
										<div class="imgMsg">
											Test Message 2
										</div>
										<img class="atchPic" src="/5Cs/Images/info.png" alt="info" />
									</div>
								</td>
							</tr>
							<tr class="row last">
								<td class="post_head"></td>
								<td colspan="2"><input type="submit" value="Post" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			
			<div class="newsFeed">
				<!--h3 class="feedHead">Message Book</h3-->
				<div class="feeds">
					<ul id="feedContainer">
						<!--li id="">Item 1</li-->
						<% if (!failed) { %>
							<% while (rS.next()) { %>
								<% if (!rS.getBoolean("Referred")) { %>
									<% String date = rS.getString("CreatedDate");
									String day = date.substring(8,10);
									if (day.startsWith("0")) day = day.substring(1);
									String dExt = "th";
									switch (Integer.parseInt(day)) {
										case 1: 
										case 21: 
										case 31: dExt="st";
												 break;
										case 2:
										case 22: dExt = "nd";
												 break;
										case 3:
										case 23: dExt = "rd";
												 break;
									}
									int m = Integer.parseInt(date.substring(5,7));
									String year = date.substring(0,4);
									
									String month = "December";
									switch (m) {
										case 1: month = "January";
												break;
										case 2: month = "February";
												break;
										case 3: month = "March";
												break;
										case 4: month = "April";
												break;	
										case 5: month = "May";
												break;
										case 6: month = "June";
												break;
										case 7: month = "July";
												break;
										case 8: month = "August";
												break;
										case 9: month = "September";
												break;
										case 10: month = "October";
												break;
										case 11: month = "November";
												break;
									} %>
									
									<li id="<%= rS.getObject("PostID") %>">
										<strong><%= rS.getObject("Name") %></strong>
										<span class="rightAlign"><%= day + dExt + " " + month + " " + year %></span>
										<br /><p><%= rS.getObject("Post") %></p>
										<% if (rS.getObject("ImageURL") != null && rS.getString("ImageURL").length() > 0) { %>
											<!--img src="<%= rS.getObject("ImageURL") %>" alt="Image" style="margin:0 auto; max-width:708px;" /-->
										<% } %>
										
										<% if (rS.getString("VideoURL") != null && rS.getString("VideoURL").length() > 0) { %>
											<% String vidSrc = rS.getString("VideoURL");
											vidSrc = vidSrc.replace("youtube.com","youtube-nocookie.com").replace("https://",""); %>
											<!--iframe width="640" height="390" src="https://<%= vidSrc %>" frameborder="0" allowfullscreen></iframe-->
										<% } %>
										<!--form action="refer.jsp" method="get">
											<input type="
										</form-->
									</li>
								<% } else { %>
									<li id="<%= rS.getObject("PostID") %>"><p class="solo">This post has been referred for moderation.</p></li>
								<% } %>
							<% } %>
							<li class="last"><p class="last">No more posts to display.</p></li>
						<% } else { %>
							<li class="last">Oops! We seem to be having issues connecting to the database. Please try again later.</li>
						<% } %>
					</ul>

					<div class="loading">
						<img src="/5Cs/Images/loading.gif" alt="loading" />
					</div>
				</div>
			</div>
<!-- 			</div> -->
	    </div>
	
		<%  
			if (!failed) {
				rS.close();
				statement.close();
				conn.close();
			}
		%>
	
		<%@ include file="/footer.html" %>
	
	</body>
</html>