package rentalAdmin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import rental.dto.RentCategoryDTO;
import rental.dto.RentItemDTO;
import rentalAdmin.dao.RentCategoryDao;
import rentalAdmin.dao.RentItemDao;
import resort.dto.RoomDTO;

@WebServlet("/adminItemCategory/update")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 50
)
public class ItemCategoryUpdateController extends HttpServlet {
	private RentCategoryDao rcdao=RentCategoryDao.getInstance();
	private RentItemDao ridao=RentItemDao.getInstance();
	private static final int SUCCESS_THRESHOLD = 0;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int itemId=Integer.parseInt(req.getParameter("item_id"));
		
		//카테고리 전체 조회
		List<RentCategoryDTO> rclist=rcdao.categoryList();
		
		//장비유형 조회하기
		RentItemDTO ridto=ridao.getItemId(itemId);
		
		req.setAttribute("rclist", rclist);
		req.setAttribute("ridto", ridto);
		
		req.getRequestDispatcher("/rentalAdmin/itemCategoryUpdate.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//라디오 선택한 카테고리 값
		int categoryId=Integer.parseInt(req.getParameter("category_id"));

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
			itemImg=UUID.randomUUID() + "_" + part.getSubmittedFileName();
			
			FileOutputStream fos=new FileOutputStream(itemPath+ File.separator + itemImg);
			InputStream is=part.getInputStream();
			is.transferTo(fos);
			
			is.close();
			fos.close();
		}else {
			
		}
		
		//장비유형 db수정하기
		RentItemDTO itemDto=new RentItemDTO(itemId,categoryId,rentalshop_id,item_name,item_detail,quantity,itemImg,null);
		System.out.println("itemDTO :"+ itemDto);
		ridao.itemUpdate(itemDto);
		System.out.println("렌탈샵고유아이디:"+ rentalshop_id);
		resp.sendRedirect(req.getContextPath()+"/adminRental/detail?rentalshop_id="+rentalshop_id);
		
	}
}
