package ski.controller;

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
import ski.dao.SkiReservDao;
import ski.dao.SkiReservItemDao;
import ski.dto.SkiReservDTO;
import ski.dto.SkiReservItemDTO;

@WebServlet("/reserv")
public class SkiReservInsertController extends HttpServlet{
	private SkiReservDao reservDAO = SkiReservDao.getInstance();
	private SkiReservItemDao itemDAO = SkiReservItemDao.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		try {
			// 파라미터 읽기
			String itemsJson = req.getParameter("items"); // JSON 문자열 (예약 항목 목록)
			double totalPrice = Double.parseDouble(req.getParameter("totalPrice"));
			String reservStartStr = req.getParameter("reservStart"); // 예: "2025-04-15 09:00:00"
			String reservEndStr = req.getParameter("reservEnd");     // 예: "2025-04-15 18:00:00"
			int uuid = Integer.parseInt(req.getParameter("uuid"));
			int skiId = Integer.parseInt(req.getParameter("skiId"));

			// 문자열을 Date로 변환 ("yyyy-MM-dd HH:mm:ss" 형식)
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date reservStart = sdf.parse(reservStartStr);
			Date reservEnd = sdf.parse(reservEndStr);

			//SKI_RESERVATION에 저장할 DTO 생성
			SkiReservDTO reservDTO = new SkiReservDTO();
			reservDTO.setSki_id(skiId);
			reservDTO.setUuid(uuid);
			reservDTO.setReserv_start(reservStart);
			reservDTO.setReserv_end(reservEnd);
			reservDTO.setTotal_price(totalPrice);
			// STATUS와 CREATED_AT은 기본값 사용

			// 예약 정보 삽입 및 생성된 예약 ID 획득
			int skiReservId = reservDAO.skiReservInsert(reservDTO);

			// Gson을 사용하여 JSON 문자열을 리스트(맵)로 변환  
			// JSON 구조 예시: [ { "itemId": 1, "quantity": 2, "price": 40000 }, ... ]
			Gson gson = new Gson();
			Type listType = new TypeToken<List<Map<String, Object>>>(){}.getType();
			List<Map<String, Object>> itemsList = gson.fromJson(itemsJson, listType);

			// 각 예약 항목을 SKI_RESERVATION_ITEM 테이블에 삽입
			
			for (Map<String, Object> map : itemsList) {
				SkiReservItemDTO itemDTO = new SkiReservItemDTO();
				itemDTO.setSki_reserv_id(skiReservId);
				// Gson은 숫자를 Double로 파싱하므로 int로 변환
				itemDTO.setItem_id(((Double) map.get("itemId")).intValue());
				itemDTO.setQuantity(((Double) map.get("quantity")).intValue());
				itemDTO.setSubtotal_price((Double) map.get("price"));
				itemDAO.skiReservItemInsert(itemDTO);
			}

			// 예약 완료 후 확인 페이지로 리다이렉트
			resp.sendRedirect(req.getContextPath() + "/reservation/confirmation.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException("예약 처리 중 오류 발생", e);
		}
	
	}
}
