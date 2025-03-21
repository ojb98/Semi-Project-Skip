package rentalAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rental.dto.RentItemDTO;
import rentalAdmin.dao.RentCategoryDao;
import rentalAdmin.dao.RentItemDao;

@WebServlet("/adminRentCategory/delete")
public class RentCategoryDelController extends HttpServlet {
	private RentItemDao ridao=RentItemDao.getInstance();
	private RentCategoryDao rcdao=RentCategoryDao.getInstance();
	private static final int SUCCESS_THRESHOLD = 0;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//먼저 (카테고리로)조회해서 없으면 삭제 있으면 삭제 안되게 막기
		int categoryId=Integer.parseInt(req.getParameter("category_id"));
		
		List<RentItemDTO> ridto=ridao.itemCategoryids(categoryId);
		
		if(ridto!=null && !ridto.isEmpty()) { //데이터가 존재한다면 수정하지않기
			req.getSession().setAttribute("errMsg", "해당 카테고리를 사용중이므로 삭제할 수 없습니다.");
			resp.sendRedirect(req.getContextPath() + "/adminRentCategory/list");
			return;
	
		}else { //삭제처리하기
			int n=rcdao.categoryDelete(categoryId);

			if(n>SUCCESS_THRESHOLD) {
				System.out.println("카테고리 삭제성공");
			}else {
				System.out.println("카테고리 삭제실패");
			}
		}
		
		resp.sendRedirect(req.getContextPath()+"/adminRentCategory/list");
		
	}
}
