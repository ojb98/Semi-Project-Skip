package rentalAdmin.controller;

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
import rental.dto.RentalShopDTO;
import rentalAdmin.dao.RentalShopDao;
import resortAdmin.dao.RoomDao;

@WebServlet("/adminRental/insert")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 50
)
public class RentalShopInsertController extends HttpServlet {
	private RentalShopDao dao=RentalShopDao.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/rentalAdmin/rentalInsertForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//int uuid=Integer.parseInt(req.getParameter("uuid"));
		String name=req.getParameter("name");
		String phone=req.getParameter("rental_phone");
		String location=req.getParameter("location");
		String description=req.getParameter("description");
		
		
		//파일업로드
		ServletContext application=req.getServletContext();
		String path=application.getRealPath("/rentalImg");
		System.out.println("path: "+path);
				
		File rentalImg = new File(path);
		if (!rentalImg.exists()) {
			rentalImg.mkdirs();
		}
				
		try {
			String mainImg=saveFile(req.getPart("remain_img"),path,true);
					
			if(mainImg==null) {
				throw new ServletException("대표 이미지는 필수입니다.");
			}
					
			String subImg1=saveFile(req.getPart("resub_img1"),path,false);
			String subImg2=saveFile(req.getPart("resub_img2"),path,false);
			String subImg3=saveFile(req.getPart("resub_img3"),path,false);
					
					
			RentalShopDTO rsdto=new RentalShopDTO(0,1,name,phone,location,mainImg,subImg1,subImg2,subImg3,description,null);
			System.out.println("RentalShopDTO데이터 :"+rsdto);
			dao.rentalInsert(rsdto);
		        	
		    resp.sendRedirect(req.getContextPath()+"/adminRental/list");
		        
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
			
	}
		
	//파일업로드처리 메소드
	private String saveFile(Part part,String path,boolean isCheck) throws IOException, ServletException {
		if(part ==null || part.getSubmittedFileName() ==null || part.getSubmittedFileName().isEmpty()) {
			if(isCheck) {
				throw new ServletException("필수파일이 누락되었습니다.");
			}
			return null;
		}
			
		String fileName=UUID.randomUUID() + "_" + part.getSubmittedFileName();
		File file=new File(path + File.separator + fileName);
		
		FileOutputStream fos=null;
		InputStream is=null;
			
		try {
			fos= new FileOutputStream(file);
			is = part.getInputStream();
			is.transferTo(fos);
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			return null;
		}finally {
			if(is!=null) is.close();
			if(fos!=null) fos.close();
		}

		return fileName;
	}
	
}
