package org.fivecs.website;

import java.util.ArrayList;
import java.util.List;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

public class DataStore {
	/**
	 * The google app engine datastore
	 */
	private static DatastoreService datastore;
	
	/**
	 * Creates the datastore. If it already exists, it simply returns.
	 */
	public static void createDatastore() {
		if (datastore != null) {
			return;
		}
			
		datastore = DatastoreServiceFactory.getDatastoreService();
		return;
	}
	
	/**
	 * Runs a query on the datastore and returns the results
	 * @param query The query to run
	 * @param limit Whether to set a limit on the number of results (We can't actually run without a limit so it's set to 1000)
	 * @return A list of posts matching the query
	 */
	private static List<Post> getPosts(Query query, boolean limit) {
		List<Entity> entities;
		if (limit) {
			entities = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(10));
		} else {
			entities = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(1000));
		}
		
		if (!entities.isEmpty()) {
			List<Post> posts = new ArrayList<>(entities.size());
			for (Entity entity : entities) {
				posts.add(convertEntityToPost(entity));
			}
			
			return posts;
		}
		
		return new ArrayList<Post>(0);
	}
	
	private static Post convertEntityToPost(Entity entity) {
		return convertEntityToPost(entity, false);
	}
	
	/**
	 * Converts a datastore entity to a Post object
	 * @param entity The entity to convert
	 * @return The converted Post object
	 */
	private static Post convertEntityToPost(Entity entity, boolean getAllFields) {
		Post post = new Post();
		post.setReferred((boolean) entity.getProperty("Referred"));
		post.setReferrable((boolean) entity.getProperty("Referrable"));
		
		long epochTime = (long) entity.getProperty("CreatedDate");
		String dateString = entity.getProperty("DateString").toString();
		
		post.setDate(epochTime);
		post.setDateString(dateString);
		post.setAuthor(entity.getProperty("Name").toString());
		
		// If the post has been referred for moderation, we don't want to put any of the actual content in
		// Unless, that is, that we specifically request all information. This is done when referring a post
		// to put the content in the email
		if (post.isReferrable() && post.getReferred() && !getAllFields) {
			return post;
		}
		
		post.setContent(entity.getProperty("Content").toString());
		post.setImageUrl(entity.getProperty("ImageURL").toString());
		post.setVideoUrl(entity.getProperty("VideoURL").toString());
		
		return post;
	}
	
	/**
	 * Gets a post by the epoch time it was posted
	 * @param epoch The time the post was posted
	 * @return The post
	 */
	public static Post GetPostById(long epoch) {
		createDatastore();
		if (datastore == null) {
			System.err.println("Error: Datastore is null");
			return null;
		}
		
		Filter filter = new FilterPredicate("CreatedDate", FilterOperator.EQUAL, epoch);
		Query query = new Query("Post").setFilter(filter);
		
		Entity entity = datastore.prepare(query).asSingleEntity();
		return convertEntityToPost(entity, true);
	}
	
	/**
	 * Gets the next 10 posts older than the given epoch time
	 * @param epoch The time to get older posts from
	 * @return 10 posts
	 */
	public static List<Post> GetOlderPosts(long epoch) {
		createDatastore();
		if (datastore == null) {
			System.err.println("Error: Datastore is null");
			return null;
		}
		
		Query query;
		if (epoch == 0) {
			query = new Query("Post").addSort("CreatedDate", Query.SortDirection.DESCENDING);
		} else {
			Filter filter = new FilterPredicate("CreatedDate", FilterOperator.LESS_THAN, epoch);
			query = new Query("Post").setFilter(filter).addSort("CreatedDate", Query.SortDirection.DESCENDING);
		}
		
		return getPosts(query, true);
	}
	
	/**
	 * Gets all posts newer than the given epoch time
	 * @param epoch The time to get all posts newer than
	 * @return 10 posts
	 */
	public static List<Post> GetNewerPosts(long epoch) {
		createDatastore();
		if (datastore == null) {
			System.err.println("Error: Datastore is null");
			return null;
		}
		
		Filter filter = new FilterPredicate("CreatedDate", FilterOperator.GREATER_THAN, epoch);
		Query query = new Query("Post").setFilter(filter).addSort("CreatedDate", Query.SortDirection.ASCENDING);
		
		return getPosts(query, false);
	}
	
	/**
	 * Polls for new posts
	 * @param epoch The time to poll for posts newer than
	 * @return A char
	 */
	public static char PollForNewPosts(long epoch) {
		createDatastore();
		if (datastore == null) {
			System.err.println("Error: Datastore is null");
			return '2';
		}
		
		Filter filter = new FilterPredicate("CreatedDate", FilterOperator.GREATER_THAN, epoch);
		Query query = new Query("Post").setFilter(filter);
		
		int count = datastore.prepare(query).countEntities(FetchOptions.Builder.withLimit(1));
		return count > 0 ? '1' : '0';
	}
	
	/**
	 * Sets the referred flag on an entity
	 * @param postDate The epoch time of the post
	 * @return A success flag
	 */
	public static boolean ReferPost(long postDate) {
		createDatastore();
		if (datastore == null) {
			System.err.println("Error: Datastore is null");
			return false;
		}
		
		Filter filter = new FilterPredicate("CreatedDate", FilterOperator.EQUAL, postDate);
		Query query = new Query("Post").setFilter(filter);
		
		Entity entity = datastore.prepare(query).asSingleEntity();
		
		if (!(boolean) entity.getProperty("Referrable")) {
			return false;
		}
		
		entity.setProperty("Referred", true);
		datastore.put(entity);
		
		return true;
	}
}
