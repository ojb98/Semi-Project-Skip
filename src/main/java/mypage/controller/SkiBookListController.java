package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ski.dao.SkiReservationDao;
import ski.dto.SkiReservationListDto;
import users.dto.UsersDto;

@WebServlet("/mypage/bookings/ski")
public class SkiBookListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UsersDto user = (UsersDto)req.getSession().getAttribute("user");
		List<SkiReservationListDto> list = SkiReservationDao.getInstance().selectByUuid(user.getUuid());
		req.setAttribute("list", SkiReservationDao.getInstance().selectByUuid(user.getUuid()));
		req.setAttribute("navTab", MypageContent.SKI_BOOKINGS.getTabName());
		req.setAttribute("content", MypageContent.SKI_BOOKINGS.getFileName());
		req.getRequestDispatcher("/mypage/layout.jsp").forward(req, resp);
	}
}
