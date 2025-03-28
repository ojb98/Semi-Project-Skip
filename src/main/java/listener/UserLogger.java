package listener;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSessionBindingEvent;
import jakarta.servlet.http.HttpSessionBindingListener;
import users.dao.UserLogDao;

public class UserLogger implements HttpSessionBindingListener {
	private String addr;
	
	public UserLogger() {
		
	}
	
	public UserLogger(HttpServletRequest req) {
		addr = req.getRemoteAddr();
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		if (event.getSession().isNew()) {
			UserLogDao.getInstance().insertLog(addr);
		}
	}
}
