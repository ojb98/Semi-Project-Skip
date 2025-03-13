package reviews.dto;

import java.sql.Date;

public class ResortReviewsDTO {
	private int reviewId;
	private int paymentId;
	private int uuid;
	private int resortId;
	private double rating;
	private String resortComment;
	private String reviewImg;
	private Date createdAt;
	
	public ResortReviewsDTO() {}

	public ResortReviewsDTO(int reviewId, int paymentId, int uuid, int resortId, double rating, String resortComment,
			String reviewImg, Date createdAt) {
		super();
		this.reviewId = reviewId;
		this.paymentId = paymentId;
		this.uuid = uuid;
		this.resortId = resortId;
		this.rating = rating;
		this.resortComment = resortComment;
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

	public int getResortId() {
		return resortId;
	}

	public void setResortId(int resortId) {
		this.resortId = resortId;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getResortComment() {
		return resortComment;
	}

	public void setResortComment(String resortComment) {
		this.resortComment = resortComment;
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

	@Override
	public String toString() {
		return "ResortReviewsDTO [reviewId=" + reviewId + ", paymentId=" + paymentId + ", uuid=" + uuid + ", resortId="
				+ resortId + ", rating=" + rating + ", resortComment=" + resortComment + ", reviewImg=" + reviewImg
				+ ", createdAt=" + createdAt + "]";
	}
}
