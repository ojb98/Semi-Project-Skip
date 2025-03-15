package skiAdminPageController;

import com.google.gson.Gson;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        Integer skiID = (Integer) session.getAttribute("skiID");

        if (skiID == null) {
            out.print("{\"error\": \"로그인이 필요합니다.\"}");
            return;
        }

        String keyword = request.getParameter("keyword");
        String filter = request.getParameter("filter");

        Map<String, Object> params = new HashMap<>();
        params.put("skiID", skiID);

        if (keyword != null && !keyword.trim().isEmpty()) {
            switch (filter) {
                case "userName": params.put("name", keyword); break;
                case "userId": params.put("user_id", keyword); break;
                case "userEmail": params.put("email", keyword); break;
            }
        }

        SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession();
        SkiAdminMapper mapper = sqlSession.getMapper(SkiAdminMapper.class);
        List<SkiReservationDTO> reservations = mapper.getSearchSkiReservationUsers(params);
        sqlSession.close();

        Gson gson = new Gson();
        out.print(gson.toJson(reservations));
    }
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 예: 로그인 처리 후, 사용자의 스키장 ID가 123이라고 가정
	    HttpSession session = request.getSession();
	    session.setAttribute("skiID", 1);
	    
	    // 로그인 성공 후, 관리자 페이지로 이동
	    response.sendRedirect("/skiAdmin/skiReservation.jsp");
	}
    
}
