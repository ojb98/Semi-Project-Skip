package mypage.controller;

import java.io.IOException;
import java.util.HashMap;

import users.dto.UsersDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import users.dao.UsersDao;

@WebServlet("/mypage/info")
public class InfoController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("content", "info");
		req.getRequestDispatcher("/mypage/layout.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 정보 변경
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		
		HashMap<String, Object> map = new HashMap<>();
		HttpSession session = req.getSession();
		UsersDto user = (UsersDto)session.getAttribute("user");
		map.put("uuid", user.getUuid());
		map.put("password", password);
		map.put("name", name);
		map.put("phone", phone);
		UsersDao.getInstance().updateUser(map);
		user.setPassword(password);
		user.setName(name);
		user.setPhone(phone);
		session.setAttribute("user", user);
		resp.sendRedirect(req.getContextPath() + "/mypage/info");
	}
}
