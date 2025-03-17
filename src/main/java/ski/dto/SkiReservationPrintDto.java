package ski.dto;

import java.sql.Date;
import java.util.List;

public class SkiReservationPrintDto {
	private int ski_reserv_id;
	private int ski_id;
	private int uuid;
	private String name;
	private String userName;
	private String userId;
    private String userEmail;
    private String phone;
	private int total_price;
	private String status;
	private Date reserv_date;
	private Date created_at;
	
	
	private String payment_id;
	private List<SkiReservationItemDto> skiReservationItemDtoList;
	
	public SkiReservationPrintDto() {}
	public SkiReservationPrintDto(int ski_reserv_id, int ski_id, int uuid, String name, String userName, String userId,
			String userEmail, String phone, int total_price, String status, Date reserv_date, Date created_at,
			String payment_id, List<SkiReservationItemDto> skiReservationItemDtoList) {
		super();
		this.ski_reserv_id = ski_reserv_id;
		this.ski_id = ski_id;
		this.uuid = uuid;
		this.name = name;
		this.userName = userName;
		this.userId = userId;
		this.userEmail = userEmail;
		this.phone = phone;
		this.total_price = total_price;
		this.status = status;
		this.reserv_date = reserv_date;
		this.created_at = created_at;
		this.payment_id = payment_id;
		this.skiReservationItemDtoList = skiReservationItemDtoList;
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

	public int getSki_reserv_id() {
		return ski_reserv_id;
	}

	public void setSki_reserv_id(int ski_reserv_id) {
		this.ski_reserv_id = ski_reserv_id;
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

	public Date getReserv_date() {
		return reserv_date;
	}

	public void setReserv_date(Date reserv_date) {
		this.reserv_date = reserv_date;
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

	public List<SkiReservationItemDto> getSkiReservationItemDtoList() {
		return skiReservationItemDtoList;
	}

	public void setSkiReservationItemDtoList(List<SkiReservationItemDto> skiReservationItemDtoList) {
		this.skiReservationItemDtoList = skiReservationItemDtoList;
	}
}
