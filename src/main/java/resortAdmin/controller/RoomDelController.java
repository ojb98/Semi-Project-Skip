package resortAdmin.controller;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dto.RoomDTO;
import resortAdmin.dao.RoomDao;

@WebServlet("/adminRoom/delete")
public class RoomDelController extends HttpServlet{
	private static final int SUCCESS_THRESHOLD = 0;
	private RoomDao dao=RoomDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int roomId=Integer.parseInt(req.getParameter("room_id"));
		
		//객실고유아이디를 통해 리조트 고유아이디 얻어오기(파라미터로 넘겨주기 위함)
		int resortId=dao.getRoomId(roomId).getResort_id();
		System.out.println("delete에 resort_id값: "+resortId);
		
		//경로얻어오기
		ServletContext application = req.getServletContext();
	    String rmPath = application.getRealPath("/roomImg");
		
	    //객실 이미지삭제
		RoomDTO room=dao.getRoomId(roomId);
		deleteFile(rmPath, room.getRmain_img());
	    deleteFile(rmPath, room.getRsub_img1());
	    deleteFile(rmPath, room.getRsub_img2());
	    deleteFile(rmPath, room.getRsub_img3());
	    
	    
	    //DB에서 객실 삭제
	    int n = dao.roomDelete(roomId);
	     if(n > SUCCESS_THRESHOLD) {
	    	 System.out.println("객실 삭제 성공");
	     }else {
	    	 System.out.println("객실 삭제 실패");
	     }
 
	     resp.sendRedirect(req.getContextPath()+"/adminResort/detail?resort_id="+resortId);
	}

	//파일삭제처리 메소드
	private void deleteFile(String rmPath, String fileName) {
		if(fileName != null && !fileName.trim().isEmpty()) {
			File file = new File(rmPath, fileName);
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