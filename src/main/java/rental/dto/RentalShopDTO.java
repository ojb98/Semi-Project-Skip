package rental.dto;

import java.sql.Date;

public class RentalShopDTO {
	private int rentalshop_id;
	private int uuid;
	private String name;
	private String rental_phone;
	private String location;
	private String remain_img;
	private String resub_img1;
	private String resub_img2;
	private String resub_img3;
	private String description; 
	private Date created_at;
	
	public RentalShopDTO() {}

	public RentalShopDTO(int rentalshop_id, int uuid, String name, String rental_phone, String location,
			String remain_img, String resub_img1, String resub_img2, String resub_img3, String description,
			Date created_at) {
		this.rentalshop_id = rentalshop_id;
		this.uuid = uuid;
		this.name = name;
		this.rental_phone = rental_phone;
		this.location = location;
		this.remain_img = remain_img;
		this.resub_img1 = resub_img1;
		this.resub_img2 = resub_img2;
		this.resub_img3 = resub_img3;
		this.description = description;
		this.created_at = created_at;
	}

	public int getRentalshop_id() {
		return rentalshop_id;
	}

	public void setRentalshop_id(int rentalshop_id) {
		this.rentalshop_id = rentalshop_id;
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

	public String getRental_phone() {
		return rental_phone;
	}

	public void setRental_phone(String rental_phone) {
		this.rental_phone = rental_phone;
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

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	@Override
	public String toString() {
		return "RentalShopDTO [rentalshop_id=" + rentalshop_id + ", uuid=" + uuid + ", name=" + name + ", rental_phone="
				+ rental_phone + ", location=" + location + ", remain_img=" + remain_img + ", resub_img1=" + resub_img1
				+ ", resub_img2=" + resub_img2 + ", resub_img3=" + resub_img3 + ", description=" + description
				+ ", created_at=" + created_at + "]";
	}
	
	
}
