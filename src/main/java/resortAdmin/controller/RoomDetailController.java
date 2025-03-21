package resortAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dto.RoomDTO;
import resortAdmin.dao.RoomDao;

@WebServlet("/adminRoom/detail")
public class RoomDetailController extends HttpServlet {
	private static final int PAGE_SIZE = 3; // 페이지당 3개씩 표시
	private RoomDao rmdao=RoomDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int resortId = Integer.parseInt(req.getParameter("resort_id"));
        int page = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));

        //객실 전체 리스트 가져오기
        List<RoomDTO> allRooms = rmdao.getInfo(resortId);

        //페이징 처리
        int start = (page - 1) * PAGE_SIZE;
        int end = Math.min(start + PAGE_SIZE, allRooms.size());
        List<RoomDTO> pagedRooms = allRooms.subList(start, end);

        req.setAttribute("rmdto", pagedRooms);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", (int) Math.ceil((double) allRooms.size() / PAGE_SIZE));

        req.getRequestDispatcher("/resortAdmin/roomInfo.jsp").forward(req, resp);
	}
}