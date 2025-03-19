package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("JSESSIONID")) {
                    Cookie delCookie = new Cookie("JSESSIONID", null);
                    delCookie.setMaxAge(0);  // 즉시 만료
                    delCookie.setPath("/");  // 전체 경로에 대해 삭제
                    resp.addCookie(delCookie);
                }
                if (cookie.getName().equals("user_id")) {
                    Cookie delCookie = new Cookie("user_id", null);
                    delCookie.setMaxAge(0);  // 즉시 만료
                    delCookie.setPath("/");  // 전체 경로에 대해 삭제
                    resp.addCookie(delCookie);  // 쿠키 삭제
                }
            }
        }

        // 세션 초기화(로그아웃)
        req.getSession().invalidate();
        resp.sendRedirect("/rental/index.jsp");
    }
}
