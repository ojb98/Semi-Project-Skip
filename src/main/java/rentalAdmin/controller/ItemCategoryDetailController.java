package rentalAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rental.dto.ItemCategoryListDTO;
import rentalAdmin.dao.RentCategoryDao;
import resort.dto.RoomDTO;

@WebServlet("/adminItemCategory/detail")
public class ItemCategoryDetailController extends HttpServlet {
	private RentCategoryDao rcdao=RentCategoryDao.getInstance();
	private static final int PAGE_SIZE = 3; // 페이지당 3개씩 표시
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rentalId=Integer.parseInt(req.getParameter("rentalshop_id"));
		int page = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		
		List<ItemCategoryListDTO> itemesList=rcdao.itemCategoryList(rentalId);
		
		//페이징 처리
		
		req.setAttribute("list", itemesList);
		
		System.out.println("카테고리&장비유형 조인:"+itemesList);
		
		req.getRequestDispatcher("/rentalAdmin/itemCategoryInfo.jsp").forward(req, resp);
	}
}
