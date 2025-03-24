package rentalAdmin.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rental.dto.RentalShopDTO;
import rentalAdmin.dao.RentalShopDao;

@WebServlet("/adminRental/detail")
public class RentalShopDetailController extends HttpServlet{
	private RentalShopDao rsdao=RentalShopDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//rentalshop_id로 해당 데이터 가져오기
		int rentalId=Integer.parseInt(req.getParameter("rentalshop_id"));
		
		RentalShopDTO rsdto=rsdao.getRentalId(rentalId);
		
		req.setAttribute("rsdto", rsdto);
		
		req.getRequestDispatcher("/rentalAdmin/rentalShopInfo.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
