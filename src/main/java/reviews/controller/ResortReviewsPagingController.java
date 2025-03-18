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



@WebServlet("/review/list3")
public class ResortReviewsPagingController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//db내역 확인 경로
		//http://localhost:8081/Semi_Project_Skip/review/list
		//기본 페이지
		int pageNum = 1;
        String page = req.getParameter("pageNum");
        
        //페이지가 없을 때 기본 1페이지가 나오도록
        if (page != null) {
            pageNum = Integer.parseInt(page);
        }
        
        ResortReviewsDAO rrDao = new ResortReviewsDAO();
        int totalReviews = rrDao.getCount(); // 전체 리뷰 개수
        int pageCount = (int)Math.ceil(totalReviews / 10.0); //페이지 갯수 글 10개씩 보이도록
        
        if (pageNum > pageCount) pageNum = pageCount; //전체페이지보다 현제페이지가 크면 전체 페이지의 값을 현제페이지의 값으로 넣어준다.

        int startRow = (pageNum - 1) * 10 + 1;
        int endRow = startRow + 9;

        int startPage = ((pageNum - 1) / 10) * 10 + 1; //시작페이지
        int endPage = startPage + 9; //끝페이지
        if (endPage > pageCount) {
            endPage = pageCount;
        }

        List<ResortReviewsDTO> rrList = rrDao.pageList(startRow, endRow);

        // JSON 변환
        JSONArray arr = new JSONArray(rrList);
//        JSONArray arr = new JSONArray();
//        for (ResortReviewsDTO review : rrList) {
//            JSONObject obj = new JSONObject();
//            obj.put("reviewId", review.getReviewId());
//            obj.put("uuid", review.getUuid());
//            obj.put("createdAt", review.getCreatedAt());
//            obj.put("rating", review.getRating());
//            obj.put("resortComment", review.getResortComment());
//            obj.put("reviewImg", review.getReviewImg());
//            arr.put(obj);
//        }

        JSONObject json = new JSONObject();
        //페이징처리에 관련된 데이터 json에 담기
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
