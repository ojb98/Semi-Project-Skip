package ski.controller;

import mybatis.service.SqlSessionFactoryService;
import ski.dto.SkiReservationPrintDto;
import ski.mapper.SkiReservationMapper;
import ski.mapper.SkiSalesManageMapper;

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

@WebServlet("/skiAdmin/skiSaleManage")
public class SkiSaleManageContorller extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        Integer skiID = (Integer) session.getAttribute("skiID");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        Date atStart = parseDate(req.getParameter("atStart"), dateFormat);
        Date atEnd = parseDate(req.getParameter("atEnd"), dateFormat);
        
        // MyBatis 파라미터 맵 생성
        Map<String, Object> params = new HashMap<>();
        params.put("skiID", skiID);
        params.put("atStart", atStart);
        params.put("atEnd", atEnd);
        
       
        if (atStart != null && atEnd != null) {
            try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
                SkiSalesManageMapper mapper = sqlSession.getMapper(SkiSalesManageMapper.class);

                int totalSale = mapper.getTotalSale(params);
                int confirmReserv = mapper.getConfirmReserv(params);
                int cancleReserv = mapper.getCancleReserv(params);

                // JSON 형식 문자열로 직접 반환
                String json = String.format(
                    "{ \"totalSale\": %d, \"confirmReserv\": %d, \"cancleReserv\": %d }",
                    totalSale, confirmReserv, cancleReserv
                );

                resp.setContentType("application/json; charset=UTF-8");
                resp.getWriter().write(json);
                return;
            }
        }
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
