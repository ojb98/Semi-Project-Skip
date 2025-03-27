package skiAdmin.controller;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ski.dto.SkiItemDTO;
import skiAdmin.dao.SkiItemDao;

@WebServlet("/adminSkiItem/delete")
public class SkiItemDelController extends HttpServlet {
	private SkiItemDao sidao=SkiItemDao.getInstance();
	private static final int SUCCESS_THRESHOLD = 0;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int itemId=Integer.parseInt(req.getParameter("item_id"));
		
		//파일 경로얻어오기
		ServletContext application = req.getServletContext();
		String itemPath = application.getRealPath("/skiItemImg");
				
		//장비유형 정보 얻어오기(이미지명)
		SkiItemDTO dto=sidao.getItemId(itemId);
		int skiId=dto.getSki_id();
		String itemImg=dto.getItem_img();
		
		//장비유형 이미지삭제
		File f=new File(itemPath+File.separator+itemImg);
		f.delete();
		
		//DB로 삭제
		int n = sidao.skiItemDelete(itemId);
		
		if(n > SUCCESS_THRESHOLD) {
	    	 System.out.println("장비유형 삭제 성공");
		}else {
	    	 System.out.println("장비유형 삭제 실패");
		}
		
		
		resp.sendRedirect(req.getContextPath()+"/adminSki/detail?ski_id="+skiId);
		
	}
	
}
