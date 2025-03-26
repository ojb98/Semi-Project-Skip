package qna.dto;

import java.sql.Date;

public class QnaReDto {
	private int qna_re_id;
	private int qna_id;
	private int uuid;
	private String user_id;
	private String content;
	private Date created_at;
	
	public QnaReDto() {
		
	}

	public QnaReDto(int qna_re_id, int qna_id, int uuid, String user_id, String content, Date created_at) {
		super();
		this.qna_re_id = qna_re_id;
		this.qna_id = qna_id;
		this.uuid = uuid;
		this.user_id = user_id;
		this.content = content;
		this.created_at = created_at;
	}

	public int getQna_re_id() {
		return qna_re_id;
	}

	public void setQna_re_id(int qna_re_id) {
		this.qna_re_id = qna_re_id;
	}

	public int getQna_id() {
		return qna_id;
	}

	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
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
