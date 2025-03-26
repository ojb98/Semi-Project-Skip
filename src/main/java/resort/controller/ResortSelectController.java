package resort.controller;

import resort.dao.*;
import resort.dto.FacilitiesDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.FacilityTypeUtil;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/rental/resort")
public class ResortSelectController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			final int resort_id = Integer.parseInt(req.getParameter("resort_id"));

			ResortDao resortDao = new ResortDao();
			RoomDao roomDao = new RoomDao();
			ResortReviewDao resortReviewDao = new ResortReviewDao();

			ResortFacilityMapDao resortFacilityMapDao = new ResortFacilityMapDao();
			FacilityDao facilityDao = new FacilityDao();
			List<Integer> facility_ids = resortFacilityMapDao.getFacilitiesByResortId(resort_id);
			List<Map<String, String>> resortList = new ArrayList<>();

			if (!facility_ids.isEmpty()) {
				for (Integer facility_id : facility_ids) {
					Map<String, String> facilityMap = new HashMap<>();
					FacilitiesDTO facilitiesDTO = facilityDao.getFacilityByFacility(facility_id);
					if (facilitiesDTO != null) {
						facilityMap.put("name", facilitiesDTO.getFacility_name());
						facilityMap.put("icon", FacilityTypeUtil.getById(facilitiesDTO.getType_id()).getIcon());
					} else { // facilitiesDTO가 null일 경우 기본값 설정
						facilityMap.put("name", "기본 시설");
						facilityMap.put("icon", "fa-solid fa-face-smile");
					}
					resortList.add(facilityMap);
				}
				req.setAttribute("resortList", resortList);
			}

			req.setAttribute("resortDTO", resortDao.getResortById(resort_id));
			req.setAttribute("minPrice", roomDao.getMinPrice(resort_id));
			req.setAttribute("roomList", roomDao.getList(resort_id));
			req.setAttribute("reviewCount", resortReviewDao.getCount(resort_id));
			req.setAttribute("averageRating", resortReviewDao.getAverage(resort_id));
			req.setAttribute("reviewList", resortReviewDao.getList(resort_id));
			req.getRequestDispatcher("/rental/resortDetail.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMessage", "리조트를 찾는 중 오류가 발생했습니다.");
		}
	}

}
