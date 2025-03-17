package users.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;

import org.json.JSONObject;

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
		resp.sendRedirect(req.getContextPath() + "/users/findIdOrPw.jsp#pw_find");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String user_id = req.getParameter("user_id");
		UsersDao dao = UsersDao.getInstance();
		UsersDto user = dao.selectUserByEmailAndUser_id(email, user_id);

		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		JSONObject json = new JSONObject();
		if (user == null) {
			json.put("exists", false);
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
			sb.append("로그인 후에 꼭 비밀번호를 변경해주세요!");
			try {
				MailSender.send(subject, fromEmail, fromUsername, email, sb.toString(), req.getServletContext().getRealPath("/WEB-INF/google_app.txt"));
				json.put("exists", true);
			} catch (MessagingException me) {
				me.printStackTrace();
				json.put("exists", false);
				pw.print(json);
				pw.close();
			}
		}
		pw.print(json);
		pw.close();
	}
}
