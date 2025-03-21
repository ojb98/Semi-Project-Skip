package rentalAdmin.controller;

import java.io.IOException;
import java.util.HashMap;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rental.dto.RentCategoryDTO;
import rentalAdmin.dao.RentCategoryDao;

@WebServlet("/adminRentCategory/update")
public class RentCategoryUpdateController extends HttpServlet {
	private RentCategoryDao rcdao= RentCategoryDao.getInstance();
	private static final int SUCCESS_THRESHOLD = 0;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int categoryId=Integer.parseInt(req.getParameter("category_id"));
		
		RentCategoryDTO rcdto=rcdao.getCategoryId(categoryId);
		
		req.setAttribute("rcdto", rcdto);
		
		req.getRequestDispatcher("/rentalAdmin/rentCategoryUpdate.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int categoryId=Integer.parseInt(req.getParameter("category_id"));
		int price=Integer.parseInt(req.getParameter("price_per_hour"));
		
		//HashMap으로 데이터 담기
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		map.put("categoryId", categoryId);
		map.put("price", price);
		
		//카테고리 db수정하기
		int n = rcdao.categoryMapUpdate(map);
		
		if(n>SUCCESS_THRESHOLD) {
			System.out.println("카테고리 수정 성공");
		}else {
			System.out.println("카테고리 수정 실패");
		}
		
		resp.sendRedirect(req.getContextPath()+"/adminRentCategory/list");
	}
}
