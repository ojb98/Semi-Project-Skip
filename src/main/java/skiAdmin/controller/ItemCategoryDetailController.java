package skiAdmin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rental.dto.ItemCategoryListDTO;
import rentalAdmin.dao.RentCategoryDao;
import ski.dto.SkiItemCategoryListDTO;

@WebServlet("/adminSkiItemCategory/detail")
public class ItemCategoryDetailController extends HttpServlet{
	private RentCategoryDao rcdao=RentCategoryDao.getInstance();
	private static final int PAGE_SIZE = 3; // 페이지당 3개씩 표시
	private static final int BLOCK_SIZE = 3;  //한 블록에 3페이지씩  

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int skiId=Integer.parseInt(req.getParameter("ski_id"));
		int currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));

        // 전체 행 수 조회
        int totalRowCount = rcdao.getSkiItemCategoryCount(skiId);
        // 총 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalRowCount / PAGE_SIZE);
        // 시작행, 종료행 계산 
        int startRow = (currentPage - 1) * PAGE_SIZE + 1;
        int endRow = currentPage * PAGE_SIZE;
        
        // 블록 단위 페이징 계산
        int startPage = ((currentPage - 1) / BLOCK_SIZE) * BLOCK_SIZE + 1;
        int endPage = startPage + BLOCK_SIZE - 1;
        if(endPage > totalPages) {
            endPage = totalPages;
        }
        
        List<SkiItemCategoryListDTO> itemList = rcdao.SkiItemCategoryList(skiId, startRow, endRow);
        
 
        // JSP에 전달할 속성 설정
        req.setAttribute("list", itemList);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("startPage", startPage);
        req.setAttribute("endPage", endPage);
        req.setAttribute("skiId", skiId);

        System.out.println("스키장 카테고리&장비유형 조인: " + itemList);
        
        req.getRequestDispatcher("/skiAdmin/itemCategoryInfo.jsp").forward(req, resp);
	}
}
