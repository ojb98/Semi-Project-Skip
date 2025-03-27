package ski.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mybatis.service.SqlSessionFactoryService;
import ski.mapper.SkiSalesManageMapper;

@WebServlet("/skiAdmin/salesChartData")
public class SalesChartDataController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json; charset=UTF-8");

        String atStart = req.getParameter("atStart");
        String atEnd = req.getParameter("atEnd");

        Map<String, Object> params = new HashMap<>();
        params.put("atStart", atStart);
        params.put("atEnd", atEnd);
        
        try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            SkiSalesManageMapper mapper = sqlSession.getMapper(SkiSalesManageMapper.class);
            List<Map<String, Object>> chartData = mapper.getSalesChartData(params);
            Gson gson = new Gson(); // com.google.gson 라이브러리 필요
            String json = gson.toJson(chartData);

            resp.getWriter().write(json);
        }
    }
}
