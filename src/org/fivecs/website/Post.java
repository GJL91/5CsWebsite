package org.fivecs.website;

public class Post {
	private boolean referred;
	private boolean referrable;
	private String id;
	private String author;
	private long date;
	private String dateString;
	private String content;
	private String imageUrl;
	private String videoUrl;
	
	public boolean getReferred() {
		return referred;
	}
	
	public void setReferred(boolean referred) {
		this.referred = referred;
	}
	
	public boolean isReferrable() {
		return referrable;
	}

	public void setReferrable(boolean referrable) {
		this.referrable = referrable;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public long getDate() {
		return date;
	}
	
	public void setDate(long date) {
		this.date = date;
	}
	
	public void setDateString(String dateString) {
		this.dateString = dateString;
	}
	
	public String getDateString() {
		return dateString;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getImageUrl() {
		return imageUrl;
	}
	
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	public String getVideoUrl() {
		return videoUrl;
	}
	
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
}
