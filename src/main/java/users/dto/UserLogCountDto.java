package users.dto;

import java.sql.Date;

public class UserLogCountDto {
	private Date log_date;
	private int log_count;
	private int unique_log_count;
	
	public UserLogCountDto() {
		
	}

	public UserLogCountDto(Date log_date, int log_count, int unique_log_count) {
		super();
		this.log_date = log_date;
		this.log_count = log_count;
		this.unique_log_count = unique_log_count;
	}

	public Date getLog_date() {
		return log_date;
	}

	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}

	public int getLog_count() {
		return log_count;
	}

	public void setLog_count(int log_count) {
		this.log_count = log_count;
	}

	public int getUnique_log_count() {
		return unique_log_count;
	}

	public void setUnique_log_count(int unique_log_count) {
		this.unique_log_count = unique_log_count;
	}
}
