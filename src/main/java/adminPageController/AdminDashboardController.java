package adminPageController;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import adminPageMapper.RootAdminMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import listener.UserCounter;
import mybatis.service.SqlSessionFactoryService;
import transactions.dao.SalesDao;
import transactions.dto.PieDto;
import users.dao.UserLogDao;
import users.dao.UsersDao;

@WebServlet("/admin/dashboard")
public class AdminDashboardController extends HttpServlet {    
	@Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // MyBatis SqlSession을 사용
        try (SqlSession session = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
        	RootAdminMapper mapper = session.getMapper(RootAdminMapper.class);
            
        	// 매출 분석 쿼리를 조회해오는 dao 생성
        	SalesDao salesDao = SalesDao.getInstance();
        	req.setAttribute("daily", salesDao.getDailySales());
        	req.setAttribute("weekly", salesDao.getWeeklySales());
        	req.setAttribute("monthly", salesDao.getMonthlySales());
        	req.setAttribute("yearly", salesDao.getYearlySales());
        	req.setAttribute("pie", salesDao.getRecentPie());
        	List<PieDto> list = salesDao.getRecentPie();
        	for (PieDto pie: list) {
        		req.setAttribute(pie.getCategory() + "_PIE", pie.getPie());
        		req.setAttribute(pie.getCategory() + "_PIE", pie.getPie());
        		req.setAttribute(pie.getCategory() + "_PIE", pie.getPie());
        	}
        	
        	UserLogDao userLogDao = UserLogDao.getInstance();
        	// 한 달 동안의 하루 방문자 수를 받아옴
        	req.setAttribute("monthlyVisitorCounts", userLogDao.selectMonthlyLogCounts());
        	req.setAttribute("todayVisitorCount", userLogDao.selectLogCount());
        	req.setAttribute("todayPureVisitorCount", userLogDao.selectUniqueLogCount());
        	
        	req.setAttribute("currentUsers", UserCounter.getCount());
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