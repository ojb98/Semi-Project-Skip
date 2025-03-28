package resortAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import resort.dao.ResortReviewDao;
import resort.dto.ResortDTO;
import resort.dto.ResortReviewDTO;
import resortAdmin.dao.ResortDao;
import users.dto.UsersDto;

@WebServlet("/resortAdmin/resortAdminReview")
public class ResortAdminReview extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		UsersDto user  = (UsersDto)session.getAttribute("user");
		int uuid = user.getUuid();
		System.out.println("user:" + user);
		System.out.println("uuid:" + uuid);
		
		ResortReviewDao resortReviewDao = new ResortReviewDao();
		ResortReviewDTO resortReviewDto = resortReviewDao.getResortIdByReview(uuid);
		
		int resort_id = resortReviewDto.getResort_id();
		System.out.println("리조트아이디:" + resort_id);
		
		List<ResortReviewDTO> resortReviewList = resortReviewDao.reviewList(resort_id);
		
		//총 리뷰 개수
		int resortReviewCount = resortReviewList.size();
		
		//평균 평점 계산
		double totalRating = 0;
		for(ResortReviewDTO review : resortReviewList) {
			totalRating += review.getRating();
		}
		
		double resortAvgRating = (resortReviewList.size() > 0) ? totalRating / resortReviewList.size() : 0;
		
		req.setAttribute("resortReviewList", resortReviewList);
		req.setAttribute("resortReviewCount", resortReviewCount);
		req.setAttribute("resortAvgRating", Math.round(resortAvgRating * 100) / 100.0);
		
		req.setAttribute("resortReviewList", resortReviewList);
		req.getRequestDispatcher("/resortAdmin/resortAdminReview.jsp").forward(req, resp);
	}
}
