package review.controller;

import java.io.File;
import java.io.IOException;

import dao.ResortReviewDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/review/resortReviewDelete")
public class ResortReviewDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		System.out.println(review_id);
		
		ResortReviewDao resortReviewDao = new ResortReviewDao();
		
		String path = req.getServletContext().getRealPath("/reviewImgs");
		String reviewfilename = resortReviewDao.updateSelect(review_id).getReview_img();
		File f = new File(path + File.separator + reviewfilename);
		f.delete();
		
		int n = resortReviewDao.delete(review_id);
		
		req.setAttribute("content", "reviews");
		req.getRequestDispatcher("/mypage/layout.jsp").forward(req, resp);
	}
}
