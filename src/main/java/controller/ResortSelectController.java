package controller;

import dao.*;
import dto.FacilityDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.FacilityType;

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
                    FacilityDTO facilityDTO = facilityDao.getFacilityByFacility(facility_id);
                    facilityMap.put("name", facilityDTO.getFacility_name());
                    facilityMap.put("icon", FacilityType.getById(facilityDTO.getType_id()).getIcon());
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
