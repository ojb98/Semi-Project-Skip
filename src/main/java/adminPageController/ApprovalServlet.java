package adminPageController;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.ibatis.session.SqlSession;
import adminPageMapper.RootAdminMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mybatis.service.SqlSessionFactoryService;

public class ApprovalServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		try {
			int uuid = Integer.parseInt(req.getParameter("uuid"));
			try(SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()){
				RootAdminMapper mapper = sqlSession.getMapper(RootAdminMapper.class);
				int updateCount = mapper.approvalPendingUsers(uuid);
				
				if(updateCount > 0){
			    	sqlSession.commit();
			        out.print("success");
			    } else {
			        out.print("failed");
			    }
			}
		}catch (NumberFormatException e) {
            out.print("invalid_uuid");
        } catch (Exception e) {
            e.printStackTrace();
            out.print("error");
        }
	}
}
