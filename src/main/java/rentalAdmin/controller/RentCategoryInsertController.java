package rentalAdmin.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rental.dto.RentCategoryDTO;
import rentalAdmin.dao.RentCategoryDao;

@WebServlet("/adminRentCategory/insert")
public class RentCategoryInsertController extends HttpServlet {
	private RentCategoryDao rcdao=RentCategoryDao.getInstance();
	private static final int SUCCESS_THRESHOLD = 0;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/rentalAdmin/rentCategoryInsertForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String itemType=req.getParameter("item_type");
		int price=Integer.parseInt(req.getParameter("price_per_hour"));
		
		RentCategoryDTO rcdto=new RentCategoryDTO(0,itemType,price);
		
		// DB에서 중복 여부 체크 (같은 item_type과 price_per_hour가 있는지)
        int exists = rcdao.getCategoryExists(rcdto);
        if (exists > 0) {
            //중복인 경우, 에러 메시지를 request에 담고 등록 폼으로 다시 포워딩
        	req.getSession().setAttribute("errMsg", "동일한 장비종류와 시간당 대여가격이 이미 등록되어 있습니다.");
            req.getRequestDispatcher("/rentalAdmin/rentCategoryInsertForm.jsp").forward(req, resp);
            return;
        }

		
		int n=rcdao.categoryInsert(rcdto);

		if(n > SUCCESS_THRESHOLD) {
			System.out.println("카테고리등록 완료");
		}else {
			System.out.println("카테고리등록 실패");
		}
		
		resp.sendRedirect(req.getContextPath()+"/adminRental/list");
		
	}
}
