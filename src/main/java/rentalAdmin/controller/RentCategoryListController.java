package rentalAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rental.dto.RentCategoryDTO;
import rentalAdmin.dao.RentCategoryDao;

@WebServlet("/adminRentCategory/list")
public class RentCategoryListController extends HttpServlet {
	private RentCategoryDao rcdao=RentCategoryDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<RentCategoryDTO> list=rcdao.categoryList();
		System.out.println("카테고리 리스트 출력:"+list);
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/rentalAdmin/rentCategoryList.jsp").forward(req, resp);
	}
}
