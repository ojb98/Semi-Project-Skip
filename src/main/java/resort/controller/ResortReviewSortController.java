package resort.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dao.ResortReviewDao;
import resort.dto.ResortReviewDTO;

@WebServlet("/resort/review")
public class ResortReviewSortController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sortType = req.getParameter("sort"); //정렬 기준 가져오기
		String page = req.getParameter("pageNum");
		int resort_id = Integer.parseInt(req.getParameter("resort_id"));
		System.out.println("resort_id: " + req.getParameter("resort_id"));
		System.out.println("sort: " + req.getParameter("sort"));
		System.out.println("pageNum: " + req.getParameter("pageNum"));
		
		if (sortType == null || sortType.isEmpty()) {
            sortType = "latest";  
        } else if (sortType.equals("ratingDesc")) {
        	sortType = "ratingDesc";
        } else if (sortType.equals("ratingAsc")) {
        	sortType = "ratingAsc";
        }
		
		int pageNum = 1; //기본 1페이지
		if(page != null) {
			pageNum = Integer.parseInt(page);
		}
		
		ResortReviewDao resortReviewDao = new ResortReviewDao();
		int totalReviews = resortReviewDao.getCount(resort_id); //전체 리뷰 개수
		int pageCount = (int)Math.ceil(totalReviews / 10.0); // 글 10개씩 페이지에 보이기
		
		if(pageNum > pageCount) pageNum = pageCount;
		
		int startRow = (pageNum - 1) * 10 + 1;
		int endRow = startRow + 9;
		
		int startPage = ((pageNum - 1) / 10) * 10 + 1;
		int endPage = startPage + 9;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		List<ResortReviewDTO> resortReviewList = resortReviewDao.reviewArray(resort_id ,sortType, startRow, endRow);
		
		JSONObject json = new JSONObject();
		JSONArray arr = new JSONArray(resortReviewList);
		
		json.put("list", arr);
		json.put("pageCount", pageCount);
		json.put("startPage", startPage);
		json.put("endPage", endPage);
		json.put("pageNum", pageNum);
		json.put("resort_id", resort_id);
		
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.print(json);
		pw.close();
	}
}
