package reviews.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import reviews.dao.ResortReviewsDAO;
import reviews.dto.ResortReviewsDTO;

@MultipartConfig (
		maxFileSize = 1024 * 1024 * 10
	)

@WebServlet("/jsp/reviewList")
public class ResortReviewsListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ResortReviewsDAO rrDao = new ResortReviewsDAO();
		List<ResortReviewsDTO> rrList = rrDao.reviewList();
		
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
		//리조트 리뷰 전체 조회
		req.setAttribute("rrList", rrList);
		req.getRequestDispatcher("/jsp/reviewList.jsp").forward(req, resp);
		
	    }

}
