package resortAdmin.controller;

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
import resort.dto.RoomDTO;
import resortAdmin.dao.RoomDao;

@WebServlet("/adminRoom/update")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 50
)
public class RoomUpdateController extends HttpServlet{
	private RoomDao dao=RoomDao.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int roomId=Integer.parseInt(req.getParameter("room_id"));

		RoomDTO dto=dao.getRoomId(roomId);
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/resortAdmin/roomUpdate.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int roomId=Integer.parseInt(req.getParameter("room_id"));
		int resortId=Integer.parseInt(req.getParameter("resort_id"));
		String roomName=req.getParameter("room_name");
		String roomType=req.getParameter("room_type");
		int roomQuantity=Integer.parseInt(req.getParameter("room_quantity"));
		int maxGuests=Integer.parseInt(req.getParameter("max_guests"));
		int price=Integer.parseInt(req.getParameter("price_per_night"));
		String description=req.getParameter("description");
		
		//파일정보읽어오기
		Part mainPart=req.getPart("rmain_img");
		Part subPart1=req.getPart("rsub_img1");
		Part subPart2=req.getPart("rsub_img2");
		Part subPart3=req.getPart("rsub_img3");
		
		//객실고유아이디를 통해 객실정보 가져오기
		RoomDTO dto=dao.getRoomId(roomId);

		String path=req.getServletContext().getRealPath("/roomImg");
		
		//각 파트별로 새로운 파일이 업로드되었는지 확인
		String orgMainImg=processFile(mainPart,path,dto.getRmain_img(),true);
		String orgSubImg1=processFile(subPart1,path,dto.getRsub_img1(),false);
		String orgSubImg2=processFile(subPart1,path,dto.getRsub_img2(),false);
		String orgSubImg3=processFile(subPart1,path,dto.getRsub_img3(),false);

		RoomDTO resortdto=new RoomDTO(roomId,resortId,roomName,roomType,roomQuantity,maxGuests,
				price,orgMainImg,orgSubImg1,orgSubImg2,orgSubImg3,description,null);
		
		dao.roomUpdate(resortdto);
		
		resp.sendRedirect(req.getContextPath()+"/adminResort/detail?resort_id="+resortId);
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