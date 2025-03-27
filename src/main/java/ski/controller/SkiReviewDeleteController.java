package ski.controller;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ski.dao.SkiReviewDao;

@WebServlet("/review/skiReviewDelete")
public class SkiReviewDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(req.getParameter("review_id"));
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		
		SkiReviewDao skiReivewDao = new SkiReviewDao();
		
		String path = req.getServletContext().getRealPath("/reviewImgs");
		String reviewfilename = skiReivewDao.updateSelect(review_id).getReview_img();
		File f = new File(path + File.separator + reviewfilename);
		f.delete();
		
		int n = skiReivewDao.delete(review_id);
		
		resp.sendRedirect(req.getContextPath() + "/mypage/reviews");
	}
}
