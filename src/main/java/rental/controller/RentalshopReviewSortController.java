package rental.controller;

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
import rental.dao.RentalShopReviewDao;
import rental.dto.RentalShopReviewDTO;

@WebServlet("/rentalshop/review")
public class RentalshopReviewSortController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sortType = req.getParameter("sort"); //정렬 기준 가져오기
		String page = req.getParameter("pageNum");
		int rentalshop_id = Integer.parseInt(req.getParameter("rentalshop_id"));
		System.out.println("rentalshop_id: " + req.getParameter("rentalshop_id"));
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
		
		RentalShopReviewDao rentalshopReviewDao = new RentalShopReviewDao();
		int totalReviews = rentalshopReviewDao.getCount(rentalshop_id); //전체 리뷰 개수
		int pageCount = (int)Math.ceil(totalReviews / 10.0); // 글 10개씩 페이지에 보이기
		
		if(pageNum > pageCount) pageNum = pageCount;
		
		int startRow = (pageNum - 1) * 10 + 1;
		int endRow = startRow + 9;
		
		int startPage = ((pageNum - 1) / 10) * 10 + 1;
		int endPage = startPage + 9;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		List<RentalShopReviewDTO> rentalshopReviewList = rentalshopReviewDao.reviewArray(rentalshop_id, sortType, startRow, endRow);
		
		JSONObject json = new JSONObject();
		JSONArray arr = new JSONArray(rentalshopReviewList);
		
		json.put("list", arr);
		json.put("pageCount", pageCount);
		json.put("startPage", startPage);
		json.put("endPage", endPage);
		json.put("pageNum", pageNum);
		json.put("rentalshop_id", rentalshop_id);
		
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.print(json);
		pw.close();
	}
}
