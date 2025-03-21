package rentalAdmin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rental.dto.RentCategoryDTO;
import rental.dto.RentItemDTO;
import rentalAdmin.dao.RentCategoryDao;
import rentalAdmin.dao.RentItemDao;

@WebServlet("/adminRentCategory/update")
public class RentCategoryUpdateController extends HttpServlet {
	private RentCategoryDao rcdao= RentCategoryDao.getInstance();
	private RentItemDao ridao= RentItemDao.getInstance();
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
		
		List<RentItemDTO> ridto=ridao.itemCategoryids(categoryId);
		
		if(ridto!=null && !ridto.isEmpty()) { //데이터가 존재한다면 수정하지않기
			req.getSession().setAttribute("errMsg", "해당 카테고리를 사용중이므로 수정할 수 없습니다.");
			resp.sendRedirect(req.getContextPath() + "/adminRentCategory/update?category_id="+categoryId);
			return;
	
		}else { //수정처리하기
			
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
		}

		resp.sendRedirect(req.getContextPath()+"/adminRentCategory/list");
	}
}
