package resortAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dto.ResortDTO;
import resort.dto.ResortListDTO;
import resortAdmin.dao.ResortDao;

@WebServlet("/adminResort/list")
public class ResortListController extends HttpServlet{
	private ResortDao dao=ResortDao.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ResortListDTO> relist=dao.resortList();
		req.setAttribute("relist", relist);
		req.getRequestDispatcher("/resortAdmin/resortList.jsp").forward(req, resp);
	}
	
	
}