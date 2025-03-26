package skiAdmin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ski.dto.SkiDTO;
import ski.dto.SkiItemDTO;
import skiAdmin.dao.SkiDao;
import skiAdmin.dao.SkiItemDao;

@WebServlet("/adminSki/delete")
public class SkiDelController extends HttpServlet {
	private static final int SUCCESS_THRESHOLD = 0;
	private SkiItemDao sidao=SkiItemDao.getInstance();
	private SkiDao skdao=SkiDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int skiId=Integer.parseInt(req.getParameter("ski_id"));
		
		//경로 얻어오기
	     ServletContext application = req.getServletContext();
	     String skiPath = application.getRealPath("/skiImg");  //스키장 이미지경로
	     String itemPath = application.getRealPath("/skiItemImg");   //스키장 장비유형 이미지경로

	     //스키장에 사용중인 장비유형 조회후, 모든 장비유형 이미지 삭제
	     List<SkiItemDTO> itemList = sidao.getSkiItemList(skiId);
	     System.out.println("스키장에 담긴 장비유형정보: " + itemList);
	     if(itemList != null) {
		     for (SkiItemDTO item : itemList) {
		    	 deleteFile(itemPath, item.getItem_img());
		     }
	     }
	     
	     //스키장 정보를 조회 후, 렌탈샵 이미지 삭제
	     SkiDTO ski = skdao.getSkiId(skiId);
	     if(ski !=null) {
	    	 deleteFile(skiPath, ski.getSkmain_img());
		     deleteFile(skiPath, ski.getSksub_img1());
		     deleteFile(skiPath, ski.getSksub_img2());
		     deleteFile(skiPath, ski.getSksub_img3());
	     }
	     
	     //DB에서 스키장과 장비유형 삭제처리
	     sidao.itemListDelete(skiId);
	     int n = skdao.skiDelete(skiId);
	     
	     
	     if(n > SUCCESS_THRESHOLD) {
	    	 System.out.println("스키장 삭제 성공");
	     }else {
	    	 System.out.println("스키장 삭제 실패");
	     }

	     resp.sendRedirect(req.getContextPath() + "/adminSki/list");
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
