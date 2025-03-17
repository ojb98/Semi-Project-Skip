package resort.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dao.ResortDao;
import resort.dto.FacilityListDTO;
import resort.dto.ResortDTO;
import resort.dto.RoomDTO;

@WebServlet("/facility/detail")
public class FacilityDetailController extends HttpServlet {
	private ResortDao rdao = ResortDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int resortId = Integer.parseInt(req.getParameter("resort_id"));
        
        List<FacilityListDTO> fdto=rdao.getfaciltyInfo(resortId);
        ResortDTO rdto = rdao.getInfo(resortId);
        
      	req.setAttribute("fdto", fdto);
      	req.setAttribute("rdto", rdto);

        req.getRequestDispatcher("/resort/facilityInfo.jsp").forward(req, resp);
    
	}
}
