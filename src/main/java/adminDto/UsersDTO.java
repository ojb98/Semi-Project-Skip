package adminDto;
import java.util.Date;

public class UsersDTO {
	private String uuid;
    private String userid;
    private String email;
    private String password;
    private String name;
    private String phone;
    private String role;
    private String social;
    private String status;
    private Date regdate;

    public UsersDTO() {}
    
    public UsersDTO(String userid, String name, String role, Date regdate) {
		super();
		this.userid = userid;
		this.name = name;
		this.role = role;
		this.regdate = regdate;
	}
    
    public UsersDTO(String userid, String email, String password, String name, String phone,String social, String role,
			String status, Date regdate) {
		super();
		this.userid = userid;
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.social = social;
		this.role = role;
		this.status = status;		
		this.regdate = regdate;
	}
    
	public String getSocial() {
		return social;
	}
	public void setSocial(String social) {
		this.social = social;
	}
	public String getUser_id() {
		return userid;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public void setUser_id(String userid) {
		this.userid = userid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
    
}
