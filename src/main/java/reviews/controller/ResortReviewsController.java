package reviews.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

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
import reviews.dto.ResortReviewsReDTO;

@MultipartConfig (
	maxFileSize = 1024 * 1024 * 10
)

@WebServlet("/jsp/reviewInsert")
public class ResortReviewsController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/jsp/reviewInsert.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 int paymentId = Integer.parseInt(req.getParameter("paymentId"));
		 int uuid = Integer.parseInt(req.getParameter("uuid"));
		 int resortId = Integer.parseInt(req.getParameter("resortId"));
		 double rating  = Double.parseDouble(req.getParameter("rating"));
		 String resortComment = req.getParameter("resortComment");
		 
//		 String reviewImg = req.getParameter("reviewImg");
		 
		 //파일 업로드
		 ServletContext application = req.getServletContext();
		 String path = application.getRealPath("/reviewImgs");
		 System.out.println("리뷰이미지경로:" + path);
		 
		 //reviewImg 폴더가 없으면 생성
		 File reviewImgs = new File(path);
		 if (!reviewImgs.exists()) {
			 reviewImgs.mkdirs();
			 System.out.println("reviewImg 폴더가 생성되었습니다.");
		 }
		 
		 try {
			 Part part = req.getPart("reviewImg");
			 String orgfilename = part.getSubmittedFileName();
			 String savefilename = UUID.randomUUID()+"_"+orgfilename;
			 FileOutputStream fos = new FileOutputStream(path + File.separator + savefilename);
			 InputStream is = part.getInputStream();
			 
			 is.transferTo(fos);
			 is.close();
			 fos.close();
			 
			 ResortReviewsDAO rrDao = new ResortReviewsDAO();
			 ResortReviewsDTO rrDto = new ResortReviewsDTO(0, paymentId, uuid, resortId, rating, resortComment, savefilename, null);
			 
			 int n = rrDao.insert(rrDto);
			 
			 if(n > 0) {
				 req.setAttribute("result", "success");
			 }else {
				 req.setAttribute("result", "fail");
			 }
		 }catch(Exception e) {
			 System.out.println(e.getMessage());
		 }
		 
		 req.getRequestDispatcher("/jsp/test.jsp").forward(req, resp);
		 
	}
}
