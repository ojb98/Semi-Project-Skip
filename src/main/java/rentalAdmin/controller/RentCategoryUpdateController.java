package rentalAdmin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rental.dto.CategoryDTO;
import rental.dto.RentCategoryDTO;
import rental.dto.RentItemDTO;
import rental.dto.RentSkiItemDTO;
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
		
		CategoryDTO rcdto=rcdao.getCategoryId(categoryId);
		
		req.setAttribute("rcdto", rcdto);
		
		req.getRequestDispatcher("/rentalAdmin/rentCategoryUpdate.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int categoryId=Integer.parseInt(req.getParameter("category_id"));
		int price=Integer.parseInt(req.getParameter("price_per_hour"));
		
		List<RentSkiItemDTO> ridto=ridao.itemCategoryids(categoryId);
		
		if(ridto!=null && !ridto.isEmpty()) { //데이터가 존재한다면 수정하지않기
			req.getSession().setAttribute("errMsg", "해당 카테고리를 사용중이므로 수정할 수 없습니다.");
			resp.sendRedirect(req.getContextPath() + "/adminRentCategory/update?category_id="+categoryId);
			return;
	
		}else { //수정처리하기
			
			//item_type가 disabled라서 categoryId로 값 가져오기
			CategoryDTO category=rcdao.getCategoryId(categoryId);
			String itemType=category.getItem_type();
			
			//DB에서 중복여부체크(item_type과 price_per_hour가 같은게 있는지) 
			CategoryDTO inputDto=new CategoryDTO(0,itemType,price);
			
			int exists = rcdao.getCategoryExists(inputDto);
	        if (exists > 0) {
	            //중복인 경우, 에러 메시지를 request에 담고 등록 폼으로 다시 포워딩
	        	req.getSession().setAttribute("errMsg", "동일한 장비종류와 시간당 대여가격이 이미 등록되어 있습니다.");
	            //update.jsp에 에러메시지가 뜨고 제대로 된 값이 입력해도 category_id가 null되므로 값을 넘겨준다.
	        	req.setAttribute("rcdto", category);
	        	req.getRequestDispatcher("/rentalAdmin/rentCategoryUpdate.jsp").forward(req, resp);
	            return;
	        }
			
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
