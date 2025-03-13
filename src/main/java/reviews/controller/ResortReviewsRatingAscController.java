package reviews.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import reviews.dao.ResortReviewsDAO;
import reviews.dto.ResortReviewsDTO;
@WebServlet("/jsp/reviewAsc")
public class ResortReviewsRatingAscController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ResortReviewsDAO rrDao = new ResortReviewsDAO();
		List<ResortReviewsDTO> rrList = rrDao.reviewAsc();
		
		//총 리뷰 개수
		int reviewCount = rrList.size();
		
		//평균 평점 계산
		double totalRating = 0;
		for(ResortReviewsDTO review : rrList) {
			totalRating += review.getRating();
		}
		
		double avgRating = (rrList.size() > 0) ? totalRating / rrList.size() : 0;
		
		req.setAttribute("reviewList", rrList);
		req.setAttribute("reviewCount", reviewCount);
		req.setAttribute("avgRating",Math.round(avgRating * 100) / 100.0);
		req.setAttribute("rrList", rrList);
		req.getRequestDispatcher("/jsp/reviewList.jsp").forward(req, resp);
	}
}
