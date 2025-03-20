package skiAdminPageController;

import mybatis.service.SqlSessionFactoryService;
import ski.dto.SkiReservationDetailDTO;
import ski.dto.SkiReservationPrintDto;
import ski.mapper.SkiReservationMapper;

import org.apache.ibatis.session.SqlSession;

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


@WebServlet("/skiAdmin/reservationDetailList")
public class SkiReservationDetailController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        String reservIdparam = req.getParameter("reservId");
        
        if (reservIdparam == null) {
            out.print("에러 : 예약정보 조회 중 오류"); 
            return;
        }
        Integer reservId= Integer.parseInt(reservIdparam);
                                
        Map<String, Object> params = new HashMap<>();
        params.put("reservId", reservId);
        
        List<SkiReservationPrintDto> reservationDetailList;
        try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            SkiReservationMapper mapper = sqlSession.getMapper(SkiReservationMapper.class);
            reservationDetailList = mapper.selectReservationBySkiId(params);
        }
        req.setAttribute("reservationDetailList", reservationDetailList);
        req.getRequestDispatcher("/skiAdmin/reservationListDetail.jsp").forward(req, resp);
    }
   
    
}
