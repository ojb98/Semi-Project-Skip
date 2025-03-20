package rentalAdmin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import rental.dto.RentItemCategoryDTO;
import rental.dto.RentItemDTO;
import rentalAdmin.dao.RentCategoryDao;
import rentalAdmin.dao.RentItemDao;
import resort.dto.RoomDTO;

@WebServlet("/adminItemCategory/update")
public class ItemCategoryUpdateController extends HttpServlet {
	private RentCategoryDao rcdao=RentCategoryDao.getInstance();
	private RentItemDao ridao=RentItemDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int itemId=Integer.parseInt(req.getParameter("item_id"));
		int categoryId=Integer.parseInt(req.getParameter("category_id"));
		
		//카테고리, 장비유형 조회하기
		RentItemCategoryDTO rcdto=rcdao.getCategoryId(categoryId);
		RentItemDTO ridto=ridao.getItemId(itemId);
		
		req.setAttribute("rcdto", rcdto);
		req.setAttribute("ridto", ridto);
		
		req.getRequestDispatcher("/rentalAdmin/itemCategoryUpdate.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//카테고리 먼저 수정
		int categoryId=Integer.parseInt(req.getParameter("category_id"));
		int price=Integer.parseInt(req.getParameter("price_per_hour"));
		
		//HashMap으로 데이터 담기
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		map.put("categoryId", categoryId);
		map.put("price", price);
		
		//카테고리 db수정하기
		rcdao.categoryMapUpdate(map);
		
		//장비유형 수정
		int itemId=Integer.parseInt(req.getParameter("item_id"));
		int rentalshop_id=Integer.parseInt(req.getParameter("rentalshop_id"));
		String item_name=req.getParameter("item_name");
		String item_detail=req.getParameter("item_detail");
		int quantity=Integer.parseInt(req.getParameter("total_quantity"));
		
		//기존 파일정보
		RentItemDTO ridto=ridao.getItemId(itemId);
		String itemImg=ridto.getItem_img();
		
		//파일정보읽어오기
		Part part=req.getPart("item_img");

		//수정할 파일이 전송될 경우
		if(itemImg !=null && !part.getSubmittedFileName().isEmpty()) {
			String itemPath=req.getServletContext().getRealPath("/rentItemImg");
			
			//기존파일 삭제하기
			File f=new File(itemPath + File.separator + itemImg);
			f.delete();
			
			//새롭게 업로드하기
			String newItemImg=UUID.randomUUID() + "_" + part.getSubmittedFileName();
			
			FileOutputStream fos=new FileOutputStream(itemPath+ File.separator + newItemImg);
			InputStream is=part.getInputStream();
			is.transferTo(fos);
			
			is.close();
			fos.close();
		}else {
			
		}
		
		//장비유형 db수정하기
		

		
	}
}
