package rental.controller;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mybatis.service.SqlSessionFactoryService;

public class ResortSalesServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        HttpSession session = req.getSession();
        Integer resortID = (Integer) session.getAttribute("resortID");
        
        if (resortID == null) {
            resp.sendRedirect("/login"); // 혹은 에러 페이지
            return;
        }
        
//        try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
//            ResortStatisticsMapper mapper = sqlSession.getMapper(ResortStatisticsMapper.class);
//            req.setAttribute("totalSale", mapper.getTotalSales(resortID));
//            req.setAttribute("totalReserv", mapper.getTotalReservations(resortID));
//            req.setAttribute("confirmReserv", mapper.getConfirmedReservations(resortID));
//            req.setAttribute("cancelReserv", mapper.getCancelledReservations(resortID));
//        }
        
        req.getRequestDispatcher("/resortAdmin/resortSaleManage.jsp").forward(req, resp);
	}
}
