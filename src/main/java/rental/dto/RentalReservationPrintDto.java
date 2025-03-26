package rental.dto;

import java.sql.Date;
import java.util.List;

public class RentalReservationPrintDto {
	private int rent_reserv_id;
	private int rentalshop_id;
	private int uuid;
	private String name;
	private String userName;
	private String userId;
    private String userEmail;
    private String phone;
	private int total_price;
	private String status;
	private Date rental_start;
	private Date rental_end;
	private Date created_at;
	private String payment_id;
	private List<RentalReservationItemDto> rentalReservationItemDtoList;
	
	public RentalReservationPrintDto() {}
	public RentalReservationPrintDto(int rent_reserv_id, int rentalshop_id, int uuid, String name, String userName, String userId,
			String userEmail, String phone, int total_price, String status, Date rental_start, Date rental_end, Date created_at,
			String payment_id, List<RentalReservationItemDto> rentalReservationItemDtoList) {
		super();
		this.setRent_reserv_id(rent_reserv_id);
		this.rentalshop_id = rentalshop_id;
		this.uuid = uuid;
		this.name = name;
		this.userName = userName;
		this.userId = userId;
		this.userEmail = userEmail;
		this.phone = phone;
		this.total_price = total_price;
		this.status = status;
		this.rental_start = rental_start;
		this.rental_end = rental_end;
		this.created_at = created_at;
		this.payment_id = payment_id;
		this.rentalReservationItemDtoList = rentalReservationItemDtoList;
	}

	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
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
	public int getRent_reserv_id() {
		return rent_reserv_id;
	}
	public void setRent_reserv_id(int rent_reserv_id) {
		this.rent_reserv_id = rent_reserv_id;
	}
}
