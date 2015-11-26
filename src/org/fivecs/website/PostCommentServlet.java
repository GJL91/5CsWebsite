package org.fivecs.website;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import org.apache.commons.lang3.StringEscapeUtils;

@SuppressWarnings("serial")
public class PostCommentServlet extends HttpServlet {
	private String getDateString(long epoch) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy 'at' HH:mm");
		return dateFormat.format(epoch);
	}
	
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        
        String name = req.getParameter("uploader");
        String content = req.getParameter("content");
        String iUrl = req.getParameter("imgURL");
        String vUrl = req.getParameter("videoURL");
        long epoch = new Date().getTime();
        String dateString = getDateString(epoch);
        
        if (name == null || name.equals("")) name = "Anonymous";
        if (content == null) content = "";
        if (iUrl == null) iUrl = "";
        if (vUrl == null) vUrl = "";
        
        if ("".equals(content) && "".equals(iUrl) && "".equals(vUrl)) {
        	return;
        }
        
        if (vUrl != "") {
        	vUrl = vUrl.replace("youtube.com","youtube-nocookie.com").replace("watch?v=","embed/").replace("http://","https://");
        }
        
        name = StringEscapeUtils.escapeHtml4(name);
        content = StringEscapeUtils.escapeHtml4(content);
        iUrl = StringEscapeUtils.escapeHtml4(iUrl);
        vUrl = StringEscapeUtils.escapeHtml4(vUrl);
        
        Key pKey = KeyFactory.createKey("Post", "" + epoch);
        
        Entity post = new Entity("Post", pKey);
        post.setProperty("Name", name);
        post.setProperty("CreatedDate", epoch);
        post.setProperty("DateString", dateString);
        post.setProperty("Content", content);
        post.setProperty("ImageURL", iUrl);
        post.setProperty("VideoURL", vUrl);
        post.setProperty("Referred", false);
        post.setProperty("Referrable", true);
        
        datastore.put(post);
    }
}
