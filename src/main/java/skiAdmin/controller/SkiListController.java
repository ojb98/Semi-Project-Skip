package skiAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ski.dto.SkiDTO;
import skiAdmin.dao.SkiDao;

@WebServlet("/adminSki/list")
public class SkiListController extends HttpServlet{
	private SkiDao dao=SkiDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<SkiDTO> list=dao.skiList();
		
		req.setAttribute("list", list);

		req.getRequestDispatcher("/skiAdmin/skiList.jsp").forward(req, resp);
	}
	
	
}
