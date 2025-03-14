package skiAdminPageController;

import mybatis.service.SqlSessionFactoryService;
import org.apache.ibatis.session.SqlSession;

import skiAdminPageMapper.SkiAdminMapper;
import adminDto.SkiReservationDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
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
        String keyword = req.getParameter("keyword");
        String filter = req.getParameter("filter");

        if (skiID == null) {
            out.print("{\"error\": \"로그인이 필요합니다.\"}"); //세션 공부 및 수정 필요
            return;
        }
        if (filter == null || filter.trim().isEmpty()) {
            filter = "name"; 
        }
        Map<String, Object> params = new HashMap<>();
        if (keyword != null && !keyword.trim().isEmpty()) {
            params.put(filter, keyword); 
        }
        params.put("skiID", skiID);
        

        List<SkiReservationDTO> reservationList;
        try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            SkiAdminMapper mapper = sqlSession.getMapper(SkiAdminMapper.class);
            if (params.isEmpty()) {
                reservationList = mapper.getSkiReservationUsers(params);
            } else {
                reservationList = mapper.getSearchSkiReservationUsers(params);
            }
        }
        req.setAttribute("reservationList", reservationList);
        req.getRequestDispatcher("/skiAdmin/reservationList.jsp").forward(req, resp);
    }
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 예: 로그인 처리 후, 사용자의 스키장 ID가 1이라고 가정
	    HttpSession session = request.getSession();
	    session.setAttribute("skiID", 1);
	    
	    // 로그인 성공 후, 관리자 페이지로 이동
	    response.sendRedirect("/skiAdmin/skiReservation.jsp");
	}
    
}
