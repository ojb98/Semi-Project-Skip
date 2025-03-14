package rental.dto;

import java.sql.Date;

public class RentalReservationDto {
	private int rental_reserv_id;
	private int rentalshop_id;
	private int uuid;
	private Date rental_start;
	private Date rental_end;
	private int total_price;
	private String status;
	private Date created_at;
	
	public RentalReservationDto() {
		
	}

	public RentalReservationDto(int rental_reserv_id, int rentalshop_id, int uuid, Date rental_start, Date rental_end,
			int total_price, String status, Date created_at) {
		super();
		this.rental_reserv_id = rental_reserv_id;
		this.rentalshop_id = rentalshop_id;
		this.uuid = uuid;
		this.rental_start = rental_start;
		this.rental_end = rental_end;
		this.total_price = total_price;
		this.status = status;
		this.created_at = created_at;
	}

	public int getRental_reserv_id() {
		return rental_reserv_id;
	}

	public void setRental_reserv_id(int rental_reserv_id) {
		this.rental_reserv_id = rental_reserv_id;
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

	public Date getRental_start() {
		return rental_start;
	}

	public void setRental_start(Date rental_start) {
		this.rental_start = rental_start;
	}

	public Date getRental_end() {
		return rental_end;
	}

	public void setRental_end(Date rental_end) {
		this.rental_end = rental_end;
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
