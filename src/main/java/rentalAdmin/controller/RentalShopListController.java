package rentalAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import rental.dto.RentalShopDTO;
import rental.dto.RentalShopListDTO;
import rentalAdmin.dao.RentalShopDao;
import users.dto.UsersDto;

@WebServlet("/adminRental/list")
public class RentalShopListController extends HttpServlet{
	private RentalShopDao rsdao=RentalShopDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//현재 로그인 유저정보를 얻어와서 uuid 값을 가져온다
		HttpSession session=req.getSession();
		UsersDto user=(UsersDto)session.getAttribute("user");
		int uuid=user.getUuid();
		
		List<RentalShopListDTO> rslist=rsdao.rentalList(uuid);
		
		req.setAttribute("rslist", rslist);
		System.out.println("렌탈샵 리스트: "+rslist);
		
		req.getRequestDispatcher("/rentalAdmin/rentalShopList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
