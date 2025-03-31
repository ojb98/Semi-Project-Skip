package ski.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mybatis.service.SqlSessionFactoryService;
import ski.mapper.SkiSalesManageMapper;
import users.dto.UsersDto;

@WebServlet("/skiAdmin/skiSaleManage1")
public class SkiSessionController extends HttpServlet{	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UsersDto dto = (UsersDto) session.getAttribute("user");
		Integer uuid = dto.getUuid();
		String name = dto.getName();
		try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            SkiSalesManageMapper mapper = sqlSession.getMapper(SkiSalesManageMapper.class);
            Integer RentID = mapper.getSkiID(uuid);
            session.setAttribute("RentalshopID", RentID);
            session.setAttribute("name", name);
        }
		req.getRequestDispatcher("/skiAdmin/skiSaleManage.jsp").forward(req, resp);
	}	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
