package adminDto;

import java.sql.Date;

public class SkiReviewDTO {
	private int reviewId;
	private int paymentId;
	private int uuid;
	private int skiId;
	private int rating;
	private String reviewComment;
	private String reviewImg;
	private Date createdAt;
	
	public SkiReviewDTO() {}
	
	public SkiReviewDTO(int reviewId, int paymentId, int uuid, int skiId, int rating, String reviewComment,
			String reviewImg, Date createdAt) {
		super();
		this.reviewId = reviewId;
		this.paymentId = paymentId;
		this.uuid = uuid;
		this.skiId = skiId;
		this.rating = rating;
		this.reviewComment = reviewComment;
		this.reviewImg = reviewImg;
		this.createdAt = createdAt;
	}

	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public int getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}
	public int getUuid() {
		return uuid;
	}
	public void setUuid(int uuid) {
		this.uuid = uuid;
	}
	public int getSkiId() {
		return skiId;
	}
	public void setSkiId(int skiId) {
		this.skiId = skiId;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getReviewComment() {
		return reviewComment;
	}
	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}
	public String getReviewImg() {
		return reviewImg;
	}
	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}	
}

