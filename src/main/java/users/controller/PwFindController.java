package users.controller;

import java.io.IOException;

import javax.mail.MessagingException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import users.dao.UsersDao;
import users.dto.UsersDto;
import util.MailSender;

@WebServlet("/users/find/pw")
public class PwFindController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/users/find/pw.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String user_id = req.getParameter("user_id");
		UsersDao dao = UsersDao.getInstance();
		UsersDto user = dao.selectUserByEmailAndUser_id(email, user_id);
		if (user == null) {
			req.setAttribute("email", email);
			req.setAttribute("user_id", user_id);
			req.setAttribute("result", "가입된 아이디가 없습니다.");
			req.getRequestDispatcher("/users/find/id.jsp").forward(req, resp);
		} else {
			String subject = "[SKI:P] 임시 비밀번호입니다."; // 메일 제목
			String fromEmail = "kernel1913@gmail.com"; // 보내는 사람 이메일
			String fromUsername = "skip"; // 보내는 사람 이름
			
			String tmpPw = "";
			for (int i = 0; i < 10; i++) {
				int n = (int)(Math.random() * 2);
				if (n == 0) {
					tmpPw += (int)(Math.random() * 10);
				} else {
					tmpPw += (char)(Math.random() * 26 + 97);
				}
			}
			user.setPassword(tmpPw);
			dao.updatePassword(user);
			StringBuffer sb = new StringBuffer();
			sb.append("<h3>" + user_id +"님의 새로운 비밀번호입니다.</h3>");
			sb.append("<h2>" + tmpPw + "</h2>");
			sb.append("로그인 후에 비밀번호 변경해주세요.");
			try {
				MailSender.send(subject, fromEmail, fromUsername, email, sb.toString(), req.getServletContext().getRealPath("/WEB-INF/google_app.txt"));
				req.setAttribute("email", email);
				req.getRequestDispatcher("/users/find/idSent.jsp").forward(req, resp);
			} catch (MessagingException me) {
				me.printStackTrace();
				req.setAttribute("email", email);
				req.setAttribute("result", "가입된 아이디가 없습니다.");
				req.getRequestDispatcher("/users/find/id.jsp").forward(req, resp);
			}
		}
	}
}
