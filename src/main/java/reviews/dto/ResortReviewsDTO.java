package reviews.dto;

import java.sql.Date;

public class ResortReviewsDTO {
	private int review_id;
	private int payment_id;
	private int uuid;
	private int resort_id;
	private double rating;
	private String resort_comment;
	private String review_img;
	private Date created_at;
	
	public ResortReviewsDTO() {}
	
	public ResortReviewsDTO(int review_id, int payment_id, int uuid, int resort_id, double rating,
			String resort_comment, String review_img, Date created_at) {
		super();
		this.review_id = review_id;
		this.payment_id = payment_id;
		this.uuid = uuid;
		this.resort_id = resort_id;
		this.rating = rating;
		this.resort_comment = resort_comment;
		this.review_img = review_img;
		this.created_at = created_at;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	public int getUuid() {
		return uuid;
	}

	public void setUuid(int uuid) {
		this.uuid = uuid;
	}

	public int getResort_id() {
		return resort_id;
	}

	public void setResort_id(int resort_id) {
		this.resort_id = resort_id;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getResort_comment() {
		return resort_comment;
	}

	public void setResort_comment(String resort_comment) {
		this.resort_comment = resort_comment;
	}

	public String getReview_img() {
		return review_img;
	}

	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	@Override
	public String toString() {
		return "ResortReviewsDTO [review_id=" + review_id + ", payment_id=" + payment_id + ", uuid=" + uuid
				+ ", resort_id=" + resort_id + ", rating=" + rating + ", resort_comment=" + resort_comment
				+ ", review_img=" + review_img + ", created_at=" + created_at + "]";
	}
}
