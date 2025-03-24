package users.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
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
import users.dto.UsersDto;
import util.MailSender;

@WebServlet("/users/email/verify")
public class EmailVerifyController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		String subject = "[SKI:P] 이메일 인증 메일입니다."; // 메일 제목
		String fromEmail = "kernel1913@gmail.com"; // 보내는 사람 이메일
		String fromUsername = "skip"; // 보내는 사람 이름
		String toEmail = req.getParameter("email"); // 받는 사람 이메일
		
		String verificationCode = "";
		for (int i = 0; i < 6; i++) {
			int n = (int)(Math.random() * 10);
			verificationCode += n;
		}
		
		StringBuffer sb = new StringBuffer();
		sb.append("<h3>[SKI:P] 가입을 환영합니다.</h3>");
		sb.append("<h2>인증번호: " + verificationCode + "</h2>");
		sb.append("<h3>위 인증번호를 입력해주세요.</h3>");
		
		PrintWriter pw = resp.getWriter();
		try {
			MailSender.send(subject, fromEmail, fromUsername, toEmail, sb.toString(), req.getServletContext().getRealPath("/WEB-INF/google_app.txt"));
			
			JSONObject json = new JSONObject();
			json.put("verificationCode", verificationCode);
			pw.print(json.toString());
			pw.close();
		} catch (MessagingException me) {
			me.printStackTrace();
			resp.setStatus(500);
			pw.print(me.getMessage());
			pw.close();
		}
	}
}
