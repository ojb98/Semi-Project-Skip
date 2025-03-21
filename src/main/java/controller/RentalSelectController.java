package controller;

import dao.RentalShopDao;
import dao.RentalshopReviewDao;
import dao.SkiDao;
import dao.SkiReviewDao;
import dto.RentalShopDTO;
import dto.RentalshopReviewDTO;
import dto.SkiReviewDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/rental/rentalShop")
public class RentalSelectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println(req.getParameter("ski_id"));
    	System.out.println(req.getParameter("rentalshop_id"));
    	
    	String sortType = req.getParameter("sort");
    	
        RentalShopDao rentalShopDao = new RentalShopDao();
        SkiDao skiDao = new SkiDao();
        System.out.println(req.getParameter("isRentalOrSki"));
        String isRentalOrSki = req.getParameter("isRentalOrSki");
        if (isRentalOrSki != null && isRentalOrSki.equalsIgnoreCase("RENTAL")) {
        	int rentalshop_id = Integer.parseInt(req.getParameter("rentalshop_id"));
        	
            req.setAttribute("dto", rentalShopDao.getRentalShop(Integer.parseInt(req.getParameter("rentalshop_id"))));
            
            RentalshopReviewDao rentalshopReviewDao = new RentalshopReviewDao();
            List<RentalshopReviewDTO> rentalshopReviewList = rentalshopReviewDao.reviewList(rentalshop_id);
            
            req.setAttribute("reviewList", rentalshopReviewList);
            
            //총 리뷰 개수
      		int rentalshopReviewCount = rentalshopReviewList.size();
      		
      		//평균 평점 계산
      		double totalRating = 0;
      		for(RentalshopReviewDTO review : rentalshopReviewList) {
      			totalRating += review.getRating();
      		}
      		double avgRating = (rentalshopReviewList.size() > 0) ? totalRating / rentalshopReviewList.size() : 0;
            
      		req.setAttribute("rentalshop_id", rentalshop_id);
      		req.setAttribute("reviewList", rentalshopReviewList);
      		req.setAttribute("reviewCount", rentalshopReviewCount);
    		req.setAttribute("avgRating",Math.round(avgRating * 100) / 100.0);
    		req.setAttribute("rentalshopReviewList", rentalshopReviewList);
      		
        } else if (isRentalOrSki != null && isRentalOrSki.equalsIgnoreCase("SKI")) {
        	int ski_id = Integer.parseInt(req.getParameter("ski_id"));
        	
            req.setAttribute("dto", skiDao.getSki(Integer.parseInt(req.getParameter("ski_id"))));
            
            
            SkiReviewDao skiReviewDao = new SkiReviewDao();
            List<SkiReviewDTO> skiReviewList = skiReviewDao.reviewList(ski_id);
            
            req.setAttribute("reviewList", skiReviewList);
            
            //총 리뷰 개수
      		int skiReviewCount = skiReviewList.size();
      		
      		//평균 평점 계산
      		double totalRating = 0;
      		for(SkiReviewDTO review : skiReviewList) {
      			totalRating += review.getRating();
      		}
      		double avgRating = (skiReviewList.size() > 0) ? totalRating / skiReviewList.size() : 0;
            
      		req.setAttribute("ski_id", ski_id);
      		req.setAttribute("reviewList", skiReviewList);
      		req.setAttribute("reviewCount", skiReviewCount);
    		req.setAttribute("avgRating",Math.round(avgRating * 100) / 100.0);
    		req.setAttribute("skiReviewList", skiReviewList);
        }
        
        req.setAttribute("isRentalOrSki", isRentalOrSki);
        req.getRequestDispatcher("/rental/rentalShop.jsp").forward(req, resp);
    }

}
