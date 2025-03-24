package ski.controller;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mybatis.service.SqlSessionFactoryService;
import ski.mapper.SkiStatisticsMapper;

public class SkiSalesServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        HttpSession session = req.getSession();
        Integer skiID = (Integer) session.getAttribute("skiID");
        
        if (skiID == null) {
            resp.sendRedirect("/login"); // 혹은 에러 페이지
            return;
        }
        
        try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            SkiStatisticsMapper mapper = sqlSession.getMapper(SkiStatisticsMapper.class);
            req.setAttribute("totalSale", mapper.getTotalSales(skiID));
            req.setAttribute("totalReserv", mapper.getTotalReservations(skiID));
            req.setAttribute("confirmReserv", mapper.getConfirmedReservations(skiID));
            req.setAttribute("cancelReserv", mapper.getCancelledReservations(skiID));
        }
        
        req.getRequestDispatcher("/skiAdmin/skiSaleManage.jsp").forward(req, resp);
	}
}
