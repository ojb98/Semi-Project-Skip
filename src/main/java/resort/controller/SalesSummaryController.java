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
import resort.mapper.ResortSalesManageMapper;

@WebServlet("/resortAdmin/salesSummary")
public class SalesSummaryController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json; charset=UTF-8");
        Integer resortID = (Integer) req.getSession().getAttribute("resortID");

        String atStart = req.getParameter("atStart");
        String atEnd = req.getParameter("atEnd");

        Map<String, Object> params = new HashMap<>();
        params.put("resortID", resortID);
        params.put("atStart", atStart);
        params.put("atEnd", atEnd);

        try (SqlSession session = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            ResortSalesManageMapper mapper = session.getMapper(ResortSalesManageMapper.class);
            Map<String, Object> result = new HashMap<>();
            result.put("totalSale", mapper.getTotalSale(params));
            result.put("confirmReserv", mapper.getConfirmReserv(params));
            result.put("cancleReserv", mapper.getCancleReserv(params));

            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(result));
        }
    }
}
