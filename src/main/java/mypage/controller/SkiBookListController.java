package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
import users.dao.UsersDao;
import users.dto.UsersDto;
import util.PageUtil;

@WebServlet("/mypage/bookings/ski")
public class SkiBookListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pageNum = (req.getParameter("pageNum") == null) ? 1 : Integer.parseInt(req.getParameter("pageNum"));
		String year = req.getParameter("year");
		UsersDto user = (UsersDto)req.getSession().getAttribute("user");
		HashMap<String, Object> map = new HashMap<>();
		map.put("year", year);
		map.put("uuid", user.getUuid());
		SkiReservationDao dao = SkiReservationDao.getInstance();
		PageUtil pageUtil = new PageUtil(pageNum, dao.getCount(map), 3);
		map.put("startRow", pageUtil.getStartRow());
		map.put("endRow", pageUtil.getEndRow());
		List<SkiReservationListDto> list = SkiReservationDao.getInstance().selectByUuid(map);
		req.setAttribute("list", list);
		req.setAttribute("startPage", pageUtil.getStartPage());
		req.setAttribute("pageCount", pageUtil.getPageCount());
		req.setAttribute("endPage", pageUtil.getEndPage());
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("year", year);
		req.setAttribute("content", "skiBookings");
		req.getRequestDispatcher("/mypage/layout.jsp").forward(req, resp);
	}
}
