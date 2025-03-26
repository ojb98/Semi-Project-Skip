package skiAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ski.dto.SkiDTO;
import ski.dto.SkiListDTO;
import skiAdmin.dao.SkiDao;
import users.dao.UsersDao;

@WebServlet("/adminSki/list")
public class SkiListController extends HttpServlet{
	private SkiDao skdao=SkiDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<SkiListDTO> list=skdao.skiList();

		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/skiAdmin/skiList.jsp").forward(req, resp);
	}
	
	
}
