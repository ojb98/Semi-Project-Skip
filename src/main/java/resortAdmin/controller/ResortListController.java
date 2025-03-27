package resortAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import resort.dto.ResortDTO;
import resort.dto.ResortListDTO;
import resortAdmin.dao.ResortDao;
import users.dto.UsersDto;

@WebServlet("/adminResort/list")
public class ResortListController extends HttpServlet{
	private ResortDao dao=ResortDao.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//현재 로그인 유저정보를 얻어와서 uuid 값을 가져온다
		HttpSession session=req.getSession();
		UsersDto user=(UsersDto)session.getAttribute("user");
		int uuid=user.getUuid();
		
		List<ResortListDTO> relist=dao.resortList(uuid);
		req.setAttribute("relist", relist);
		req.getRequestDispatcher("/resortAdmin/resortList.jsp").forward(req, resp);
	}
	
	
}