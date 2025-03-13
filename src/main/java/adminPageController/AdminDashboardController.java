package adminPageController;

import java.io.IOException;
import org.apache.ibatis.session.SqlSession;

import adminPageMapper.RootAdminMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mybatis.service.SqlSessionFactoryService;

@WebServlet("/admin/dashboard")
public class AdminDashboardController extends HttpServlet {    
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // MyBatis SqlSession을 사용
        try (SqlSession session = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
        	RootAdminMapper mapper = session.getMapper(RootAdminMapper.class);
            
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