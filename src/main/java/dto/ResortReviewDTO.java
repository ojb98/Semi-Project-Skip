package dto;

import java.sql.Date;

public class ResortReviewDTO {
    private int review_id;
    private int payment_id;
    private int uuid;
    private int resort_id;
    private float rating;
    private String review_comment;
    private String review_img;
    private Date created_at;
    private String user_id;

    public ResortReviewDTO() {
    }

	public ResortReviewDTO(int review_id, int payment_id, int uuid, int resort_id, float rating, String review_comment,
			String review_img, Date created_at, String user_id) {
		super();
		this.review_id = review_id;
		this.payment_id = payment_id;
		this.uuid = uuid;
		this.resort_id = resort_id;
		this.rating = rating;
		this.review_comment = review_comment;
		this.review_img = review_img;
		this.created_at = created_at;
		this.user_id = user_id;
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

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public String getReview_comment() {
		return review_comment;
	}

	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}