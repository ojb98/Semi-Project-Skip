package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ski.dao.SkiDao;

@WebServlet("/search")
public class SearchController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String keyword = req.getParameter("keyword");
		SkiDao dao = new SkiDao();
		req.setAttribute("list", dao.getUnionListByName(keyword));
		req.setAttribute("keyword", keyword);
		req.getRequestDispatcher("/searchList.jsp").forward(req, resp);
	}
}
