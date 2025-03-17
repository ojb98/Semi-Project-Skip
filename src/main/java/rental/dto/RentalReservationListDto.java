package rental.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class RentalReservationListDto {
	private int rent_reserv_id;
	private int rentalshop_id;
	private int uuid;
	private Timestamp rental_start;
	private Timestamp rental_end;
	private int total_price;
	private String status;
	private Date created_at;
	
	private String name;
	private String payment_id;
	private List<RentalReservationItemDto> rentalReservationItemDtoList;
	
	public RentalReservationListDto() {
		
	}

	public RentalReservationListDto(int rent_reserv_id, int rentalshop_id, int uuid, Timestamp rental_start,
			Timestamp rental_end, int total_price, String status, Date created_at, String name, String payment_id,
			List<RentalReservationItemDto> rentalReservationItemDtoList) {
		super();
		this.rent_reserv_id = rent_reserv_id;
		this.rentalshop_id = rentalshop_id;
		this.uuid = uuid;
		this.rental_start = rental_start;
		this.rental_end = rental_end;
		this.total_price = total_price;
		this.status = status;
		this.created_at = created_at;
		this.name = name;
		this.payment_id = payment_id;
		this.rentalReservationItemDtoList = rentalReservationItemDtoList;
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

	public Timestamp getRental_start() {
		return rental_start;
	}

	public void setRental_start(Timestamp rental_start) {
		this.rental_start = rental_start;
	}

	public Timestamp getRental_end() {
		return rental_end;
	}

	public void setRental_end(Timestamp rental_end) {
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}

	public List<RentalReservationItemDto> getRentalReservationItemDtoList() {
		return rentalReservationItemDtoList;
	}

	public void setRentalReservationItemDtoList(List<RentalReservationItemDto> rentalReservationItemDtoList) {
		this.rentalReservationItemDtoList = rentalReservationItemDtoList;
	}
}
