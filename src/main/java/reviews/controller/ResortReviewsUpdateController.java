package reviews.controller;

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
import reviews.dao.ResortReviewsDAO;
import reviews.dto.ResortReviewsDTO;

@MultipartConfig (
		maxFileSize = 1024 * 1024 * 10
	)

@WebServlet("/jsp/update")
public class ResortReviewsUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		System.out.println(review_id);
		
		ResortReviewsDAO rrDao = new ResortReviewsDAO();
		ResortReviewsDTO rrDto = rrDao.updateSelect(review_id);
		
		if(rrDto!=null) {
			req.setAttribute("rrDto", rrDto);
			req.getRequestDispatcher("/jsp/reviewUpdate.jsp").forward(req, resp);
		} else {
			req.setAttribute("result", "not found");
			req.getRequestDispatcher("/jsp/reviewUpdate.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		int payment_id = Integer.parseInt(req.getParameter("payment_id"));
		int uuid = Integer.parseInt(req.getParameter("uuid"));
		int resort_id = Integer.parseInt(req.getParameter("resort_id"));
		double rating  = Double.parseDouble(req.getParameter("rating"));
		String resort_comment = req.getParameter("resort_comment");
		String review_img = req.getParameter("review_img");
		System.out.println("리뷰아이디:" + review_id);
		System.out.println("결제아이디:" + payment_id);
		System.out.println("사용자아이디:" + uuid);
		System.out.println("리조트아이디:" + resort_id);
		System.out.println("별점:" + rating);
		System.out.println("리뷰내용:" + resort_comment);
		System.out.println("리뷰이미지:" + review_img);
		
		ResortReviewsDAO rrDao = new ResortReviewsDAO();
		ResortReviewsDTO rrDto = rrDao.updateSelect(review_id);
		System.out.println("DAO:" + rrDao);
		System.out.println("DTO:" + rrDto);
		
		String saveFilename=rrDto.getReview_img(); //기존 이미지명
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
		
		
		rrDto = new ResortReviewsDTO(review_id, payment_id, uuid, resort_id, rating, resort_comment, saveFilename, null);
		int n = rrDao.update(rrDto);
		
		resp.sendRedirect(req.getContextPath() + "/jsp/reviewList");
		
	}
}
