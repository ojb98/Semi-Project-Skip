package review.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import dao.ResortReviewDao;
import dto.ResortReviewDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@MultipartConfig (
		maxFileSize = 1024 * 1024 * 10
	)

@WebServlet("/review/resortReviewUpdate")
public class ResortReviewUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		System.out.println(review_id);
		
		ResortReviewDao resortReviewDao = new ResortReviewDao();
		ResortReviewDTO resortReviewDto = resortReviewDao.updateSelect(review_id);
		
		if(resortReviewDto!=null) {
			req.setAttribute("resortReviewDto", resortReviewDto);
			req.getRequestDispatcher("/review/resortReviewUpdate.jsp").forward(req, resp);
		} else {
			req.setAttribute("result", "not found");
			req.getRequestDispatcher("/review/resortReviewUpdate.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		int payment_id = Integer.parseInt(req.getParameter("payment_id"));
		int uuid = Integer.parseInt(req.getParameter("uuid"));
		String user_id = req.getParameter("user_id");
		int resort_id = Integer.parseInt(req.getParameter("resort_id"));
		float rating  = Float.parseFloat(req.getParameter("rating"));
		String resort_comment = req.getParameter("resort_comment");
		String review_img = req.getParameter("review_img");
		System.out.println("리뷰아이디:" + review_id);
		System.out.println("결제아이디:" + payment_id);
		System.out.println("uuid:" + uuid);
		System.out.println("회원아이디:" + user_id);
		System.out.println("리조트아이디:" + resort_id);
		System.out.println("별점:" + rating);
		System.out.println("리뷰내용:" + resort_comment);
		System.out.println("리뷰이미지:" + review_img);
		
		ResortReviewDao resortReviewDao = new ResortReviewDao();
		ResortReviewDTO resortReviewDto = resortReviewDao.updateSelect(review_id);
		
		String saveFilename=resortReviewDto.getReview_img(); //기존 이미지명
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
		
		
		//rrDto = new ResortReviewsDTO(review_id, payment_id, uuid, resort_id, rating, resort_comment, saveFilename, null, user_id);
		resortReviewDto = new ResortReviewDTO(review_id, payment_id, uuid, resort_id, rating, resort_comment, saveFilename, null, user_id);
		int n = resortReviewDao.update(resortReviewDto);
		
		resp.sendRedirect(req.getContextPath() + "/jsp/reviewList");
		
	}
}
