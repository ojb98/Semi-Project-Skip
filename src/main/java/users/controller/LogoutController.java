package users.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import users.dto.UsersDto;
import util.CookieUtil;

@WebServlet("/users/logout")
public class LogoutController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UsersDto user = (UsersDto)session.getAttribute("user");
		if (user.getSocial().equals("KAKAO")) {
			try {
				URL url = new URI("https://kapi.kakao.com/v1/user/logout").toURL();
				HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
				con.setRequestMethod("POST");
				con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
				con.setRequestProperty("Authorization", "Bearer " + session.getAttribute("access_token"));
				con.setDoOutput(true);
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				String input = "";
				while ((input = br.readLine()) != null) {
					System.out.print(input);
				}
			} catch (URISyntaxException use) {
				use.printStackTrace();
			}
		}
		
		// 자동 로그인을 위해 만든 JSESSIONID 쿠키를 삭제
		resp.addCookie(CookieUtil.createCookie("JSESSIONID", null, 0, "/"));
		
		// 세션 초기화(로그아웃)
		req.getSession().invalidate();
		resp.sendRedirect(req.getContextPath() + "/index.jsp");
	}
}
