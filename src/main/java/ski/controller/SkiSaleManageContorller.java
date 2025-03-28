package ski.controller;

import mybatis.service.SqlSessionFactoryService;
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
import java.util.*;

@WebServlet("/skiAdmin/skiSaleManage")
public class SkiSaleManageContorller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();
        
        Integer skiID = (Integer) session.getAttribute("skiID"); // 스키장 ID
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        // 파라미터로부터 날짜 파싱
        Date atStart = parseDate(req.getParameter("atStart"), dateFormat);
        Date atEnd   = parseDate(req.getParameter("atEnd"), dateFormat);

        // MyBatis 파라미터
        Map<String, Object> params = new HashMap<>();
        params.put("skiID", skiID);
        params.put("atStart", atStart);
        params.put("atEnd", atEnd);

        // 날짜가 유효하면 DB 조회
        if (atStart != null && atEnd != null) {
            try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
                SkiSalesManageMapper mapper = sqlSession.getMapper(SkiSalesManageMapper.class);

                // 1) 매출 요약 (기존 메서드 활용)
                int totalSale       = mapper.getTotalSale(params);
                int confirmReserv   = mapper.getConfirmReserv(params);
                int cancleReserv    = mapper.getCancleReserv(params);

                // 2) 카테고리별 매출
                List<Map<String, Object>> categorySales = mapper.selectCategorySales(params); 
                
                StringBuilder sb = new StringBuilder();
                sb.append("{");
                
                // summary
                sb.append("\"summary\":{");
                sb.append("\"totalSale\":").append(totalSale).append(",");
                sb.append("\"confirmReserv\":").append(confirmReserv).append(",");
                sb.append("\"cancleReserv\":").append(cancleReserv);
                sb.append("},");

                // categorySales
                sb.append("\"categorySales\":[");
                for (int i = 0; i < categorySales.size(); i++) {
                    Map<String, Object> row = categorySales.get(i);
                    String category = (String) row.get("category");
                    Number totalSales = (Number) row.get("total_sales");

                    sb.append("{");
                    sb.append("\"category\":\"").append(category).append("\",");
                    sb.append("\"total_sales\":").append(totalSales);
                    sb.append("}");
                    if (i < categorySales.size() - 1) {
                        sb.append(",");
                    }
                }
                sb.append("]");

                sb.append("}");

                out.write(sb.toString());
                return;
            }
        } else {
            // 날짜가 없거나 유효하지 않을 때의 처리
            out.write("{\"error\":\"Invalid date range\"}");
        }
    }

    private Date parseDate(String dateStr, SimpleDateFormat dateFormat) {
        if (dateStr == null || dateStr.trim().isEmpty()) {
            return null;
        }
        try {
            java.util.Date parsedDate = dateFormat.parse(dateStr);
            return new Date(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}
