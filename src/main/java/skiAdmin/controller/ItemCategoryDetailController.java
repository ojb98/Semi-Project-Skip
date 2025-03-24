package skiAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rentalAdmin.dao.RentCategoryDao;
import ski.dto.SkiItemCategoryListDTO;

@WebServlet("/adminSkiItemCategory/detail")
public class ItemCategoryDetailController extends HttpServlet{
	private RentCategoryDao rcdao=RentCategoryDao.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int skiId=Integer.parseInt(req.getParameter("ski_id"));
		int page = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		
		List<SkiItemCategoryListDTO> itemesList=rcdao.SkiItemCategoryList(skiId);
		
		//페이징 처리
		
		req.setAttribute("list", itemesList);
		
		System.out.println("카테고리&장비유형 조인:"+itemesList);
		
		req.getRequestDispatcher("/skiAdmin/itemCategoryInfo.jsp").forward(req, resp);
	}
}
