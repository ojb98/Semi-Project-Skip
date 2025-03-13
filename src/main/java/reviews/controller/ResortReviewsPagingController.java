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

@WebServlet("/review/list")
public class ResortReviewsPagingController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 int pageNum = 1;
	        String page = req.getParameter("pageNum");

	        if (page != null) {
	            pageNum = Integer.parseInt(page);
	        }

	        ResortReviewsDAO rrDao = new ResortReviewsDAO();
	        int totalReviews = rrDao.getCount(); // 전체 리뷰 개수
	        int pageCount = (int) Math.ceil(totalReviews / 10.0);
	        
	        if (pageNum > pageCount) pageNum = pageCount;

	        int startRow = (pageNum - 1) * 10 + 1;
	        int endRow = startRow + 9; // 수정된 부분 (10개 가져오도록)

	        int startPage = ((pageNum - 1) / 10) * 10 + 1;
	        int endPage = startPage + 9;
	        if (endPage > pageCount) {
	            endPage = pageCount;
	        }

	        List<ResortReviewsDTO> rrList = rrDao.pageList(startRow, endRow);

	        // JSON 변환
	        JSONArray arr = new JSONArray();
	        for (ResortReviewsDTO review : rrList) {
	            JSONObject obj = new JSONObject();
	            obj.put("reviewId", review.getReviewId());
	            obj.put("uuid", review.getUuid());
	            obj.put("createdAt", review.getCreatedAt());
	            obj.put("rating", review.getRating());
	            obj.put("resortComment", review.getResortComment());
	            obj.put("reviewImg", review.getReviewImg());
	            arr.put(obj);
	        }

	        JSONObject json = new JSONObject();
	        json.put("list", arr);
	        json.put("pageCount", pageCount);
	        json.put("startPage", startPage);
	        json.put("endPage", endPage);
	        json.put("pageNum", pageNum);

	        // JSON 응답 설정
	        resp.setContentType("application/json;charset=utf-8");
	        PrintWriter pw = resp.getWriter();
	        pw.print(json);
	        pw.close();
	    }

}
