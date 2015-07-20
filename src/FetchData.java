import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;


public class FetchData extends HttpServlet {
	private Connection conn = null;
	
	private Connection getConnection() {
		if (conn != null) {
			return conn;
		}
		
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
			
//		String sql = "SELECT * FROM Posts ORDER BY CreatedDate DESC";
//			String sql = "SELECT * FROM INFORMATION_SCHEMA.SYSTEM_TABLES";
		//String sql = "ALTER TABLE Posts DROP COLUMN UpdatedDate";
		Statement statement = null;
		
		try {
			//database = "D:/Installed Programs/Apache Tomcat/webapps/ROOT/Database/5CsDB";
//			InputStream inputStream = FetchData.class.getClassLoader().getResourceAsStream("/Database/5CsDB");
//			database = application.getRealPath("5Cs/Database/5CsDB");
			Class.forName("org.hsqldb.jdbcDriver");
//			conn = DriverManager.getConnection("jdbc:hsqldb:file:/5Cs/Database/5CsDB", "sa", "");
			conn = DriverManager.getConnection("jdbc:hsqldb:file:D:/Data/My Documents/JavaWS/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/5Cs/Database/5CsDB", "sa", "");
			statement = conn.createStatement();
			statement.execute(create);
//			rS = statement.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return conn;
//		ResultSet rS = null;
	}

	private List<Post> getPosts(int lastId) {
		conn = getConnection();
		if (conn == null) {
			System.err.println("Error: null connection");
			return null;
		}
		
		List<Post> posts = new ArrayList<>();
		try {
			Statement statement = conn.createStatement();
			String sql = "SELECT * FROM Posts WHERE PostID < " + lastId + " ORDER BY CreatedDate DESC LIMIT 10";
			ResultSet rS = statement.executeQuery(sql);
			
			while (rS.next()) {
				Post post = new Post();
				if (rS.getBoolean("Referred")) {
					post.setReferred(true);
				} else {
					post.setReferred(false);
				}
				
				String date = rS.getString("CreatedDate");
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
				}
				
				date = day + dExt + " " + month + " " + year;
					
				String id = "" + rS.getObject("PostID");
				String name = rS.getString("Name");
				String content = rS.getString("Post");
				String imageUrl = rS.getString("ImageURL");
				String videoUrl = rS.getString("VideoURL");
				
				post.setAuthor(name);
				post.setContent(content);
				post.setDate(date);
				post.setId(id);
				post.setImageUrl(imageUrl);
				post.setVideoUrl(videoUrl);
				
				posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return posts;
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("postID");
		try {
			int intID = Integer.parseInt(id);
			
			List<Post> posts = getPosts(intID);
			if (posts == null) {
				response.setContentType("application/json");
				response.sendError(HttpServletResponse.SC_BAD_REQUEST);
				return;
			}
			
			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(posts, new TypeToken<List<Post>>(){}.getType());
			JsonArray jsonArray = element.getAsJsonArray();
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		} catch (NumberFormatException e) {
			response.setContentType("application/json");
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}
	
}
