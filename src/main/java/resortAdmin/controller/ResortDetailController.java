package resortAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dto.ResortDTO;
import resortAdmin.dao.ResortDao;

@WebServlet("/adminResort/detail")
public class ResortDetailController extends HttpServlet{
	private ResortDao rdao = ResortDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int resortId = Integer.parseInt(req.getParameter("resort_id"));
        
        ResortDTO rdto = rdao.getInfo(resortId);

        req.setAttribute("rdto", rdto);
		
        req.getRequestDispatcher("/resortAdmin/resortInfo.jsp").forward(req, resp);
		
	}
}