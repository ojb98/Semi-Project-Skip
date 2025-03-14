package users.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.CookieUtil;

@WebServlet("/users/logout")
public class LogoutController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 자동 로그인을 위해 만든 JSESSIONID 쿠키를 삭제
		resp.addCookie(CookieUtil.createCookie("JSESSIONID", null, 0, "/"));
		
		// 세션 초기화(로그아웃)
		req.getSession().invalidate();
		resp.sendRedirect(req.getContextPath() + "/index.jsp");
	}
}
