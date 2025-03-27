package controller;

import java.io.IOException;
import java.util.HashMap;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ski.dao.SkiDao;
import util.PageUtil;

@WebServlet("/search")
public class SearchController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pageNum = (req.getParameter("pageNum") == null) ? 1 : Integer.parseInt(req.getParameter("pageNum"));
		String keyword = req.getParameter("keyword");
		SkiDao dao = new SkiDao();
		req.setAttribute("list", dao.getUnionListByName(keyword));
		req.setAttribute("keyword", keyword);
		req.getRequestDispatcher("/searchList.jsp").forward(req, resp);
	}
}
