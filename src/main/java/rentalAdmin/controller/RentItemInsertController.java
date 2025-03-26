package rentalAdmin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import rental.dto.CategoryDTO;
import rental.dto.RentCategoryDTO;
import rental.dto.RentItemDTO;
import rentalAdmin.dao.RentCategoryDao;
import rentalAdmin.dao.RentItemDao;

@WebServlet("/adminItem/insert")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 50
)
public class RentItemInsertController extends HttpServlet{
	private RentCategoryDao rcdao=RentCategoryDao.getInstance();
	private RentItemDao ridao=RentItemDao.getInstance();
	private static final int SUCCESS_THRESHOLD = 0;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//카테고리 전체 조회
		List<CategoryDTO> rclist=rcdao.categoryList();
		req.setAttribute("rclist", rclist);
		
		req.getRequestDispatcher("/rentalAdmin/rentItemInsertForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rentalshopId=Integer.parseInt(req.getParameter("rentalshop_id"));
		String itemName=req.getParameter("item_name");
		String itemDetail=req.getParameter("item_detail");
		int quantity=Integer.parseInt(req.getParameter("total_quantity"));
		
		//파라미터로 넘길 리조트명 인코딩
		String rentalName=req.getParameter("name");
		String name = URLEncoder.encode(rentalName, "UTF-8");
		
		//선택한 카테고리 아이디 가져오기 
        int categoryId =Integer.parseInt(req.getParameter("category_id"));
		
		//파일업로드
		ServletContext application=req.getServletContext();
		String path=application.getRealPath("/rentItemImg");
		System.out.println("rentItem path: "+path);
						
		File rentItemImg = new File(path);
			if (!rentItemImg.exists()) {
				rentItemImg.mkdirs();
		}
						
		try {
			//파일정보 읽어오기
			Part part=req.getPart("item_img");
			String itemImgName=UUID.randomUUID() + "_" + part.getSubmittedFileName();
			
			InputStream is=part.getInputStream();
			FileOutputStream fos=new FileOutputStream(path+File.separator+itemImgName);
			
			is.transferTo(fos);
			
			is.close();
			fos.close();
			
			RentItemDTO ridto = new RentItemDTO(0,categoryId,rentalshopId,itemName,itemDetail,quantity,itemImgName,null);

			// DB에 저장
			int n = ridao.itemInsert(ridto);
			
			if(n > SUCCESS_THRESHOLD) {
				System.out.println("장비등록 완료");
			}else {
				System.out.println("장비등록 실패");
			}
	       		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		resp.sendRedirect(req.getContextPath()+"/adminItem/insert?rentalshop_id="+ rentalshopId +"&name="+ name);
	}
}
