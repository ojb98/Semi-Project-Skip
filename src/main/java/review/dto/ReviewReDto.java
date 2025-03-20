package review.dto;

import java.sql.Date;

public class ReviewReDto {
	private int review_re_id;
	private int review_id;
	private int uuid;
	private String user_id;
	private String content;
	private Date created_at;
	
	public ReviewReDto() {
		
	}

	public ReviewReDto(int review_re_id, int review_id, int uuid, String user_id, String content, Date created_at) {
		super();
		this.review_re_id = review_re_id;
		this.review_id = review_id;
		this.uuid = uuid;
		this.user_id = user_id;
		this.content = content;
		this.created_at = created_at;
	}

	public int getReview_re_id() {
		return review_re_id;
	}

	public void setReview_re_id(int review_re_id) {
		this.review_re_id = review_re_id;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public int getUuid() {
		return uuid;
	}

	public void setUuid(int uuid) {
		this.uuid = uuid;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
