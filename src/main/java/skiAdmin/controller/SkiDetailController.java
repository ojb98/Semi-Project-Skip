package skiAdmin.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ski.dto.SkiDTO;
import skiAdmin.dao.SkiDao;

@WebServlet("/adminSki/detail")
public class SkiDetailController extends HttpServlet {
	private SkiDao sdao=SkiDao.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int skiId=Integer.parseInt(req.getParameter("ski_id"));
		
		SkiDTO skdto=sdao.getSkiId(skiId);
		
		req.setAttribute("skdto", skdto);
		
		req.getRequestDispatcher("/skiAdmin/skiInfo.jsp").forward(req, resp);
		
	}
	
	
	
}
