package review.dto;

import java.sql.Date;

public class ReviewsDto {
	private String category;
	private int review_id;
	private int payment_id;
	private int uuid;
	private int ref_id;
	private String ref_name;
	private int rating;
	private String review_comment;
	private String review_img;
	private Date created_at;
	
	private ReviewReDto reviewReDto;
	
	public ReviewsDto() {
		
	}

	public ReviewsDto(String category, int review_id, int payment_id, int uuid, int ref_id, String ref_name, int rating,
			String review_comment, String review_img, Date created_at, ReviewReDto reviewReDto) {
		super();
		this.category = category;
		this.review_id = review_id;
		this.payment_id = payment_id;
		this.uuid = uuid;
		this.ref_id = ref_id;
		this.ref_name = ref_name;
		this.rating = rating;
		this.review_comment = review_comment;
		this.review_img = review_img;
		this.created_at = created_at;
		this.reviewReDto = reviewReDto;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public int getRef_id() {
		return ref_id;
	}

	public void setRef_id(int ref_id) {
		this.ref_id = ref_id;
	}

	public String getRef_name() {
		return ref_name;
	}

	public void setRef_name(String ref_name) {
		this.ref_name = ref_name;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
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

	public ReviewReDto getReviewReDto() {
		return reviewReDto;
	}

	public void setReviewReDto(ReviewReDto reviewReDto) {
		this.reviewReDto = reviewReDto;
	}

	
}
