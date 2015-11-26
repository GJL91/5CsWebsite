package org.fivecs.website;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmailSubmit extends HttpServlet {
	private static final long serialVersionUID = -6841767296144573862L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("Name");
		String email = req.getParameter("Email");
		String subject = req.getParameter("Subject");
		String message = req.getParameter("Message");
		
		String emailBody = "A message has been submitted from the website: \r\n\r\n" +
						   "From: " + name + " \r\nEmail: " + email + " \r\nSubject: " + subject + 
						   " \r\nMessage: " + message;
		
		Properties props = new Properties();
		
		String url = "/contact-us/form/?";
		if ("".equals(name) || "".equals(email) || "".equals(subject) || "".equals(message)) {
			url += "Success=0";
		} else {
			Message msg = new MimeMessage(Session.getDefaultInstance(props, null));
			
			try {
				msg.setFrom(new InternetAddress("thefivecscharity@gmail.com", "5Cs Postmaster"));
			} catch (MessagingException e) {
				url += "Success=2";
			}
			
			try {
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress("info@five-cs.org", "The Five Cs"));
			} catch (MessagingException e) {
				url += "Success=3";
			}
			
			try {
				msg.setSubject("Message from: " + name);
			} catch (MessagingException e) {
				url += "Success=4";
			}
			
			try {
				msg.setText(emailBody);
			} catch (MessagingException e) {
				url += "Success=5";
			}
			
			try {
				Transport.send(msg);
				url += "Success=1";
			} catch (SendFailedException e) {
				url += "Success=7";
			} catch (MessagingException e) {
				url += "Success=6";
			}
		}
		
		res.sendRedirect(url);
	}
}
