package review.controller;

import java.io.File;
import java.io.IOException;

import dao.SkiReviewDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/review/skiReviewDelete")
public class SkiReviewDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		
		SkiReviewDao skiReivewDao = new SkiReviewDao();
		
		String path = req.getServletContext().getRealPath("/reviewImgs");
		String reviewfilename = skiReivewDao.updateSelect(review_id).getReview_img();
		File f = new File(path + File.separator + reviewfilename);
		f.delete();
		
		int n = skiReivewDao.delete(review_id);
		
		req.setAttribute("content", "reviews");
		req.getRequestDispatcher("/mypage/layout.jsp").forward(req, resp);
		
//		resp.sendRedirect(req.getContextPath() + "/jsp/reviewList");
	}
}
