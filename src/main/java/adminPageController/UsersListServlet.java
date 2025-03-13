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

@WebServlet("/admin/usersList")
public class UsersListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String keyword = request.getParameter("keyword");
        String filter = request.getParameter("filter");
        
        if (filter == null || filter.trim().isEmpty()) {
            filter = "name"; 
        }

        Map<String, Object> params = new HashMap<>();
        if (keyword != null && !keyword.trim().isEmpty()) {
            params.put(filter, keyword); 
        }

        List<UsersDTO> usersList;
        try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            RootAdminMapper mapper = sqlSession.getMapper(RootAdminMapper.class);
            if (params.isEmpty()) {
                usersList = mapper.getUsersList();
            } else {
                usersList = mapper.getSearchUsersList(params);
            }
        }

        request.setAttribute("usersList", usersList);
        request.getRequestDispatcher("/admin/usersList.jsp").forward(request, response);
    }
}