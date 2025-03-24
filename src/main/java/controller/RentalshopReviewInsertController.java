package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import dao.RentalshopReviewDao;
import dto.RentalshopReviewDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import reviews.dao.ResortReviewsDAO;
import reviews.dto.ResortReviewsDTO;

@MultipartConfig (
	maxFileSize = 1024 * 1024 * 10
)

@WebServlet("/review/rentalshopReviewInsert")
public class RentalshopReviewInsertController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(req.getParameter("payment_id"));
		System.out.println(req.getParameter("rentalshop_id"));
		int payment_id = Integer.parseInt(req.getParameter("payment_id"));
		int uuid = Integer.parseInt(req.getParameter("uuid"));
		int rentalshop_id = Integer.parseInt(req.getParameter("rentalshop_id"));
		
		req.setAttribute("payment_id", payment_id);
		req.setAttribute("uuid", uuid);
		req.setAttribute("rentalshop_id", rentalshop_id);
		
		req.getRequestDispatcher("/review/rentalshopReviewInsert.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 int payment_id = Integer.parseInt(req.getParameter("payment_id"));
		 int uuid = Integer.parseInt(req.getParameter("uuid"));
		 int rentalshop_id = Integer.parseInt(req.getParameter("rentalshop_id"));
		 float rating  = Float.parseFloat(req.getParameter("rating"));
		 String rentalshop_comment = req.getParameter("rentalshop_comment");
		 String user_id = req.getParameter("user_id");
		 
		 //파일 업로드
		 ServletContext application = req.getServletContext();
		 String path = application.getRealPath("/reviewImgs");
		 System.out.println("리뷰이미지경로:" + path);
		 
		 //reviewImg 폴더가 없으면 생성
		 File reviewImgs = new File(path);
		 if (!reviewImgs.exists()) {
			 reviewImgs.mkdirs();
			 System.out.println("reviewImgs 폴더가 생성되었습니다.");
		 }
		 
		 try {
			 String savefilename = null;
			 Part part = req.getPart("review_img");
			 String orgfilename = part.getSubmittedFileName();
			 System.out.println("originalfilename:" + orgfilename);
			 if (orgfilename != null && !orgfilename.isEmpty()) { // 파일이 있을 때만 UUID를 생성하여 파일값 전달
				    savefilename = UUID.randomUUID() + "_" + orgfilename;
			 FileOutputStream fos = new FileOutputStream(path + File.separator + savefilename);
			 InputStream is = part.getInputStream();
			 
			 is.transferTo(fos);
			 is.close();
			 fos.close();
			 }else {
				 savefilename = ""; //파일이 없으면 빈값 전달
			 }
			 System.out.println("savefilename:" + savefilename);
			 
			 RentalshopReviewDao rentalshopReviewDao = new RentalshopReviewDao();
			 RentalshopReviewDTO rentalshopReviewDTO = new RentalshopReviewDTO(0, payment_id, uuid, rating, rentalshop_id, rentalshop_comment, savefilename, null, user_id);
			 
			 int n = rentalshopReviewDao.insert(rentalshopReviewDTO);
			 
			 if(n > 0) {
				 req.setAttribute("result", "success");
			 }else {
				 req.setAttribute("result", "fail");
			 }
		 }catch(Exception e) {
			 System.out.println(e.getMessage());
		 }
		 
		 req.setAttribute("content", "rentalBookings");
		 req.getRequestDispatcher("/mypage/layout.jsp").forward(req, resp);
		 
	}
}
