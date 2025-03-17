package skiAdminPageController;

import mybatis.service.SqlSessionFactoryService;
import ski.dto.SkiReservationListDto;
import ski.mapper.SkiReservationMapper;

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

@WebServlet("/skiAdmin/reservationList")
public class SkiReservationController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        Integer skiID = (Integer) session.getAttribute("skiID");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        Date reserv_date_start = parseDate(req.getParameter("reservDateStart"), dateFormat);
        Date reserv_date_end = parseDate(req.getParameter("reservDateEnd"), dateFormat);
        Date created_at_start = parseDate(req.getParameter("createdAtStart"), dateFormat);
        Date created_at_end = parseDate(req.getParameter("createdAtEnd"), dateFormat);
        
        String keyword = req.getParameter("keyword");
        String filter = req.getParameter("filter");
        if (skiID == null) {
            out.print("{\"error\": \"로그인이 필요합니다.\"}"); //세션 공부 및 수정 필요
            return;
        } 
        // 필터맵을 적용하여 한글 필터명을 DB 컬럼명으로 변환
        if (filter == null || filter.trim().isEmpty()) {
            filter = "name"; // 기본 필터 설정
        } else {
            filter = FilterMapping.getColumn(filter); // 필터맵 변환 적용
            if (filter == null) {
                filter = "name"; // 필터가 존재하지 않으면 기본값 사용
            }
        }

        // MyBatis 파라미터 맵 생성
        Map<String, Object> params = new HashMap<>();
        params.put("skiID", skiID);

        if (keyword != null && !keyword.trim().isEmpty()) {
            params.put(filter, keyword); // 변환된 필터 컬럼 적용
        }
        params.put("reserv_date_start", reserv_date_start);
        params.put("reserv_date_end", reserv_date_end);
        params.put("created_at_start", created_at_start);
        params.put("created_at_end", created_at_end);
        
        

        List<SkiReservationListDto> reservationList;
        try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            SkiReservationMapper mapper = sqlSession.getMapper(SkiReservationMapper.class);
            reservationList = mapper.selectByUuid(params);
                
        }
        
        req.setAttribute("reservationList", reservationList);
        req.getRequestDispatcher("/skiAdmin/reservationList.jsp").forward(req, resp);
    }
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 사용자의 스키장 ID가 1이라고 가정
	    HttpSession session = request.getSession();
	    session.setAttribute("skiID", 1);
	    
	    // 로그인 성공 후, 관리자 페이지로 이동
	    response.sendRedirect("/skiAdmin/skiReservation.jsp");
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
