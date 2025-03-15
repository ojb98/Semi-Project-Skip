package users.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.Scanner;

import javax.net.ssl.HttpsURLConnection;

import org.apache.jasper.tagplugins.jstl.core.Url;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import users.dao.UsersDao;
import users.dto.UsersDto;

@WebServlet("/users/kakao/login")
public class KakaoLoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String code = req.getParameter("code");
		
		URL url1 = new URL("https://kauth.kakao.com/oauth/token");
		HttpsURLConnection con1 = (HttpsURLConnection)url1.openConnection();
		con1.setRequestMethod("POST");
		con1.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		con1.setDoOutput(true);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con1.getOutputStream(), "UTF-8"));
		bw.write("grant_type=authorization_code");
		bw.write("&client_id=19456d5f13cb8a11d9fd01e85a8e0c2a");
		bw.write("&redirect_uri=http://localhost:8081/Semi_Project_Skip/users/kakao/login");
		bw.write("&code=" + code);
		bw.flush();
		bw.close();
			
		BufferedReader br1 = new BufferedReader(new InputStreamReader(con1.getInputStream(), "UTF-8"));
		String input = "";
		StringBuilder sb = new StringBuilder();
		while ((input = br1.readLine()) != null) {
			sb.append(input);
		}
		JSONObject json = new JSONObject(sb.toString());
		String access_token = json.get("access_token").toString();
		
		URL url2 = new URL("https://kapi.kakao.com/v2/user/me");
		HttpsURLConnection con2 = (HttpsURLConnection)url2.openConnection();
		con2.setRequestProperty("Authorization", "Bearer " + access_token);
		con2.setDoOutput(true);
		
		BufferedReader br2 = new BufferedReader(new InputStreamReader(con2.getInputStream(), "UTF-8"));
		sb = new StringBuilder();
		while ((input = br2.readLine()) != null) {
			sb.append(input);
		}
		JSONObject kakao = new JSONObject(sb.toString());
		JSONObject kakao_account = (JSONObject)kakao.get("kakao_account");
		
		UsersDao dao = UsersDao.getInstance();
		String id = kakao.get("id").toString();
		String user_id = "kakao_" + id;
		UsersDto user = dao.selectUser(user_id, id);
		if (user == null) {
			String name = ((JSONObject)kakao_account.get("profile")).get("nickname").toString();
			String email = kakao_account.get("email").toString();
			String social = "KAKAO";
			String role = "USER";
			String status = "Y";
			user = new UsersDto(0, user_id, id, name, email, "", social, role, status, null);
			int n = dao.insert(user);
			if (n < 1) {
				req.setAttribute("result", "가입 실패");
				req.getRequestDispatcher("/users/result.jsp").forward(req, resp);
			}
		}
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		session.setAttribute("access_token", access_token);
		resp.sendRedirect(req.getContextPath() + "/index.jsp");
	}
}
