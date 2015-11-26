package org.fivecs.website;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

@SuppressWarnings("serial")
public class FetchNewPosts extends HttpServlet {	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mostRecentDate = request.getParameter("mostRecentDate");
		try {
			long epoch = Long.parseLong(mostRecentDate);
			
			List<Post> posts = DataStore.GetNewerPosts(epoch);
			if (posts == null) {
				response.setContentType("application/json");
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Null response");
				return;
			}
			
			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(posts, new TypeToken<List<Post>>(){}.getType());
			JsonArray jsonArray = element.getAsJsonArray();
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		} catch (NumberFormatException e) {
			response.setContentType("application/json");
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Bad epoch time: " + mostRecentDate);
		}
	}
}
