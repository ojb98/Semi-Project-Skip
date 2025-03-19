package resortAdmin.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resortAdmin.dao.FacilityDao;


@WebServlet("/adminFacility/delete")
public class FacilityDelController extends HttpServlet{
	private static final int SUCCESS_THRESHOLD = 0;
	private FacilityDao facilityDao =FacilityDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int facilityId=Integer.parseInt(req.getParameter("facility_id"));
		
		int n=facilityDao.delete(facilityId);
		
		if(n>SUCCESS_THRESHOLD) {
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제실패");
		}
		
		resp.sendRedirect(req.getContextPath()+"/adminFacility/list");
	}
	
}