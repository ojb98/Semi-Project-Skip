package rentalAdmin.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rentalAdmin.dao.RentalShopDao;

@WebServlet("/admin/phoneCheckAll")
public class AdminPhoneCheckController extends HttpServlet {
	private RentalShopDao dao=RentalShopDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String phone=req.getParameter("phone");
		System.out.println("얻어온 전화번호:" + phone);
		
		boolean result=dao.isPhoneCheck(phone);
		System.out.println("전화번호 중복 체크 boolean :"+result);
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write("{\"isCheck\": " + result + "}");
	}
}
