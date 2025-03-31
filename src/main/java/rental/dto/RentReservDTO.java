package rental.dto;

import java.util.Date;

public class RentReservDTO {
	private int rent_reserv_id;
	private int rentalshop_id;
	private int uuid;
	private Date rental_start;
	private Date rental_end;
    private double total_price;
    private String status;
    private Date created_at;
    
    public RentReservDTO() {}

	public RentReservDTO(int rent_reserv_id, int rentalshop_id, int uuid, Date rental_start, Date rental_end, double total_price,
			String status, Date created_at) {
		super();
		this.rent_reserv_id = rent_reserv_id;
		this.rentalshop_id = rentalshop_id;
		this.uuid = uuid;
		this.rental_start = rental_start;
		this.rental_end = rental_end;
		this.total_price = total_price;
		this.status = status;
		this.created_at = created_at;
	}

	public int getRent_reserv_id() {
		return rent_reserv_id;
	}

	public void setRent_reserv_id(int rent_reserv_id) {
		this.rent_reserv_id = rent_reserv_id;
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

	public double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(double total_price) {
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

	@Override
	public String toString() {
		return "SkiReservDTO [rent_reserv_id=" + rent_reserv_id + ", rentalshop_id=" + rentalshop_id + ", uuid=" + uuid
				+ ", rental_start=" + rental_start + ", rental_end=" + rental_end + ", total_price=" + total_price
				+ ", status=" + status + ", created_at=" + created_at + "]";
	}
    
    
}
