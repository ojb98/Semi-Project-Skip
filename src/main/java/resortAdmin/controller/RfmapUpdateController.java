package resortAdmin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dto.FacilitiesDTO;
import resortAdmin.dao.FacilityDao;

@WebServlet("/adminRfmap/update")
public class RfmapUpdateController extends HttpServlet{
	private  FacilityDao fdao = FacilityDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int resortId = Integer.parseInt(req.getParameter("resort_id"));
        int typeId = Integer.parseInt(req.getParameter("type_id"));
        
        
        //해당 시설유형이름 조회
        String facilityName=fdao.getFacilityType(typeId);
        
        //해당 시설유형에 속한 전체 시설 조회
        List<FacilitiesDTO> facilities = fdao.getFacilities(typeId);
        
        //해당 리조트에 이미 등록된 facility_id 조회(해당 시설유형 한정)
        HashMap<String, Object> map = new HashMap<>();
        map.put("resortId", resortId);
        map.put("typeId", typeId);
        List<Integer> facilityIdsByType = fdao.getFacilityIdsByType(map);
        
        
        req.setAttribute("resort_id", resortId);
        req.setAttribute("type_id", typeId);
        req.setAttribute("facilityName", facilityName);
        req.setAttribute("facilities", facilities);
        req.setAttribute("facilityIdsByType", facilityIdsByType);
		        
		req.getRequestDispatcher("/resortAdmin/rfmapUpdate.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int resortId = Integer.parseInt(req.getParameter("resort_id"));
        int typeId = Integer.parseInt(req.getParameter("type_id"));
        
        //체크박스에 체크한 facility_id 배열 가져오기
        String[] facilityIdsStr = req.getParameterValues("facility_id");
        
        List<Integer> newFacilityIds = new ArrayList<>();
        if (facilityIdsStr != null) {
            newFacilityIds = Arrays.stream(facilityIdsStr)
                    .map(fstr -> Integer.parseInt(fstr))
                    .collect(Collectors.toList());
        }
        
        
        //기존 해당 매핑 삭제 후 새 매핑 삽입
        fdao.mapUpdate(resortId, typeId, newFacilityIds);
        
        resp.sendRedirect(req.getContextPath() + "/adminResort/detail?resort_id=" + resortId);
    
	}
}
