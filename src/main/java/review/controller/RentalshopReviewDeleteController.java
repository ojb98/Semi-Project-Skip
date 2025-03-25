package review.controller;

import java.io.File;
import java.io.IOException;

import dao.RentalshopReviewDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/review/rentalshopReviewDelete")
public class RentalshopReviewDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		System.out.println(review_id);
		
		RentalshopReviewDao rentalshopReviewDao = new RentalshopReviewDao();
		
		String path = req.getServletContext().getRealPath("/reviewImgs");
		String reviewfilename = rentalshopReviewDao.updateSelect(review_id).getReview_img();
		File f = new File(path + File.separator + reviewfilename);
		f.delete();
		
		int n = rentalshopReviewDao.delete(review_id);
		
		resp.sendRedirect(req.getContextPath() + "/mypage/reviews");
	}
}
