package rentalAdmin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rental.dto.RentItemDTO;
import rental.dto.RentalShopDTO;
import rentalAdmin.dao.RentItemDao;
import rentalAdmin.dao.RentalShopDao;
import resort.dto.ResortDTO;
import resort.dto.RoomDTO;

@WebServlet("/adminRental/delete")
public class RentalShopDelController extends HttpServlet{
	private static final int SUCCESS_THRESHOLD = 0;
	private RentItemDao ridao=RentItemDao.getInstance();
	private RentalShopDao rsdao=RentalShopDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//렌탈샵과 렌탈샵 장비유형을 같이 삭제작업
		
		
		int rentalId = Integer.parseInt(req.getParameter("rentalshop_id"));

	     //경로 얻어오기
	     ServletContext application = req.getServletContext();
	     String rentalPath = application.getRealPath("/rentalImg");  //렌탈샵 이미지경로
	     String itemPath = application.getRealPath("/rentItemImg");   //장비유형 이미지경로

	     //렌탈샵에 모든 장비유형 조회후, 모든 장비유형 이미지 삭제
	     List<RentItemDTO> itemList = ridao.getItemList(rentalId);
	     System.out.println("렌탈샵에 담긴 장비유형정보: " + itemList);
	     if(itemList != null) {
		     for (RentItemDTO item : itemList) {
		    	 deleteFile(itemPath, item.getItem_img());
		     }
	     }
	     
	     //렌탈샵 정보를 조회 후, 렌탈샵 이미지 삭제
	     RentalShopDTO rentalshop = rsdao.getRentalId(rentalId);
	     if(rentalshop !=null) {
	    	 deleteFile(rentalPath, rentalshop.getRemain_img());
		     deleteFile(rentalPath, rentalshop.getResub_img1());
		     deleteFile(rentalPath, rentalshop.getResub_img2());
		     deleteFile(rentalPath, rentalshop.getResub_img3());
	     }
	     
	     //DB에서 렌탈샵과 장비유형 삭제처리
	     ridao.itemListDelete(rentalId);
	     int n = rsdao.rentalDelete(rentalId);
	     
	     
	     if(n > SUCCESS_THRESHOLD) {
	    	 System.out.println("렌탈샵 삭제 성공");
	     }else {
	    	 System.out.println("렌탈샵 삭제 실패");
	     }

	     resp.sendRedirect(req.getContextPath() + "/adminRental/list");
	}

	//파일삭제처리 메소드
	private void deleteFile(String path, String fileName) {
		if(fileName != null && !fileName.trim().isEmpty()) {
			File file = new File(path, fileName);
			if(file.exists()) {
				if(file.delete()){
					System.out.println("이미지삭제 성공");
				} else {
					System.out.println("이미지삭제 실패");
				}
			}
		}
	}
		
		
}
