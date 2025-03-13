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
		int reviewId = Integer.parseInt(req.getParameter("reviewId"));
		
		ResortReviewsDAO rrDao = new ResortReviewsDAO();
		
		String path = req.getServletContext().getRealPath("/reviewImgs");
		String reviewfilename = rrDao.updateSelect(reviewId).getReviewImg();
		File f = new File(path + File.separator + reviewfilename);
		f.delete();
		
		int n = rrDao.delete(reviewId);
		
		resp.sendRedirect(req.getContextPath() + "/jsp/reviewList");
	}
}
