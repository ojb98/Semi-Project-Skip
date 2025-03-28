package rentalAdmin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import rental.dto.RentalShopDTO;
import rentalAdmin.dao.RentalShopDao;
import resort.dto.ResortDTO;

@WebServlet("/adminRental/update")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 50
)
public class RentalShopUpdateController extends HttpServlet {
	private RentalShopDao rsdao=RentalShopDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rentalId=Integer.parseInt(req.getParameter("rentalshop_id"));
		
		RentalShopDTO rsdto=rsdao.getRentalId(rentalId);
		
		req.setAttribute("rsdto", rsdto);
		
		req.getRequestDispatcher("/rentalAdmin/rentalShopUpdate.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rentalId=Integer.parseInt(req.getParameter("rentalshop_id"));
		
		int uuid=Integer.parseInt(req.getParameter("uuid"));
		String name=req.getParameter("name");
		String phone=req.getParameter("rental_phone");
		String location=req.getParameter("location");
		String description=req.getParameter("description");
		
		//파일정보 읽어오기
		Part mainPart=req.getPart("remain_img");
		Part subPart1=req.getPart("resub_img1");
		Part subPart2=req.getPart("resub_img2");
		Part subPart3=req.getPart("resub_img3");
		
		//렌탈샵 정보가져오기
		RentalShopDTO dto=rsdao.getRentalId(rentalId);
		
		//이미지 저장 위치 
		String path=req.getServletContext().getRealPath("/rentalImg");
		
		//각 파트별로 새로운 파일이 업로드되었는지 확인
		String orgMainImg=processFile(mainPart, path, dto.getRemain_img(), true);
		String orgSubImg1=processFile(subPart1, path, dto.getResub_img1(), false);
		String orgSubImg2=processFile(subPart2, path, dto.getResub_img2(), false);
		String orgSubImg3=processFile(subPart3, path, dto.getResub_img3(), false);
		

        //DB 작업
        RentalShopDTO rentaldto=new RentalShopDTO(rentalId,uuid,name,phone,location,
        		orgMainImg,orgSubImg1,orgSubImg2,orgSubImg3,description,null);
		rsdao.rentalUpdate(rentaldto);
		

		resp.sendRedirect(req.getContextPath()+"/adminRental/detail?rentalshop_id="+rentalId);
	}
	
	//파일처리 메소드(기존파일 삭제 및 새로운 파일 업로드처리)
	private String processFile(Part part,String path,String existFile,boolean isMain) throws IOException, ServletException {
		if(part != null && part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
			//기존파일 삭제
			deleteFile(path, existFile);
			
			//새로운 파일 저장 후 파일명 반환
			return saveFile(part, path, isMain);
		}
		
		return existFile;
        
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

	//파일삭제처리 메소드
	private void deleteFile(String path, String fileName) {
		if(fileName != null && !fileName.trim().isEmpty()) {
			File file = new File(path, fileName);
			if(file.exists()) {
				if(file.delete()){
					System.out.println("이미지삭제 성공");
				} else {
					System.out.println("이미지삭제 실패");
				}
			}
		}
	}
}	
	

