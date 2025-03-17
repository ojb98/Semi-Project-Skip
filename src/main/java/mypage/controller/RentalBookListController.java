package mypage.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rental.dao.RentalReservationDao;
import rental.dto.RentalReservationListDto;
import users.dto.UsersDto;

@WebServlet("/mypage/bookings/rental")
public class RentalBookListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UsersDto user = (UsersDto)req.getSession().getAttribute("user");
		List<RentalReservationListDto> list = RentalReservationDao.getInstance().selectByUuid(user.getUuid());
		req.setAttribute("list", list);
		req.setAttribute("content", "rentalBookings");
		req.getRequestDispatcher("/mypage/layout.jsp").forward(req, resp);
	}
}
