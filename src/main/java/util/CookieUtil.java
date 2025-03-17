package util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CookieUtil {
	public static final int MONTH_BY_SECONDS = 60 * 60 * 24 * 30;
	
	public static Cookie getCookie(String name, HttpServletRequest fromReq) {
		Cookie[] cookies = fromReq.getCookies();
		if (cookies != null) {
			for (Cookie cookie: cookies) {
				if (cookie.getName().equals(name)) {
					return cookie;
				}
			}
		}
		return null;
	}
	
	public static Cookie createCookie(String name, String value, int maxAge, String path) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		cookie.setPath(path);
		return cookie;
	}
}
