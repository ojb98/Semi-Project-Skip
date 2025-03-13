package adminPageController;

import mybatis.service.SqlSessionFactoryService;
import org.apache.ibatis.session.SqlSession;
import adminPageMapper.RootAdminMapper;
import adminDto.UsersDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/pendingList")
public class PendingListServlet extends HttpServlet {
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

        List<UsersDTO> pendingList;
        try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            RootAdminMapper mapper = sqlSession.getMapper(RootAdminMapper.class);
            if (params.isEmpty()) {
                pendingList = mapper.getPendingUsers();
            } else {
                pendingList = mapper.getSearchPendingUsers(params);
            }
        }

        req.setAttribute("pendingList", pendingList);
        req.getRequestDispatcher("/admin/pendingList.jsp").forward(req, resp);
    }
}