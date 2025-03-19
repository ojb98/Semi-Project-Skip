package mypage.controller;

import java.io.IOException;
import java.util.HashMap;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import review.dao.ReviewsDao;
import users.dto.UsersDto;
import util.PageUtil;

@WebServlet("/mypage/reviews")
public class ReviewListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pageNum = (req.getParameter("pageNum") == null) ? 1 : Integer.parseInt(req.getParameter("pageNum"));
		String category = req.getParameter("category");
		String rating = req.getParameter("rating");
		String year = req.getParameter("year");
		ReviewsDao dao = ReviewsDao.getInstance();
		HashMap<String, Object> map = new HashMap<String, Object>();
		UsersDto user = (UsersDto)(req.getSession().getAttribute("user"));
		map.put("uuid", user.getUuid());
		map.put("category", category);
		map.put("rating", rating);
		map.put("year", year);
		PageUtil pageUtil = new PageUtil(pageNum, dao.getCount(map), 4);
		map.put("startRow", pageUtil.getStartRow());
		map.put("endRow", pageUtil.getEndRow());
		req.setAttribute("list", dao.list(map));
		req.setAttribute("startPage", pageUtil.getStartPage());
		req.setAttribute("pageCount", pageUtil.getPageCount());
		req.setAttribute("endPage", pageUtil.getEndPage());
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("category", category);
		req.setAttribute("rating", rating);
		req.setAttribute("content", "reviews");
		req.getRequestDispatcher("/mypage/layout.jsp").forward(req, resp);
	}
}
