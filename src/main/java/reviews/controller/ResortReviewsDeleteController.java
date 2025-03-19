package reviews.controller;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import reviews.dao.ResortReviewsDAO;
@WebServlet("/jsp/delete")
public class ResortReviewsDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		
		ResortReviewsDAO rrDao = new ResortReviewsDAO();
		
		String path = req.getServletContext().getRealPath("/reviewImgs");
		String reviewfilename = rrDao.updateSelect(review_id).getReview_img();
		File f = new File(path + File.separator + reviewfilename);
		f.delete();
		
		int n = rrDao.delete(review_id);
		
		resp.sendRedirect(req.getContextPath() + "/jsp/reviewList");
	}
}
