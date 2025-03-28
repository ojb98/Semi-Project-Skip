package skiAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ski.dao.SkiReviewDao;
import ski.dto.SkiReviewDTO;
import users.dto.UsersDto;
@WebServlet("/skiAdmin/skiAdminReview")
public class SkiAdminReviewPaging extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		UsersDto user  = (UsersDto)session.getAttribute("user");
		int uuid = user.getUuid();
		System.out.println("user:" + user);
		System.out.println("uuid:" + uuid);
		
		SkiReviewDao skiReviewDao = new SkiReviewDao();
		SkiReviewDTO skiReviewDto = skiReviewDao.getSkiIdByReview(uuid);
		
		int ski_id = skiReviewDto.getSki_id();
		System.out.println("스키아이디:" + ski_id);
		
		int pageNum = 1;
		String page = req.getParameter("pageNum");
		
		if(page != null) {
			pageNum = Integer.parseInt(page);
		}
		
		int totalReviews = skiReviewDao.getCount(ski_id);
		int pageCount = (int) Math.ceil(totalReviews / 10.0);
		
		if(pageNum > pageCount) pageNum = pageCount;
		
		int startRow = (pageNum - 1) * 10 + 1;
		int endRow = startRow + 9;
		
		int startPage = ((pageNum -1) / 10) * 10 + 1;
		int endPage = startPage + 9;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		float avgReviews = skiReviewDao.getAverage(ski_id);
		avgReviews = (totalReviews > 0) ? avgReviews : 0;
		System.out.println(avgReviews);
		
		//정렬
		String sortType = req.getParameter("sort");
		
		if (sortType == null || sortType.isEmpty()) {
            sortType = "latest";  
        } else if (sortType.equals("ratingDesc")) {
        	sortType = "ratingDesc";
        } else if (sortType.equals("ratingAsc")) {
        	sortType = "ratingAsc";
        }
		
		System.out.println(sortType);
		
		List<SkiReviewDTO> skiReviewList = skiReviewDao.reviewArray(ski_id, sortType, startRow, endRow);
		
		req.setAttribute("totalReviews", totalReviews);
		req.setAttribute("avgReviews", avgReviews);
		
		req.setAttribute("skiReviewList", skiReviewList);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageNum", pageNum);
		req.getRequestDispatcher("/skiAdmin/skiAdminReview.jsp").forward(req, resp);
		
	}
}
