package resortAdmin.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resortAdmin.dao.FacilityDao;


@WebServlet("/adminFacility/check")
public class FacilityCheckController extends HttpServlet {
	private FacilityDao facilityDao = FacilityDao.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String facilityName = req.getParameter("facility_name");
        boolean exists=facilityDao.isFacilityNameExists(facilityName);

        resp.setContentType("text/plain");
        resp.getWriter().write(String.valueOf(exists)); // true or false 반환
	}
}