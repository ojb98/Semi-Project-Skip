package users.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import users.dao.UsersDao;
import users.dto.UsersDto;

@WebServlet("/users/login")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cookie: cookies) {
				if (cookie.getName().equals("user_id")) {
					HttpSession session = req.getSession();
					session.setAttribute("user_id", cookie.getValue());
					session.setAttribute("save", "save");
					break;
				}
			}
		}
		
		// 로그인 폼 페이지 보여주기
		resp.sendRedirect(req.getContextPath() + "/users/login.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 폼 받기
		String user_id = req.getParameter("user_id");
		String password = req.getParameter("password");
		String auto = req.getParameter("auto");
		String save = req.getParameter("save");
		UsersDto user = UsersDao.getInstance().selectUser(user_id, password);
		if (user != null && user.getStatus().equals("Y")) {
			// 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			if (auto != null) {
				// 자동 로그인
				// JSESSIONID에 현재 세션 id를 넣어주면 브라우저가 종료되도 session을 유지할 수 있다.
				Cookie cookie = new Cookie("JSESSIONID", session.getId());
				cookie.setMaxAge(60 * 60 * 24 * 30);
				cookie.setPath("/");
				resp.addCookie(cookie);
			} else {
				// 쿠키 초기화
				Cookie cookie = new Cookie("JSESSIONID", null);
				cookie.setMaxAge(0);
				cookie.setPath("/");
				resp.addCookie(cookie);
			}
			if (save != null) {
				// 아이디 저장
				Cookie cookie = new Cookie("user_id", user_id);
				cookie.setMaxAge(60 * 60 * 24 * 30);
				cookie.setPath("/");
				resp.addCookie(cookie);
			} else {
				// 쿠키 초기화
				Cookie cookie = new Cookie("user_id", null);
				cookie.setMaxAge(0);
				cookie.setPath("/");
				resp.addCookie(cookie);
			}
			resp.sendRedirect(req.getContextPath() + "/");
		} else {
			// 로그인 실패
			req.setAttribute("user_id", user_id);
			req.setAttribute("password", password);
			req.setAttribute("auto", auto);
			req.setAttribute("save", save);
			req.setAttribute("err", "아이디 또는 비밀번호가 틀렸습니다.");
			req.getRequestDispatcher("/users/login.jsp").forward(req, resp);
		}
	}
}
