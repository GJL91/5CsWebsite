package org.fivecs.website;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ReferPost extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postId = request.getParameter("PostId");
		try {
			if (postId == null || "".equals(postId)) {
				response.setContentType("application/json");
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No PostId");
			}
			
			long id = Long.parseLong(postId);
			
			boolean success = DataStore.ReferPost(id);
			if (success) {
				success = sendEmail(id);
			}
			
			if (success) {
				response.setContentType("application/json");
				response.getWriter().print(1);
				return;
			}
			
			response.setContentType("application/json");
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Post not found or email failed to send");
		} catch (NumberFormatException e) {
			response.setContentType("application/json");
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Bad post id");
		}
	}
	
	private boolean sendEmail(long id) {
		Post post = DataStore.GetPostById(id);
		
		String emailBody = 
				"The following post has been referred for moderation: \n\n" +
				"Posted by: " + post.getAuthor() + " \n" +
				"Posted on: " + post.getDateString() + " \n" +
				"Post content: " + post.getContent() + " \n" +
				"Image url included: " + post.getImageUrl() + " \n" +
				"Video url included: " + post.getVideoUrl() + " \n" +
				"\n" +
				"To make a decision on this post, click the following link: \n" +
				"https://console.developers.google.com/datastore/query?queryType=GQLQuery" +
				"&namespace=&kind=Post&project=fivecs-1088&authuser=0&queryText=Select%20*%20From" +
				"%20Post%20Where%20CreatedDate%20%3D%20" + id + "\n" +
				"\n" +
				"To delete the post, simply click the check box and select delete near the top of the page.\n" +
				"To allow the post, click the Name/ID column to open the post, next to referred change the drop down value to False and click Save Entity";
				
		try {
			Message msg = new MimeMessage(Session.getDefaultInstance(new Properties(), null));
			msg.setFrom(new InternetAddress("thefivecscharity@gmail.com", "5Cs Postmaster"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress("info@five-cs.org", "The Five Cs"));
			msg.setSubject("A log book post has been referred for moderation");
			msg.setText(emailBody);
			Transport.send(msg);
		} catch (Exception exception) {
			return false;
		}
		
		return true;
	}
}
