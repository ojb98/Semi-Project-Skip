package resort.dto;

import java.sql.Date;

public class ResortReservationDto {
	private int resort_reserv_id;
	private int uuid;
	private int room_id;
	private Date checkin_date;
	private Date checkout_date;
	private int quantity;
	private int total_price;
	private String status;
	private Date created_at;

	public ResortReservationDto() {
		
	}

	public ResortReservationDto(int resort_reserv_id, int uuid, int room_id, Date checkin_date, Date checkout_date,
			int quantity, int total_price, String status, Date created_at) {
		super();
		this.resort_reserv_id = resort_reserv_id;
		this.uuid = uuid;
		this.room_id = room_id;
		this.checkin_date = checkin_date;
		this.checkout_date = checkout_date;
		this.quantity = quantity;
		this.total_price = total_price;
		this.status = status;
		this.created_at = created_at;
	}

	public int getResort_reserv_id() {
		return resort_reserv_id;
	}

	public void setResort_reserv_id(int resort_reserv_id) {
		this.resort_reserv_id = resort_reserv_id;
	}

	public int getUuid() {
		return uuid;
	}

	public void setUuid(int uuid) {
		this.uuid = uuid;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public Date getCheckin_date() {
		return checkin_date;
	}

	public void setCheckin_date(Date checkin_date) {
		this.checkin_date = checkin_date;
	}

	public Date getCheckout_date() {
		return checkout_date;
	}

	public void setCheckout_date(Date checkout_date) {
		this.checkout_date = checkout_date;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
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
}
