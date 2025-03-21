package rental.controller;

import mybatis.service.SqlSessionFactoryService;
import rental.dto.RentalReservationPrintDto;
import rental.mapper.RentalReservationMapper;

import org.apache.ibatis.session.SqlSession;

import adminUtil.FilterMapping;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/rentalAdmin/reservationList")
public class RentalReservationController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        Integer rentalID = (Integer) session.getAttribute("rentalID");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        Date reserv_date1_start = parseDate(req.getParameter("reservDate1Start"), dateFormat);
        Date reserv_date1_end = parseDate(req.getParameter("reservDate1End"), dateFormat);
        Date reserv_date2_start = parseDate(req.getParameter("reservDate2Start"), dateFormat);
        Date reserv_date2_end = parseDate(req.getParameter("reservDate2End"), dateFormat);
        Date created_at_start = parseDate(req.getParameter("createdAtStart"), dateFormat);
        Date created_at_end = parseDate(req.getParameter("createdAtEnd"), dateFormat);
        
        String keyword = req.getParameter("keyword");
        String filter = req.getParameter("filter");
        if (rentalID == null) {
            out.print("{\"error\": \"로그인이 필요합니다.\"}"); //세션 공부 및 수정 필요
            return;
        } 
        // 필터맵을 적용하여 한글 필터명을 DB 컬럼명으로 변환
        if (filter == null || filter.trim().isEmpty()) {
            filter = "이름"; // 기본 필터 설정
        } else {
            filter = FilterMapping.getColumn(filter); // 필터맵 변환 적용
            if (filter == null) {
                filter = "이름"; // 필터가 존재하지 않으면 기본값 사용
            }
        }

        // MyBatis 파라미터 맵 생성
        Map<String, Object> params = new HashMap<>();
        params.put("rentalID", rentalID);

        if (keyword != null && !keyword.trim().isEmpty()) {
            params.put(filter, keyword); // 변환된 필터 컬럼 적용
        }
        params.put("reserv_date1_start", reserv_date1_start);
        params.put("reserv_date1_end", reserv_date1_end);
        params.put("reserv_date2_start", reserv_date2_start);
        params.put("reserv_date2_end", reserv_date2_end);
        params.put("created_at_start", created_at_start);
        params.put("created_at_end", created_at_end);
        
        List<RentalReservationPrintDto> reservationList;
        try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            RentalReservationMapper mapper = sqlSession.getMapper(RentalReservationMapper.class);
            
            // 현재 날짜 구하기
            java.util.Date today = new java.util.Date();
            java.sql.Date sqlToday = new java.sql.Date(today.getTime());

            // 상태 업데이트를 위한 파라미터 맵 생성
            Map<String, Object> updateParams = new HashMap<>();
            updateParams.put("rentalID", rentalID);
            updateParams.put("today", sqlToday);

            // 상태 업데이트 실행
            mapper.updateReservationStatusToCompleted(updateParams);
            
            // 변경사항 커밋
            sqlSession.commit();
            
            // 업데이트된 리스트 다시 조회
            reservationList = mapper.selectReservationByRentalId(params);
        }
        
        req.setAttribute("reservationList", reservationList);
        req.getRequestDispatcher("/rentalAdmin/reservationList.jsp").forward(req, resp);
    }

    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 사용자의 스키장 ID가 1이라고 가정
	    HttpSession session = request.getSession();
	    session.setAttribute("rentalID", 1);
	    
	    // 로그인 성공 후, 관리자 페이지로 이동
	    response.sendRedirect("/rentalAdmin/rentalReservation.jsp");
	}
    
    
    private Date parseDate(String dateStr, SimpleDateFormat dateFormat) {
        if (dateStr == null || dateStr.trim().isEmpty()) {
            return null; // 빈 값이면 null 반환
        }
        try {
            java.util.Date parsedDate = dateFormat.parse(dateStr);
            return new Date(parsedDate.getTime()); // java.sql.Date로 변환
        } catch (ParseException e) {
            e.printStackTrace();
            return null; // 오류 발생 시 null 반환
        }
    }
}
