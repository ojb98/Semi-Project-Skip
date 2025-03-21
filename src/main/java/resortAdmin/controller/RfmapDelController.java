package resortAdmin.controller;

import java.io.IOException;
import java.util.HashMap;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resortAdmin.dao.FacilityDao;

@WebServlet("/adminRfmap/delete")
public class RfmapDelController extends HttpServlet{
	private static final int SUCCESS_THRESHOLD = 0;
	private FacilityDao fdao=FacilityDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int resortId=Integer.parseInt(req.getParameter("resort_id"));
		int typeId=Integer.parseInt(req.getParameter("type_id"));
		
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("resortId",resortId);
		map.put("typeId",typeId);
		
		
		
		int n=fdao.mapDelete(map);
		
		if(n > SUCCESS_THRESHOLD) {
			System.out.println("시설매핑 삭제완료");
		}else {
			System.out.println("시설매핑 삭제실패");
		}
		
		resp.sendRedirect(req.getContextPath()+"/adminResort/detail?resort_id=" + resortId);
	}
}