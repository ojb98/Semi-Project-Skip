package rental.dto;

import java.sql.Date;

public class RentSkiItemDTO {
	private int item_id;
	private int category_id;
	private int ref_id;    //렌탈샵,스키장 참조아이디
	private String item_name;
	private String item_detail;
	private int total_quantity;  //장비수량
	private String item_img;
	private Date created_at;
	
	public RentSkiItemDTO() {}

	public RentSkiItemDTO(int item_id, int category_id, int ref_id, String item_name, String item_detail,
			int total_quantity, String item_img, Date created_at) {
		this.item_id = item_id;
		this.category_id = category_id;
		this.ref_id = ref_id;
		this.item_name = item_name;
		this.item_detail = item_detail;
		this.total_quantity = total_quantity;
		this.item_img = item_img;
		this.created_at = created_at;
	}

	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public int getRef_id() {
		return ref_id;
	}

	public void setRef_id(int ref_id) {
		this.ref_id = ref_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_detail() {
		return item_detail;
	}

	public void setItem_detail(String item_detail) {
		this.item_detail = item_detail;
	}

	public int getTotal_quantity() {
		return total_quantity;
	}

	public void setTotal_quantity(int total_quantity) {
		this.total_quantity = total_quantity;
	}

	public String getItem_img() {
		return item_img;
	}

	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	@Override
	public String toString() {
		return "RentSkiItemDTO [item_id=" + item_id + ", category_id=" + category_id + ", ref_id=" + ref_id
				+ ", item_name=" + item_name + ", item_detail=" + item_detail + ", total_quantity=" + total_quantity
				+ ", item_img=" + item_img + ", created_at=" + created_at + "]";
	}
	
	
	
}
