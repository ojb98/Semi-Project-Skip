package adminDto;

import java.sql.Date;

public class SkiReservationDTO {
	private int skiReservId;
    private String userName;
    private String userId;
    private String userEmail;
    private String phone;
    private String status;
	private Date reservDate;
    private Date createdAt;
    
    public SkiReservationDTO() {}
    
    public SkiReservationDTO(int skiReservId, String userName, String userId, String userEmail, String phone, String status, Date reservDate, Date createdAt) {
		this.skiReservId = skiReservId;
		this.userName = userName;
		this.userId = userId;
		this.userEmail = userEmail;
		this.phone = phone;
		this.status = status;
		this.reservDate = reservDate;
		this.createdAt = createdAt;
	}
    
    
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getSkiReservId() {
		return skiReservId;
	}
	public void setSkiReservId(int skiReservId) {
		this.skiReservId = skiReservId;
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
	public Date getReservDate() {
		return reservDate;
	}
	public void setReservDate(Date reservDate) {
		this.reservDate = reservDate;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}
