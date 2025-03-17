package adminPageController;

import java.io.IOException;
import org.apache.ibatis.session.SqlSession;
import adminPageMapper.AdminApprovalRequestMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mybatis.service.SqlSessionFactoryService;

@WebServlet("/admin/approvalRequest")
public class AdminApprovalRequestController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try(SqlSession session = SqlSessionFactoryService.getSqlSessionFactory().openSession()){
			AdminApprovalRequestMapper mapper = session.getMapper(AdminApprovalRequestMapper.class);
			
			req.setAttribute("pendingUserList", mapper.getPendingUsers());
			req.getRequestDispatcher("/admin/adminApprovalRequest.jsp").forward(req, resp);
		}
	}
}
