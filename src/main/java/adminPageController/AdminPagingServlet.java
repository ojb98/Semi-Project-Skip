package adminPageController;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import adminDto.UsersDTO;
import adminPageMapper.AdminApprovalRequestMapper;
import adminUtil.FilterMapping;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mybatis.service.SqlSessionFactoryService;

@WebServlet("/admin/list")
public class AdminPagingServlet extends HttpServlet {
    private static final int PAGE_SIZE = 10;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // listType: "pending" 또는 "denied"
        String type = req.getParameter("type");
        String pageStr = req.getParameter("page");
        String keyword = req.getParameter("keyword");
        String filter = req.getParameter("filter");
        if (filter == null || filter.trim().isEmpty()) {
            filter = "name"; // 기본 필터 설정
        } else {
            filter = FilterMapping.getColumn(filter); // 필터맵 변환 적용
            if (filter == null) {
                filter = "name"; // 필터가 존재하지 않으면 기본값 사용
            }
        }
        
        int currentPage = 1;
        if(pageStr != null && !pageStr.isEmpty()){
            try {
                currentPage = Integer.parseInt(pageStr);
            } catch(NumberFormatException e) {
                currentPage = 1;
            }
        }
        int startRow = (currentPage - 1) * PAGE_SIZE;
        int endRow = currentPage * PAGE_SIZE; // endRow 계산
        	
        Map<String, Object> params = new HashMap<>();
        params.put("startRow", startRow);
        params.put("endRow", endRow); // endRow 추가
        params.put("pageSize", PAGE_SIZE);
        
        if (keyword != null && !keyword.trim().isEmpty()) {
            params.put(filter, keyword); // 변환된 필터 컬럼 적용
        }
        
        try(SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()){
            AdminApprovalRequestMapper mapper = sqlSession.getMapper(AdminApprovalRequestMapper.class);
            if("pending".equals(type)){
                int totalRecords = mapper.getPendingTotalCount(); // DB에서 status = 'P'인 사용자 수
                int totalPages = (int)Math.ceil((double) totalRecords / PAGE_SIZE);
                List<UsersDTO> pendingList = mapper.getPendingPagedList(params);
                req.setAttribute("userList", pendingList);
                req.setAttribute("currentPage", currentPage);
                req.setAttribute("totalPages", totalPages);
                req.setAttribute("listType", "pending");
                req.getRequestDispatcher("/admin/pendingList.jsp").forward(req, resp);
            } else if("denied".equals(type)){
                int totalRecords = mapper.getDeniedTotalCount(); // DB에서 status = 'N'인 사용자 수
                int totalPages = (int)Math.ceil((double) totalRecords / PAGE_SIZE);
                List<UsersDTO> deniedList = mapper.getDeniedPagedList(params);
                req.setAttribute("userList", deniedList);
                req.setAttribute("currentPage", currentPage);
                req.setAttribute("totalPages", totalPages);
                req.setAttribute("listType", "denied");
                req.getRequestDispatcher("/admin/deniedList.jsp").forward(req, resp);
            }
        }
    }
}
