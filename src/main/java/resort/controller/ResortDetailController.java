package resort.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dao.ResortDao;
import resort.dao.RoomDao;
import resort.dto.FacilityListDTO;
import resort.dto.ResortDTO;
import resort.dto.RoomDTO;

@WebServlet("/resort/detail")
public class ResortDetailController extends HttpServlet{
	private ResortDao rdao = ResortDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		int resortId=Integer.parseInt(req.getParameter("resort_id"));
//		
//		//싱글톤 dao가져오기
//		ResortDao rdao=ResortDao.getInstance();
//		RoomDao rmdao=RoomDao.getInstance();
//		
//		ResortDTO rdto=rdao.getInfo(resortId);
//		
//		//리조트 추가설명 얻어와서 줄바꿈 적용해주고 다시 저장
//		String description=rdto.getDescription();
//		description=description.replace("\r\n", "<br>");
//		rdto.setDescription(description);
//		
//		//시설유형 + 시설 + 리조트-시설 조인 원하는 정보 가져오기
//		List<FacilityListDTO> fdto=rdao.getfaciltyInfo(resortId);
//		List<RoomDTO> rmdto=rmdao.getInfo(resortId);
//		
//		System.out.println("rdto:"+rdto);
//		System.out.println("fdto:"+fdto);	
//		System.out.println("rmdto:"+rmdto);
//
//		
//		req.setAttribute("rdto", rdto);
//		req.setAttribute("fdto", fdto);
//		req.setAttribute("rmdto", rmdto);
//		req.getRequestDispatcher("/resort/resortDetail.jsp").forward(req, resp);
//		
		
		int resortId = Integer.parseInt(req.getParameter("resort_id"));
        
        ResortDTO rdto = rdao.getInfo(resortId);

        req.setAttribute("rdto", rdto);
		
        req.getRequestDispatcher("/resort/resortInfo.jsp").forward(req, resp);
		
	}
}
