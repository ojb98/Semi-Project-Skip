package users.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/users/logout")
public class LogoutController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 자동 로그인을 위해 만든 JSESSIONID 쿠키를 삭제 하는 작업
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cookie: cookies) {
				if (cookie.getName().equals("JSESSIONID")) {
					Cookie delCookie = new Cookie("JSESSIONID", null);
					delCookie.setMaxAge(0);
					delCookie.setPath("/");
					resp.addCookie(delCookie);
				}
			}
		}
		
		// 세션 초기화(로그아웃)
		req.getSession().invalidate();
	}
}
