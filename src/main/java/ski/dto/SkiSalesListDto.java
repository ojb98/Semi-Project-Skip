package ski.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class SkiSalesListDto {
	private int payment_id;
	private String user_id;
	private String payment_method;
	private int total_price;
	private String status;
	private Date created_at;
	
	public SkiSalesListDto() {}

	public SkiSalesListDto(int payments_id,int ski_reserv_id, String user_id, String payment_method, int total_price, String status,
			Date created_at) {
		super();
		this.payment_id = payments_id;
		this.user_id = user_id;
		this.payment_method = payment_method;
		this.total_price = total_price;
		this.status = status;
		this.created_at = created_at;
	}
	
	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}


	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
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
