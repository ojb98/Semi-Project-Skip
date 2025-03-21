package resortAdmin.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dto.FacilityListDTO;
import resortAdmin.dao.FacilityDao;


@WebServlet("/adminFacility/list")
public class FacilityListController extends HttpServlet{
	private FacilityDao facilityDao =FacilityDao.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//요청된 시설 유형 가져오기(없으면 all로 설정)
		String facilityType = req.getParameter("facilityType");
        if (facilityType == null || facilityType.isEmpty()) {
            facilityType = "all";  //기본값: 전체 조회
        }
		

		List<FacilityListDTO> flist=facilityDao.listAll();
		
		//중복없는 시설유형이름 리스트 조회
        List<String> uniqueTypes = facilityDao.getTypes();
        
        
        //선택된 유형이 all이 아니면 필터링
        if (!"all".equals(facilityType)) {
            Iterator<FacilityListDTO> iterator = flist.iterator();
            while (iterator.hasNext()) {
                FacilityListDTO facility = iterator.next();
                //선택된 facilityType과 일치하지 않는 시설을 remove()로 삭제
                if (!facility.getType_name().equals(facilityType)) {
                    iterator.remove();
                }
            }
        }
		
		req.setAttribute("flist",flist);
		req.setAttribute("uniqueTypes",uniqueTypes);
		req.setAttribute("facilityType",facilityType);
		
		req.getRequestDispatcher("/resortAdmin/facilityList.jsp").forward(req, resp);
	}
	
	
}