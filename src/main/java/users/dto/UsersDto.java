package users.dto;

import java.sql.Date;

public class UsersDto {
	private int uuid; // 유저 기본키
	private String user_id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String social;
	private String role;
	private String status;
	private Date date;
	
	public UsersDto() {
		
	}

	public UsersDto(int uuid, String user_id, String password, String name, String email, String phone,
			String social, String role, String status, Date date) {
		super();
		this.uuid = uuid;
		this.user_id = user_id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.social = social;
		this.role = role;
		this.status = status;
		this.date = date;
	}

	public int getUuid() {
		return uuid;
	}

	public void setUuid(int uuid) {
		this.uuid = uuid;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSocial() {
		return social;
	}

	public void setSocial(String social) {
		this.social = social;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
