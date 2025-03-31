package skiAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ski.dto.SkiDTO;
import ski.dto.SkiListDTO;
import skiAdmin.dao.SkiDao;
import users.dao.UsersDao;
import users.dto.UsersDto;

@WebServlet("/adminSki/list")
public class SkiListController extends HttpServlet{
	private SkiDao skdao=SkiDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//현재 로그인 유저정보를 얻어와서 uuid 값을 가져온다
		HttpSession session=req.getSession();
		UsersDto user=(UsersDto)session.getAttribute("user");
		int uuid=user.getUuid();
		
		List<SkiListDTO> list=skdao.skiList(uuid);

		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/skiAdmin/skiList.jsp").forward(req, resp);
	}
	
	
}
