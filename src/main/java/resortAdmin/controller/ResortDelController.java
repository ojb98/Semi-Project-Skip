package resortAdmin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import resort.dto.ResortDTO;
import resort.dto.RoomDTO;
import resortAdmin.dao.ResortDao;
import resortAdmin.dao.RoomDao;

@WebServlet("/adminResort/delete")
public class ResortDelController extends HttpServlet{
	private static final int SUCCESS_THRESHOLD = 0;
	private ResortDao rdao = ResortDao.getInstance();
    private RoomDao rmdao = RoomDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int resortId = Integer.parseInt(req.getParameter("resort_id"));

	     //경로 얻어오기
	     ServletContext application = req.getServletContext();
	     String resortPath = application.getRealPath("/resortImg");  //리조트 이미지경로
	     String roomPath = application.getRealPath("/roomImg");   //객실 이미지경로

	     //리조트에 모든 객실 조회후, 모든 객실 이미지 삭제
	     List<RoomDTO> roomList = rmdao.getInfo(resortId);
	     System.out.println("리조트에 담긴 객실정보: " + roomList);
	     if(roomList != null) {
		     for (RoomDTO room : roomList) {
		    	 deleteFile(roomPath, room.getRmain_img());
		    	 deleteFile(roomPath, room.getRsub_img1());
		    	 deleteFile(roomPath, room.getRsub_img2());
		    	 deleteFile(roomPath, room.getRsub_img3());
		     }
	     }
	     
	     //리조트 정보를 조회 후, 리조트 이미지 삭제
	     ResortDTO resort = rdao.getInfo(resortId);
	     if(resort !=null) {
	    	 deleteFile(resortPath, resort.getRemain_img());
		     deleteFile(resortPath, resort.getResub_img1());
		     deleteFile(resortPath, resort.getResub_img2());
		     deleteFile(resortPath, resort.getResub_img3());
	     }
	     
	     //DB에서 리조트 삭제
	     int n = rdao.resortDelete(resortId);
	     if(n > SUCCESS_THRESHOLD) {
	    	 System.out.println("리조트 삭제 성공");
	     }else {
	    	 System.out.println("리조트 삭제 실패");
	     }

	     resp.sendRedirect(req.getContextPath() + "/adminResort/list");
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
