package rentalAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import rental.dto.CategoryDTO;
import rental.dto.RentCategoryDTO;
import rentalAdmin.dao.RentCategoryDao;
import users.dto.UsersDto;

@WebServlet("/adminRentCategory/list")
public class RentCategoryListController extends HttpServlet {
	private RentCategoryDao rcdao=RentCategoryDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<CategoryDTO> list=rcdao.categoryList();
		System.out.println("카테고리 리스트 출력:"+list);
		
		//현재 로그인한 유저정보 넘기기
		HttpSession session=req.getSession();
		UsersDto user=(UsersDto)session.getAttribute("user");
					
		req.setAttribute("user", user);
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/rentalAdmin/rentCategoryList.jsp").forward(req, resp);
	}
}
