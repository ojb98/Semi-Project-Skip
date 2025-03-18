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
		int reviewId = Integer.parseInt(req.getParameter("reviewId"));
		System.out.println(reviewId);
		
		ResortReviewsDAO rrDao = new ResortReviewsDAO();
		ResortReviewsDTO rrDto = rrDao.updateSelect(reviewId);
		
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
		int reviewId = Integer.parseInt(req.getParameter("reviewId"));
		int paymentId = Integer.parseInt(req.getParameter("paymentId"));
		int uuid = Integer.parseInt(req.getParameter("uuid"));
		int resortId = Integer.parseInt(req.getParameter("resortId"));
		double rating  = Double.parseDouble(req.getParameter("rating"));
		String resortComment = req.getParameter("resortComment");
		String reviewImg = req.getParameter("reviewImg");
		System.out.println("리뷰아이디:" + reviewId);
		System.out.println("결제아이디:" + paymentId);
		System.out.println("사용자아이디:" + uuid);
		System.out.println("리조트아이디:" + resortId);
		System.out.println("별점:" + rating);
		System.out.println("리뷰내용:" + resortComment);
		System.out.println("리뷰이미지:" + reviewImg);
		
		ResortReviewsDAO rrDao = new ResortReviewsDAO();
		ResortReviewsDTO rrDto = rrDao.updateSelect(reviewId);
		System.out.println("DAO:" + rrDao);
		System.out.println("DTO:" + rrDto);
		
		String saveFilename=rrDto.getReviewImg(); //기존 이미지명
		System.out.println(saveFilename);
		
		Part part = req.getPart("reviewImg"); // input 태그 name="reviewImg" 확인
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
		
		
		rrDto = new ResortReviewsDTO(reviewId, paymentId, uuid, resortId, rating, resortComment, saveFilename, null);
		int n = rrDao.update(rrDto);
		
		resp.sendRedirect(req.getContextPath() + "/jsp/reviewList");
		
	}
}
