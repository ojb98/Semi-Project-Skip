package listener;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import users.dao.UserLogDao;

@WebListener
public class UserCounter implements HttpSessionListener {
	private static int count = 0;
	
	public static int getCount() {
		return count;
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		if (se.getSession().isNew()) {
			count++;
		}
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		count--;
		count = (count < 0) ? 0 : count;
	}
}
