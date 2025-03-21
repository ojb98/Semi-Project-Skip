package resort.dto;

import java.sql.Date;
import java.util.List;

public class ResortReservationPrintDto {
	private int resort_reserv_id;
	private int resort_id;
	private int uuid;
	private String name;
	private String userName;
	private String userId;
    private String userEmail;
    private String phone;
	private int total_price;
	private String status;
	private Date reserv_start;
	private Date reserv_end;
	private Date created_at;
	private String payment_id;
	private List<ResortReservationItemDto> resortReservationItemDtoList;
	
	public ResortReservationPrintDto() {}
	public ResortReservationPrintDto(int resort_reserv_id, int resort_id, int uuid, String name, String userName, String userId,
			String userEmail, String phone, int total_price, String status, Date reserv_start, Date reserv_end, Date created_at,
			String payment_id, List<ResortReservationItemDto> resortReservationItemDtoList) {
		super();
		this.resort_reserv_id = resort_reserv_id;
		this.resort_id = resort_id;
		this.uuid = uuid;
		this.name = name;
		this.userName = userName;
		this.userId = userId;
		this.userEmail = userEmail;
		this.phone = phone;
		this.total_price = total_price;
		this.status = status;
		this.reserv_start = reserv_start;
		this.reserv_end = reserv_end;
		this.created_at = created_at;
		this.payment_id = payment_id;
		this.resortReservationItemDtoList = resortReservationItemDtoList;
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

	public int getResort_reserv_id() {
		return resort_reserv_id;
	}

	public void setResort_reserv_id(int resort_reserv_id) {
		this.resort_reserv_id = resort_reserv_id;
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

	public Date getReserv_start() {
		return reserv_start;
	}

	public void setReserv_start(Date reserv_start) {
		this.reserv_start = reserv_start;
	}
	public Date getReserv_end() {
		return reserv_end;
	}

	public void setReserv_end(Date reserv_end) {
		this.reserv_end = reserv_end;
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

	public List<ResortReservationItemDto> getResortReservationItemDtoList() {
		return resortReservationItemDtoList;
	}

	public void setResortReservationItemDtoList(List<ResortReservationItemDto> resortReservationItemDtoList) {
		this.resortReservationItemDtoList = resortReservationItemDtoList;
	}
}
