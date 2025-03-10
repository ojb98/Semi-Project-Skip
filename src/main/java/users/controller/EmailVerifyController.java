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

@WebServlet("/users/email/verify")
public class EmailVerifyController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		String subject = "[SKI:P] 이메일 인증 메일입니다."; // 메일 제목
		String fromEmail = "kernel1913@gmail.com"; // 보내는 사람 이메일
		String fromUsername = "skip"; // 보내는 사람 이름
		String toEmail = req.getParameter("email"); // 받는 사람 이메일
		
		final String smtpEmail = "kernel1913@gmail.com";
		final String password = "vaew ccdj lnzi xzxe";
		
		Properties properties = new Properties();
		properties.put("mail.transport.protocol", "smtp"); // 프로토콜 설정
		properties.put("mail.smtp.host", "smtp.gmail.com"); // gmail 사용
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.quitwait", "false");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.socketFactory.fallback", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		PrintWriter pw = resp.getWriter();
		try {
			Session session = Session.getDefaultInstance(properties);
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail, fromUsername));
			message.addRecipient(RecipientType.TO, new InternetAddress(toEmail));
			message.setSubject(subject);
			
			Multipart part = new MimeMultipart();
			MimeBodyPart bodyPart = new MimeBodyPart();
			
			String verificationCode = "";
			for (int i = 0; i < 6; i++) {
				int n = (int)(Math.random() * 10);
				verificationCode += n;
			}
			
			StringBuffer sb = new StringBuffer();
			sb.append("<h3>[SKI:P] 가입을 환영합니다.</h3>");
			sb.append("<h2>인증번호: " + verificationCode + "</h2>");
			sb.append("<h3>위 인증번호를 입력해주세요.</h3>");
			
			bodyPart.setText(sb.toString(), "UTF-8", "html");
			part.addBodyPart(bodyPart);
			message.setContent(part);
			
			Transport transport = session.getTransport("smtp");
			transport.connect(smtpEmail, password);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			
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
