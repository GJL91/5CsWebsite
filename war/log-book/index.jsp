<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
    
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.io.File" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="initial-scale=1" />
		<meta name="msapplication-TileColor" content="#f7f7f7">
		<meta name="msapplication-TileImage" content="/mstile-144x144.png">
		<meta name="theme-color" content="#ffffff">
		<title>The Five C's - Log Book</title>
		<meta name="description" content="Chernobyl Children Cancer Care Cardiff, The Five Cs. Leave us a message on our public Log Book">
		<meta name="robots" content="index,follow">
		<meta name="keywords" content="Five Cs,5Cs,Chernobyl,Children,Cancer,Care,Cardiff,Charity,Log,Book">
		<script src="/scripts/jquery.js" type="text/javascript"></script>
        <script src="/scripts/common.js" type="text/javascript"></script>
		<script src="/scripts/autosize.js" type="text/javascript"></script>
		<script src="/scripts/betterinnerhtml.js" type="text/javascript"></script>
		<script src="/scripts/logbook.js" type="text/javascript"></script>
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
	
		<div class="modal" id="modal">
			<div class="cover"></div>
			<div class="content">
				<a href="#" class="close">X</a>
				To help us keep our costs down, we don't host images or videos on our site. To add your
				videos or pictures to a post, we ask you to please upload your content to a hosting
				website of your choice. Once your content is online, you can add your link here.<br />
				<br />
				To get the link of an image, the process is slightly different depending on which browser you use.
				For example: in Chrome, right click the image and "Copy image url". Depending on the website hosting
				your image there may be a link for you to copy.<br />
				<br />
				If you have posted your video to YouTube, you simply need to copy the main link to the video.
				If you have used a different website, you need to post the embed link which should be somewhere
				on the page.			
			</div>
		</div>
		
		<div class="modal" id="referralModal">
			<div class="cover"></div>
			<div class="content">
				<a href="#" class="close">X</a>
				Are you sure you want to refer this post for moderation? The post will be unavailable
				until a moderator has made a decision
				<div class="modal-footer">
					<input type="hidden" id="referralId"></input>
					<button type="button" class="btn btn-primary" onclick="referPost()">Refer</button>
					<button type="button" class="btn btn-cancel margin-r-20">Cancel</button>
					<p class="clear padding-t-15 hidden" id="failText">Failed to refer post. If this continues to happen, please email us at info@five-cs.org</p> 
				</div>
			</div>
		</div>		
	
		<div class="mainContent container">
			<div class="postComment">
				<div class="table-wrapper">
					<table>
						<tbody id="postTable">
							<tr>
								<td colspan="3"><textarea id="commentText" onfocus="expandMsg()" name="content" rows="2" placeholder="Why not leave us a message..." ></textarea></td>
							</tr>
							<tr class="row">
								<td class="post_head">Your Name:</td>
								<td class="post_name"><input type="text" id="uploader" name="uploader" autocomplete="off" /></td>
							</tr>
							<tr  class="row">
								<td class="post_head">Attach a picture? URL:</td>
								<td class="post_large"><input type="text" id="imageUrl" name="imgURL" /></td>
								<td class="post_info">
									<div class="post_image">
										<a class="open-modal" href="#modal"><img class="atchPic" src="/Images/info.png" alt="info" /></a>
									</div>
								</td>
							</tr>
							<tr class="row">
								<td class="post_head">Attach a video? URL:</td>
								<td class="post_large"><input type="text" id="videoUrl" name="videoURL" /></td>
								<td class="post_info">
									<div class="post_image">
										<a class="open-modal" href="#modal"><img class="atchPic" src="/Images/info.png" alt="info" /></a>
									</div>
								</td>
							</tr>
							<tr class="row last">
								<td class="post_head"></td>
								<td colspan="2"><button type="button" onClick="postMessage()">Post</button></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- </form> -->
			</div>
			
			<div class="newsFeed">
				<div class="feeds">
					<ul>
						<li id="newPosts" class="fetch btn hidden">
							<button class="btn-link fetch-btn" onClick="fetchNewPosts()">New posts found. Click to load</button>
						</li>
					</ul>
					<div id="loadingNew" class="loading hidden">
						<img src="/Images/loading.gif" alt="loading" />
					</div>
					<ul id="feedContainer"></ul>
					<div id="loading" class="loading hidden">
						<img src="/Images/loading.gif" alt="loading" />
					</div>
					<ul>
						<li id="post_last" class="fetch btn">
							<button class="btn-link fetch-btn" onClick="fetchOldPosts()">Load more</button>
						</li>
					</ul>
				</div>
			</div>
	    </div>
	
		<%@ include file="/footer.html" %>
	
	</body>
</html>