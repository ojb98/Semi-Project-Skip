package resortAdmin.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dto.FacilitiesDTO;
import resortAdmin.dao.FacilityDao;


@WebServlet("/adminFacility/insert")
public class FacilityInsertController extends HttpServlet{
	private static final int SUCCESS_THRESHOLD = 0;
	private FacilityDao facilityDao =FacilityDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/resortAdmin/facilityInsertForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int type_id=Integer.parseInt(req.getParameter("type_id"));
		String facility_name=req.getParameter("facility_name").trim();
		
		
		//중복체크
        if (facilityDao.isFacilityNameExists(facility_name)) {
            resp.sendRedirect(req.getContextPath() + "/resortAdmin/facilityInsertForm.jsp");
            return;
        }

		FacilitiesDTO dto=new FacilitiesDTO(0,type_id,facility_name);
	
		int n=facilityDao.insert(dto);
		
		if(n>SUCCESS_THRESHOLD) {
			System.out.println(n+"의 등록성공");
		}else {
			System.out.println("등록실패");
		}
	
		resp.sendRedirect(req.getContextPath()+"/resortAdmin/resortAdminMain.jsp");
	}

}
