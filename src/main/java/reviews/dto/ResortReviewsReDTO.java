package reviews.dto;

import java.sql.Date;

public class ResortReviewsReDTO {
	private int reviewReId;
	private int reviewId;
	private int uuid;
	private String content;
	private Date createdAt;
	
	public ResortReviewsReDTO () {}

	public ResortReviewsReDTO(int reviewReId, int reviewId, int uuid, String content, Date createdAt) {
		super();
		
		
		this.reviewReId = reviewReId;
		this.reviewId = reviewId;
		this.uuid = uuid;
		this.content = content;
		this.createdAt = createdAt;
	}

	public int getReviewReId() {
		return reviewReId;
	}

	public void setReviewReId(int reviewReId) {
		this.reviewReId = reviewReId;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getUuid() {
		return uuid;
	}

	public void setUuid(int uuid) {
		this.uuid = uuid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
}
