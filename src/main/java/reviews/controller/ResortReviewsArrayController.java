package reviews.controller;

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
import reviews.dao.ResortReviewsDAO;
import reviews.dto.ResortReviewsDTO;
@WebServlet("/review/array")
public class ResortReviewsArrayController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sortType = req.getParameter("sort"); //정렬 기준 가져오기
		
		if (sortType == null || sortType.isEmpty()) {
            sortType = "latest";  
        } else if (sortType.equals("ratingDesc")) {
        	sortType = "ratingDesc";
        } else if (sortType.equals("ratingAsc")) {
        	sortType = "ratingAsc";
        }
		
		ResortReviewsDAO rrDao = new ResortReviewsDAO();
		List<ResortReviewsDTO> rrList = rrDao.arrayReviews(sortType);
		
		JSONObject json = new JSONObject();
		JSONArray arr = new JSONArray(rrList); //전체 리스트를 가져오려면 ()안에 rrList를 넣고 for문을 돌리지 않아도 된다.
		
		//해당 for문에서 원하는 값들을 별도로 put할 수 있다.
//		for(ResortReviewsDTO review:rrList) {
//			JSONObject reviewJson = new JSONObject();
//			reviewJson.put("uuid", review.getUuid());
//			reviewJson.put("rating", review.getRating());
//			reviewJson.put("content", review.getResortComment());
//			arr.put(reviewJson);
//		}
		
		json.put("list", arr);
		
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.print(json);
		pw.close();
	}
}
