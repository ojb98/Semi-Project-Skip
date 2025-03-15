package users.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import users.dao.UsersDao;
import users.dto.UsersDto;
import util.MailSender;

@WebServlet("/users/find/id")
public class IdFindController extends HttpServlet {	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/users/findIdOrPw.jsp#id_find");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		List<UsersDto> users = UsersDao.getInstance().selectUserByEmail(email);

		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		JSONObject json = new JSONObject();
		if (users == null) {
			json.put("exists", false);
		} else {
			String subject = "[SKI:P] 가입된 아이디 목록입니다."; // 메일 제목
			String fromEmail = "kernel1913@gmail.com"; // 보내는 사람 이메일
			String fromUsername = "skip"; // 보내는 사람 이름
			
			StringBuffer sb = new StringBuffer();
			sb.append("<h3>가입된 아이디</h3>");
			for (int i = 0; i < users.size(); i++) {
				sb.append(users.get(i).getUser_id() + "\n");
			}
			try {
				MailSender.send(subject, fromEmail, fromUsername, email, sb.toString(), req.getServletContext().getRealPath("/WEB-INF/google_app.txt"));
				json.put("exists", true);
			} catch (MessagingException me) {
				me.printStackTrace();
				json.put("exists", false);
				pw.print(json.toString());
				pw.close();
			}
		}
		pw.print(json);
		pw.close();
	}
}
