package resort.controller;

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
import resort.dto.ResortSalesListDto;
import resort.mapper.ResortSalesManageMapper;

@WebServlet("/resortAdmin/salesChartData")
public class SalesChartDataController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json; charset=UTF-8");

        // 파라미터 받기
        String atStart = req.getParameter("atStart"); // 예: "2025-02-25"
        String atEnd   = req.getParameter("atEnd");   // 예: "2025-04-10"

        // 세션에서 resortID 가져오기 (없으면 기본값 1)
        Integer resortID = (Integer) req.getSession().getAttribute("resortID");
        if (resortID == null) {
            resortID = 1;
        }

        // 매퍼에 넘길 파라미터 설정
        Map<String, Object> params = new HashMap<>();
        params.put("atStart", atStart);
        params.put("atEnd", atEnd);
        params.put("resortID", resortID);

        try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            ResortSalesManageMapper mapper = sqlSession.getMapper(ResortSalesManageMapper.class);

            // (1) 날짜별 매출 (꺾은선 그래프용)
            List<Map<String, Object>> dailySales = mapper.getSalesChartData(params);

            // (2) 상품별 매출 (상품별 매출 기여도)
            List<Map<String, Object>> categorySales = mapper.selectCategorySales(params);

            // (3) 총 매출
            int totalSale = mapper.getTotalSale(params);

            // (4) 예약 완료 건수
            int confirmReserv = mapper.getConfirmReserv(params);

            // (5) 예약 취소 건수
            int cancleReserv = mapper.getCancleReserv(params);

            // (6) 결제 내역 리스트
            List<ResortSalesListDto> salesList = mapper.getSalesListByResortId(params);

            // 결과를 JSON으로 묶어서 응답
            Map<String, Object> result = new HashMap<>();
            result.put("dailySales", dailySales);
            result.put("categorySales", categorySales);
            result.put("totalSale", totalSale);
            result.put("confirmReserv", confirmReserv);
            result.put("cancleReserv", cancleReserv);
            result.put("salesList", salesList);

            String json = new Gson().toJson(result);
            resp.getWriter().write(json);
        }
    }
}
