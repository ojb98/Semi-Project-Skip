package resort.dto;

import java.sql.Date;

public class ResortDTO {
	private int resort_id;
	private int uuid;
	private String name;
	private String resort_type;
	private String resort_phone;
	private String location;
	private String remain_img;
	private String resub_img1;
	private String resub_img2;
	private String resub_img3;
	private String description;
	private String check_time;  
	private Date created_at;
	
	public ResortDTO() {}

	public ResortDTO(int resort_id, int uuid, String name, String resort_type, String resort_phone, String location, String remain_img,
			String resub_img1, String resub_img2, String resub_img3, String description, String check_time,
			Date created_at) {
		super();
		this.resort_id = resort_id;
		this.uuid = uuid;
		this.name = name;
		this.resort_type = resort_type;
		this.resort_phone = resort_phone;
		this.location = location;
		this.remain_img = remain_img;
		this.resub_img1 = resub_img1;
		this.resub_img2 = resub_img2;
		this.resub_img3 = resub_img3;
		this.description = description;
		this.check_time = check_time;
		this.created_at = created_at;
	}

	public int getResort_id() {
		return resort_id;
	}

	public void setResort_id(int resort_id) {
		this.resort_id = resort_id;
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

	public String getResort_type() {
		return resort_type;
	}

	public void setResort_type(String resort_type) {
		this.resort_type = resort_type;
	}
	
	public String getResort_phone() {
		return resort_phone;
	}

	public void setResort_phone(String resort_phone) {
		this.resort_phone = resort_phone;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getRemain_img() {
		return remain_img;
	}

	public void setRemain_img(String remain_img) {
		this.remain_img = remain_img;
	}

	public String getResub_img1() {
		return resub_img1;
	}

	public void setResub_img1(String resub_img1) {
		this.resub_img1 = resub_img1;
	}

	public String getResub_img2() {
		return resub_img2;
	}

	public void setResub_img2(String resub_img2) {
		this.resub_img2 = resub_img2;
	}

	public String getResub_img3() {
		return resub_img3;
	}

	public void setResub_img3(String resub_img3) {
		this.resub_img3 = resub_img3;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCheck_time() {
		return check_time;
	}

	public void setCheck_time(String check_time) {
		this.check_time = check_time;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	@Override
	public String toString() {
		return "ResortDTO [resort_id=" + resort_id + ", uuid=" + uuid + ", name=" + name + ", resort_type="
				+ resort_type + ", resort_phone=" + resort_phone + ", location=" + location + ", remain_img="
				+ remain_img + ", resub_img1=" + resub_img1 + ", resub_img2=" + resub_img2 + ", resub_img3="
				+ resub_img3 + ", description=" + description + ", check_time=" + check_time + ", created_at="
				+ created_at + "]";
	}


	
}