package resortAdmin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.UUID;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import resort.dto.RoomDTO;
import resortAdmin.dao.RoomDao;

@WebServlet("/adminRoom/insert")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 50
)
public class RoomInsertController extends HttpServlet{
	private static final int SUCCESS_THRESHOLD = 0;
	private RoomDao dao=RoomDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/resortAdmin/roomInsertForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int resort_id=Integer.parseInt(req.getParameter("resort_id"));
		String roomName=req.getParameter("room_name");
		String roomType=req.getParameter("room_type");
		int quantity = Integer.parseInt(req.getParameter("room_quantity"));
		int maxGuests = Integer.parseInt(req.getParameter("max_guests"));
		int price = Integer.parseInt(req.getParameter("price_per_night"));
		String description=req.getParameter("description");
		
		//파라미터로 넘길 리조트명 인코딩
		String resortName=req.getParameter("name");
		String name = URLEncoder.encode(resortName, "UTF-8");
		
		//파일업로드
		ServletContext application=req.getServletContext();
		String path=application.getRealPath("/roomImg");
		System.out.println("path: "+path);
		
		File roomImg = new File(path);
	    if (!roomImg.exists()) {
	    	roomImg.mkdirs();
	    }
		
		try {
			String mainImg=saveFile(req.getPart("rmain_img"),path,true);
			
			if(mainImg==null) {
				throw new ServletException("대표 이미지는 필수입니다.");
			}
			
			String subImg1=saveFile(req.getPart("rsub_img1"),path,false);
			String subImg2=saveFile(req.getPart("rsub_img2"),path,false);
			String subImg3=saveFile(req.getPart("rsub_img3"),path,false);
				
			RoomDTO dto=new RoomDTO(0,resort_id,roomName,roomType,quantity,maxGuests,price,mainImg,subImg1,subImg2,subImg3,description,null);
			
			
			int n=dao.roomInsert(dto);
			
			if(n > SUCCESS_THRESHOLD) {
				System.out.println("객실등록 완료");
			}else {
				System.out.println("객실등록 실패");
			}
			
			resp.sendRedirect(req.getContextPath()+"/adminRoom/insert?resort_id="+ resort_id +"&name="+ name);
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
			
	}

	//파일업로드처리 메소드
	private String saveFile(Part part, String path, boolean isCheck) throws ServletException, IOException {
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