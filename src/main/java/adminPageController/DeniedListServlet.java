package adminPageController;

import mybatis.service.SqlSessionFactoryService;
import org.apache.ibatis.session.SqlSession;

import adminDto.UsersDTO;
import adminPageMapper.RootAdminMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/deniedList") 
public class DeniedListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String keyword = req.getParameter("keyword");
        String filter = req.getParameter("filter");
        
        if (filter == null || filter.trim().isEmpty()) {
            filter = "name"; 
        }

        Map<String, Object> params = new HashMap<>();
        if (keyword != null && !keyword.trim().isEmpty()) {
            params.put(filter, keyword); 
        }

        List<UsersDTO> deniedList;
        try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            RootAdminMapper mapper = sqlSession.getMapper(RootAdminMapper.class);
            if (params.isEmpty()) {
                deniedList = mapper.getDeniedUsers();
            } else {
                deniedList = mapper.getSearchDeniedUsers(params);
            }
        }

        req.setAttribute("deniedList", deniedList);
        req.getRequestDispatcher("/admin/deniedList.jsp").forward(req, resp);
    }
}