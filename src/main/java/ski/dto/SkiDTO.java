package ski.dto;

import java.sql.Date;

public class SkiDTO {
	private int ski_id;
	private int uuid;
	private String name;
	private String ski_phone;
	private String location;
	private String webcam_url;
	private String skmain_img;
	private String sksub_img1;
	private String sksub_img2;
	private String sksub_img3;
	private String description;
	private Date created_at;
	
	public SkiDTO() {}

	public SkiDTO(int ski_id, int uuid, String name, String phone, String location, String webcam_url,
			String skmain_img, String sksub_img1, String sksub_img2, String sksub_img3, String description,
			Date created_at) {
		this.ski_id = ski_id;
		this.uuid = uuid;
		this.name = name;
		this.ski_phone = phone;
		this.location = location;
		this.webcam_url = webcam_url;
		this.skmain_img = skmain_img;
		this.sksub_img1 = sksub_img1;
		this.sksub_img2 = sksub_img2;
		this.sksub_img3 = sksub_img3;
		this.description = description;
		this.created_at = created_at;
	}

	public int getSki_id() {
		return ski_id;
	}

	public void setSki_id(int ski_id) {
		this.ski_id = ski_id;
	}

	public int getUuid() {
		return uuid;
	}

	public void setUuid(int uuid) {
		this.uuid = uuid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSki_phone() {
		return ski_phone;
	}

	public void setSki_phone(String ski_phone) {
		this.ski_phone = ski_phone;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getWebcam_url() {
		return webcam_url;
	}

	public void setWebcam_url(String webcam_url) {
		this.webcam_url = webcam_url;
	}

	public String getSkmain_img() {
		return skmain_img;
	}

	public void setSkmain_img(String skmain_img) {
		this.skmain_img = skmain_img;
	}

	public String getSksub_img1() {
		return sksub_img1;
	}

	public void setSksub_img1(String sksub_img1) {
		this.sksub_img1 = sksub_img1;
	}

	public String getSksub_img2() {
		return sksub_img2;
	}

	public void setSksub_img2(String sksub_img2) {
		this.sksub_img2 = sksub_img2;
	}

	public String getSksub_img3() {
		return sksub_img3;
	}

	public void setSksub_img3(String sksub_img3) {
		this.sksub_img3 = sksub_img3;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	@Override
	public String toString() {
		return "SkiDTO [ski_id=" + ski_id + ", uuid=" + uuid + ", name=" + name + ", ski_phone=" + ski_phone
				+ ", location=" + location + ", webcam_url=" + webcam_url + ", skmain_img=" + skmain_img
				+ ", sksub_img1=" + sksub_img1 + ", sksub_img2=" + sksub_img2 + ", sksub_img3=" + sksub_img3
				+ ", description=" + description + ", created_at=" + created_at + "]";
	}

	
}
