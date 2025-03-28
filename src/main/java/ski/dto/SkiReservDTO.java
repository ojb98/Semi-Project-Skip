package ski.dto;

import java.util.Date;

public class SkiReservDTO {
	private int ski_reserv_id;
	private int ski_id;
	private int uuid;
	private Date reserv_start;
	private Date reserv_end;
    private double total_price;
    private String status;
    private Date created_at;
    
    public SkiReservDTO() {}

	public SkiReservDTO(int ski_reserv_id, int ski_id, int uuid, Date reserv_start, Date reserv_end, double total_price,
			String status, Date created_at) {
		super();
		this.ski_reserv_id = ski_reserv_id;
		this.ski_id = ski_id;
		this.uuid = uuid;
		this.reserv_start = reserv_start;
		this.reserv_end = reserv_end;
		this.total_price = total_price;
		this.status = status;
		this.created_at = created_at;
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

	public Date getReserv_start() {
		return reserv_start;
	}

	public void setReserv_start(Date reservStart) {
		this.reserv_start = reservStart;
	}

	public Date getReserv_end() {
		return reserv_end;
	}

	public void setReserv_end(Date reserv_end) {
		this.reserv_end = reserv_end;
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
		return "SkiReservDTO [ski_reserv_id=" + ski_reserv_id + ", ski_id=" + ski_id + ", uuid=" + uuid
				+ ", reserv_start=" + reserv_start + ", reserv_end=" + reserv_end + ", total_price=" + total_price
				+ ", status=" + status + ", created_at=" + created_at + "]";
	}
    
    
}
