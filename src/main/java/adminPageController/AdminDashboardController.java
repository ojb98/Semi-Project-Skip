package adminPageController;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import adminPageMapper.RootAdminMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mybatis.service.SqlSessionFactoryService;
import transactions.dao.SalesDao;

@WebServlet("/admin/dashboard")
public class AdminDashboardController extends HttpServlet {    
	@Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // MyBatis SqlSession을 사용
        try (SqlSession session = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
        	RootAdminMapper mapper = session.getMapper(RootAdminMapper.class);
            
        	// 매출 분석 쿼리를 조회해오는 dao 생성
        	SalesDao dao = SalesDao.getInstance();
        	req.setAttribute("daily", dao.getDailySales());
        	req.setAttribute("weekly", dao.getWeeklySales());
        	req.setAttribute("monthly", dao.getMonthlySales());
        	req.setAttribute("yearly", dao.getYearlySales());
        	
        	System.out.println(dao.getDailySales());
        	
            req.setAttribute("totalUsers", mapper.getTotalUsers());
            req.setAttribute("userCount", mapper.getUserCount());
            req.setAttribute("skiOwners", mapper.getSkiOwners());
            req.setAttribute("rentalOwners", mapper.getRentalOwners());
            req.setAttribute("resortOwners", mapper.getResortOwners());
            req.setAttribute("pendingCounts", mapper.getPendingCounts());
            req.setAttribute("newUserList", mapper.getNewUsers());
            
            req.getRequestDispatcher("/admin/adminmain.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("DB 조회 중 오류 발생", e);
        }
    }
}	