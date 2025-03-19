package users.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import users.dao.UsersDao;
import users.dto.UsersDto;

@WebServlet("/users/signup")
public class SignupController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/users/signup.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_id = req.getParameter("user_id");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String name = req.getParameter("name");
		int n = UsersDao.getInstance().insert(new UsersDto(0, user_id, password, name, email, phone, "NORMAL", "USER", "Y", null));
		if (n > 0) {
			resp.sendRedirect(req.getContextPath() + "/users/login");
		} else {
			req.getRequestDispatcher("/users/signup.jsp").forward(req, resp);
		}
	}
}
