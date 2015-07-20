import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
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
		
		String emailBody = "A message has been submitted from the website: \r\n\r\n " +
						   "From: " + name + " \r\nEmail: " + email + " \r\nSubject: " + subject + 
						   " \r\nMessage: " + message;
		
		String url = "/5Cs/contact-us/form/?";
		if ("".equals(name) || "".equals(email) || "".equals(subject) || "".equals(message)) {
			try {
				Message msg = new MimeMessage(Session.getDefaultInstance(new Properties(), null));
				msg.setFrom(new InternetAddress("gl0262@my.bris.ac.uk", "it works"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress("gareth.lewis91@hotmail.co.uk", "Gareth Lewis"));
				msg.setSubject("Message from: " + name);
				msg.setText(emailBody);
				Transport.send(msg);
				
//				req.setAttribute("name", name);
				url += "Success=0";
			} catch (MessagingException e) {
				url += "Success=2";
			}
		} else {
			url += "Success=1";
		}
		
		res.sendRedirect(url);
	}
}
