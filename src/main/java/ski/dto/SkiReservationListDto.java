package ski.dto;

import java.sql.Date;
import java.util.List;

public class SkiReservationListDto {
	private int ski_reserv_id;
	private int ski_id;
	private int uuid;
	private Date reserv_date;
	private int total_price;
	private String status;
	private Date created_at;
	
	private String name;
	private String payment_id;
	private List<SkiReservationItemDto> skiReservationItemDtoList;
	
	public SkiReservationListDto() {
		
	}

	public SkiReservationListDto(int ski_reserv_id, int ski_id, int uuid, Date reserv_date, int total_price,
			String status, Date created_at, String name, String payment_id,
			List<SkiReservationItemDto> skiReservationItemDtoList) {
		super();
		this.ski_reserv_id = ski_reserv_id;
		this.ski_id = ski_id;
		this.uuid = uuid;
		this.reserv_date = reserv_date;
		this.total_price = total_price;
		this.status = status;
		this.created_at = created_at;
		this.name = name;
		this.payment_id = payment_id;
		this.skiReservationItemDtoList = skiReservationItemDtoList;
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
