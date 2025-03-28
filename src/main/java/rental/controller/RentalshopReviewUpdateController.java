package rental.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import rental.dao.RentalShopReviewDao;
import rental.dto.RentalShopReviewDTO;


@MultipartConfig (
		maxFileSize = 1024 * 1024 * 10
	)

@WebServlet("/review/rentalshopReviewUpdate")
public class RentalshopReviewUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		System.out.println(review_id);
		
		RentalShopReviewDao rentalshopReviewDao = new RentalShopReviewDao();
		RentalShopReviewDTO rentalshopReviewDtO = rentalshopReviewDao.updateSelect(review_id);
		System.out.println(rentalshopReviewDtO);
		
		if(rentalshopReviewDtO != null) {
			req.setAttribute("rentalshopReviewDto", rentalshopReviewDtO);
			req.getRequestDispatcher("/review/rentalshopReviewUpdate.jsp").forward(req, resp);
		} else {
			req.setAttribute("result", "not found");
			req.getRequestDispatcher("/review/rentalshopReviewUpdate.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		int payment_id = Integer.parseInt(req.getParameter("payment_id"));
		int uuid = Integer.parseInt(req.getParameter("uuid"));
		String user_id = req.getParameter("user_id");
		int rentalshop_id = Integer.parseInt(req.getParameter("rentalshop_id"));
		float rating  = Float.parseFloat(req.getParameter("rating"));
		String review_comment = req.getParameter("review_comment");
		String review_img = req.getParameter("review_img");
		
		RentalShopReviewDao rentalshopReviewDao = new RentalShopReviewDao();
		RentalShopReviewDTO rentalshopReviewDtO = rentalshopReviewDao.updateSelect(review_id);
		
		String saveFilename=rentalshopReviewDtO.getReview_img(); //기존 이미지명
		System.out.println(saveFilename);
		
		Part part = req.getPart("review_img"); // input 태그 name="review_img" 확인
		String newFilename = part.getSubmittedFileName(); //새파일명
		
		String path = req.getServletContext().getRealPath("/reviewImgs"); //파일 저장 경로
		if(newFilename != null && !newFilename.isEmpty()) {
			File delFile = new File(path + File.separator + saveFilename);
			delFile.delete();
			
			saveFilename = UUID.randomUUID() +"_" + newFilename;
			FileOutputStream fos = new FileOutputStream(path + File.separator + saveFilename);
			InputStream is = part.getInputStream();
			is.transferTo(fos);
			
			is.close();
			fos.close();
		} else {
			//수정 파일이 전송 안되면 기존 파일 유지
			if (saveFilename == null || saveFilename.isEmpty()) {
		        saveFilename = ""; // 기존 이미지도 없을 경우 빈 문자열 설정
		    }
		}
		
		rentalshopReviewDtO = new RentalShopReviewDTO(review_id, payment_id, uuid, rentalshop_id, rating, review_comment, saveFilename, null, user_id);
		int n = rentalshopReviewDao.update(rentalshopReviewDtO);
		
		req.setAttribute("content", "reviews");
		req.getRequestDispatcher(req.getContextPath() + "/mypage/layout.jsp");
		
//		resp.sendRedirect(req.getContextPath() + "/jsp/reviewList");
		
	}
}
