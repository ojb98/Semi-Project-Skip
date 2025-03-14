package controller;

import dao.ResortDao;
import dao.ResortReviewDao;
import dao.RoomDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/rental/resort")
public class ResortSelectController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            final int resort_id = Integer.parseInt(req.getParameter("resort_id"));

            ResortDao resortDao = new ResortDao();
            RoomDao roomDao = new RoomDao();
            ResortReviewDao resortReviewDao = new ResortReviewDao();

            req.setAttribute("resortDTO", resortDao.getResortById(resort_id));
            req.setAttribute("minPrice", roomDao.getMinPrice(resort_id));
            req.setAttribute("roomList", roomDao.getList(resort_id));
            req.setAttribute("reviewCount", resortReviewDao.getCount(resort_id));
            req.setAttribute("averageRating", resortReviewDao.getAverage(resort_id));
            req.setAttribute("reviewList", resortReviewDao.getList(resort_id));
            req.getRequestDispatcher("/rental/resortDetail.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace(); // 예외 로그 출력
            req.setAttribute("errorMessage", "리조트를 찾는 중 오류가 발생했습니다.");
            req.getRequestDispatcher("/errorPage.jsp").forward(req, resp); // 오류 페이지로 리다이렉트
        }
    }
}
