package skiAdmin.controller;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ski.dao.SkiReviewDao;
@WebServlet("/skiAdmin/reviewDelete")
public class SkiAdminReviewDelete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		
		SkiReviewDao skiReviewDao = new SkiReviewDao();
		
		String path = req.getServletContext().getRealPath("/reviewImgs");
		String reviewfilename = skiReviewDao.updateSelect(review_id).getReview_img();
		File f = new File(path + File.separator + reviewfilename);
		f.delete();
		
		int n = skiReviewDao.delete(review_id);
		
		resp.sendRedirect(req.getContextPath() + "/skiAdmin/skiAdminReview");
	}
}
