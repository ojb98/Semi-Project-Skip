package qna.dto;

import java.sql.Date;

public class QnaDto {
	private int qna_id;
	private int uuid;
	private String category;
	private int ref_id;
	private String ref_name;
	private String title;
	private String content;
	private String status;
	private Date created_at;
	
	private QnaReDto qnaReDto;
	
	public QnaDto() {
		
	}

	public QnaDto(int qna_id, int uuid, String category, int ref_id, String ref_name, String title, String content,
			String status, Date created_at, QnaReDto qnaReDto) {
		super();
		this.qna_id = qna_id;
		this.uuid = uuid;
		this.category = category;
		this.ref_id = ref_id;
		this.ref_name = ref_name;
		this.title = title;
		this.content = content;
		this.status = status;
		this.created_at = created_at;
		this.qnaReDto = qnaReDto;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public QnaReDto getQnaReDto() {
		return qnaReDto;
	}

	public void setQnaReDto(QnaReDto qnaReDto) {
		this.qnaReDto = qnaReDto;
	}
}
