package rental.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rental.dao.RentReservDao;
import rental.dao.RentReservItemDao;
import rental.dto.RentReservDTO;
import rental.dto.RentReservItemDTO;
import ski.dao.SkiReservDao;
import ski.dao.SkiReservItemDao;
import ski.dto.SkiReservDTO;
import ski.dto.SkiReservItemDTO;

@WebServlet("/reserv")
public class RentSkiReservInsertController extends HttpServlet {
    private SkiReservDao srdao = SkiReservDao.getInstance();
    private SkiReservItemDao sridao = SkiReservItemDao.getInstance();
    
    private RentReservDao rrdao = RentReservDao.getInstance();
    private RentReservItemDao rridao = RentReservItemDao.getInstance();
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        try {
            // 1. 클라이언트 파라미터 읽기
            String itemsJson = req.getParameter("items"); // JSON 문자열 (예약 항목 목록)
            System.out.println("itemsJson: " + itemsJson);
            
            double totalPrice = Double.parseDouble(req.getParameter("totalPrice"));
            System.out.println("총 가격: " + totalPrice);
            
            int id_str = Integer.parseInt(req.getParameter("id_str"));
            System.out.println("id_str:"+id_str);
            
            //렌탈/스키장구분
            String isRentalOrSki = req.getParameter("isRentalOrSki"); 
            
            
            // 예약 날짜 (예: "2025-05-01")
            String rentDateStr = req.getParameter("rentDate");
            if (rentDateStr == null || rentDateStr.trim().isEmpty()) {
                throw new ServletException("예약 날짜(rentDate) 파라미터가 누락되었습니다.");
            }
            System.out.println("예약 날짜: " + rentDateStr);
            
            int uuid = Integer.parseInt(req.getParameter("uuid"));
            System.out.println("uuid: " + uuid);
            
            // 2. JSON 파싱: itemsJson을 List<Map<String, Object>>로 변환
            Gson gson = new Gson();
            Type listType = new TypeToken<List<Map<String, Object>>>() {}.getType();
            List<Map<String, Object>> itemsList = gson.fromJson(itemsJson, listType);
            if (itemsList == null || itemsList.isEmpty()) {
                throw new ServletException("예약 항목 데이터가 비어 있습니다.");
            }
            
            // 3. itemsList에서 전체 예약의 시작시간과 종료시간 결정
            // 각 항목의 startTime, endTime은 예를 들어 10, 13 (정수형 값)로 전달됨
            int overallStart = Integer.MAX_VALUE; // 가장 작은 시작시간
            int overallEnd = Integer.MIN_VALUE;   // 가장 큰 종료시간
            for (Map<String, Object> map : itemsList) {
                if (map.get("startTime") == null || map.get("endTime") == null) {
                    throw new ServletException("예약 항목에 startTime 또는 endTime 데이터가 누락되었습니다.");
                }
                int start = ((Double) map.get("startTime")).intValue();
                int end = ((Double) map.get("endTime")).intValue();
                if (start < overallStart) overallStart = start;
                if (end > overallEnd) overallEnd = end;
            }
            // 두 자리 문자열로 포맷 (예: "09", "18")
            String formattedStart = String.format("%02d", overallStart);
            String formattedEnd = String.format("%02d", overallEnd);
            
            // 예약 시작/종료 시간 문자열 생성 (예: "2025-05-01 09:00:00", "2025-05-01 18:00:00")
            String reservStartStr = rentDateStr + " " + formattedStart + ":00:00";
            String reservEndStr = rentDateStr + " " + formattedEnd + ":00:00";
            System.out.println("전체 예약 시작: " + reservStartStr);
            System.out.println("전체 예약 종료: " + reservEndStr);
            
            // 4. 문자열을 Date 객체로 변환 ("yyyy-MM-dd HH:mm:ss" 형식)
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date reservStart = sdf.parse(reservStartStr);
            Date reservEnd = sdf.parse(reservEndStr);
            
            if(isRentalOrSki.equals("SKI")) {
                //5. SKI_RESERVATION에 저장할 DTO 생성 (STATUS와 CREATED_AT은 기본값 사용)
                SkiReservDTO srdto = new SkiReservDTO(0,id_str,uuid,reservStart,reservEnd,totalPrice,null,null);

                // 6. 예약 정보 삽입 및 생성된 예약 ID 획득
                int skiReservId = srdao.skiReservInsert(srdto);
                System.out.println("skiReservId:"+skiReservId);
                if (skiReservId <= 0) {
                    throw new ServletException("예약 정보 삽입에 실패했습니다.");
                }
                
                // 7. 각 예약 항목을 SKI_RESERVATION_ITEM 테이블에 삽입
                for (Map<String, Object> map : itemsList) {
                    SkiReservItemDTO itemDTO = new SkiReservItemDTO();
                    itemDTO.setSki_reserv_id(skiReservId);
                    // Gson은 숫자를 Double로 파싱하므로 int로 변환
                    itemDTO.setItem_id(((Double) map.get("itemId")).intValue());
                    itemDTO.setQuantity(((Double) map.get("quantity")).intValue());
                    itemDTO.setSubtotal_price((Double) map.get("price"));
                    sridao.skiReservItemInsert(itemDTO);
                }
            	

            }else if(isRentalOrSki.equals("RENTAL")) {
            	 //5. RENTAL_RESERVATION에 저장할 DTO 생성 (STATUS와 CREATED_AT은 기본값 사용)
                RentReservDTO rrdto = new RentReservDTO(0,id_str,uuid,reservStart,reservEnd,totalPrice,null,null);

                // 6. 예약 정보 삽입 및 생성된 예약 ID 획득
                int rentReservId = rrdao.rentReservInsert(rrdto);
                System.out.println("rentReservId:"+rentReservId);
                if (rentReservId <= 0) {
                    throw new ServletException("예약 정보 삽입에 실패했습니다.");
                }
                
                // 7. 각 예약 항목을 RENT_RESERVATION_ITEM 테이블에 삽입
                for (Map<String, Object> map : itemsList) {
                	RentReservItemDTO itemDTO = new RentReservItemDTO();
                    itemDTO.setRent_reserv_id(rentReservId);
                    // Gson은 숫자를 Double로 파싱하므로 int로 변환
                    itemDTO.setItem_id(((Double) map.get("itemId")).intValue());
                    itemDTO.setQuantity(((Double) map.get("quantity")).intValue());
                    itemDTO.setSubtotal_price((Double) map.get("price"));
                    rridao.rentReservItemInsert(itemDTO);
                }
            	
            }

            // 8. 예약 완료 후 확인 페이지로 리다이렉트
            resp.sendRedirect(req.getContextPath() + "/rental/reservList.jsp");
            
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("예약 처리 중 오류 발생", e);
        }
    }
}
