package resortAdmin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import resort.dto.FacilityListDTO;
import resort.dto.ResortDTO;
import resort.dto.ResortFacilityMapDTO;
import resortAdmin.dao.FacilityDao;
import resortAdmin.dao.ResortDao;
import users.dto.UsersDto;

@WebServlet("/adminResort/insert")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 50
)
public class ResortInsertController extends HttpServlet{
	private ResortDao dao=ResortDao.getInstance();
	private FacilityDao fdao=FacilityDao.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//시설유형+시설이름 조회하여 가져오기
		List<FacilityListDTO> flist=dao.facilityList();
		req.setAttribute("flist", flist);
		System.out.println("시설유형+시설이름 :"+flist);
		req.getRequestDispatcher("/resortAdmin/resortInsertForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//현재 로그인 유저정보를 얻어와서 uuid 값을 가져온다
		HttpSession session=req.getSession();
		UsersDto user=(UsersDto)session.getAttribute("user");
		int uuid=user.getUuid();
		
		String name=req.getParameter("name");
		String resortType=req.getParameter("resort_type");
		String phone=req.getParameter("resort_phone");
		String location=req.getParameter("location");
		String checkTime=req.getParameter("check_time");
		String description=req.getParameter("description");
		
		
		//파일업로드
		ServletContext application=req.getServletContext();
		String path=application.getRealPath("/resortImg");
		System.out.println("path: "+path);
		
		File resortImg = new File(path);
	    if (!resortImg.exists()) {
	    	resortImg.mkdirs();
	    }
		
		try {
			String mainImg=saveFile(req.getPart("remain_img"),path,true);
			
			if(mainImg==null) {
				throw new ServletException("대표 이미지는 필수입니다.");
			}
			
			String subImg1=saveFile(req.getPart("resub_img1"),path,false);
			String subImg2=saveFile(req.getPart("resub_img2"),path,false);
			String subImg3=saveFile(req.getPart("resub_img3"),path,false);
			
			
			ResortDTO redto=new ResortDTO(0,uuid,name,resortType,phone,location,mainImg,subImg1,subImg2,subImg3,description,checkTime,null);
			System.out.println("ResortDTO데이터 :"+redto);
			
			//싱글톤 dao 가져오기
			ResortDao rdao=ResortDao.getInstance();
			
			int resortId=rdao.resortInsert(redto);
			System.out.println("리조트 고유아이디: " +resortId);
			
			//체크박스 선택된 시설유형의 시설이름으로 리조트-시설 매핑에 삽입하기
			String[] facilityIds = req.getParameterValues("facility_id");
			System.out.println("String[] 시설아이디: "+ facilityIds);
	        if (facilityIds != null && facilityIds.length > 0) {
	        List<ResortFacilityMapDTO> rfmdto=Arrays.stream(facilityIds)
	        		.map(facilityId->new ResortFacilityMapDTO(resortId,Integer.parseInt(facilityId)))
	        		.collect(Collectors.toList());
	        
	        System.out.println("List<ResortFacilityMapDTO>담긴 데이터들 :"+rfmdto);
	        fdao.mapInsert(rfmdto);
	            
	        }
	        	
	        resp.sendRedirect(req.getContextPath()+"/adminResort/list");
	        
        
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
