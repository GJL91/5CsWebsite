package org.fivecs.website;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class PollForNewPosts extends HttpServlet {	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mostRecentDate = request.getParameter("mostRecentDate");
		try {
			long epoch = Long.parseLong(mostRecentDate);
			
			char newPosts = DataStore.PollForNewPosts(epoch);
			if (newPosts == '2') {
				response.setContentType("application/json");
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Null response");
				return;
			}
			
			response.setContentType("application/json");
			response.getWriter().print(newPosts);
		} catch (NumberFormatException e) {
			response.setContentType("application/json");
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Bad epoch time: " + mostRecentDate);
		}
	}
}
