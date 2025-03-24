package util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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

public class MailSender {
	private static Properties properties;
	private static final String smtpEmail = "kernel1913@gmail.com";
	static int count = 0;
	
	static {
		properties = new Properties();
		properties.put("mail.transport.protocol", "smtp"); // 프로토콜 설정
		properties.put("mail.smtp.host", "smtp.gmail.com"); // gmail 사용
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.quitwait", "false");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.socketFactory.fallback", "true");
		properties.put("mail.smtp.starttls.enable", "true");
	}
	
	public static void send(String subject, String fromEmail, String fromUsername, String toEmail, String content, String path) throws MessagingException, UnsupportedEncodingException {
		String app = "";
		try (FileReader fr = new FileReader(path)) {
			while (fr.ready()) {
				app += (char)fr.read();
			}
		} catch (FileNotFoundException fnfe) {
			fnfe.printStackTrace();
		} catch (IOException ie) {
			ie.printStackTrace();
		}
		
		Session session = Session.getDefaultInstance(properties);
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress(fromEmail, fromUsername));
		message.addRecipient(RecipientType.TO, new InternetAddress(toEmail));
		message.setSubject(subject);
		
		Multipart part = new MimeMultipart();
		MimeBodyPart bodyPart = new MimeBodyPart();
		
		bodyPart.setText(content, "UTF-8", "html");
		part.addBodyPart(bodyPart);
		message.setContent(part);
		
		Transport transport = session.getTransport("smtp");
		transport.connect(smtpEmail, app);
		transport.sendMessage(message, message.getAllRecipients());
		transport.close();
	}
}
