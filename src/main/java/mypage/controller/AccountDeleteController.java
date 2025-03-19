package mypage.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import org.eclipse.tags.shaded.org.apache.xml.utils.URI;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import users.dao.UsersDao;
import users.dto.UsersDto;

@WebServlet("/mypage/account/delete")
public class AccountDeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UsersDto user = (UsersDto)session.getAttribute("user");
		if (user.getSocial().equals("NORMAL")) {
			req.setAttribute("content", "delete");
			req.getRequestDispatcher("/mypage/layout.jsp").forward(req, resp);
		} else {
			URL url = new URL("https://kapi.kakao.com/v1/user/unlink");
			HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setRequestProperty("Authorization", "Bearer " + session.getAttribute("access_token"));
			con.setDoOutput(true);
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String input = "";
			StringBuilder sb = new StringBuilder();
			while ((input = br.readLine()) != null) {
				sb.append(input);
			}
			System.out.println(sb.toString());
			UsersDao.getInstance().deleteUser(user.getUuid());
			session.invalidate();
			resp.sendRedirect(req.getContextPath());
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String password = req.getParameter("password");
		HttpSession session = req.getSession();
		UsersDto user = (UsersDto)session.getAttribute("user");
		if (password.equals(user.getPassword())) {
			UsersDao.getInstance().deleteUser(user.getUuid());
			session.invalidate();
			resp.sendRedirect(req.getContextPath());
		} else {
			req.setAttribute("err", "비밀번호가 틀렸습니다.");
			req.setAttribute("content", "delete");
			req.getRequestDispatcher("/mypage/layout.jsp").forward(req, resp);
		}
	}
}
