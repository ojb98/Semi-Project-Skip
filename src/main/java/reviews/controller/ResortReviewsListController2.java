package reviews.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import reviews.dao.ResortReviewsDAO;
import reviews.dto.ResortReviewsDTO;

@MultipartConfig (
		maxFileSize = 1024 * 1024 * 10
	)

@WebServlet("/jsp/reviewList2")
public class ResortReviewsListController2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ResortReviewsDAO rrDao = new ResortReviewsDAO();
		List<ResortReviewsDTO> rrDto = rrDao.reviewList();
		req.setAttribute("rrDto", rrDto);
		req.getRequestDispatcher("/jsp/reviewList.jsp").forward(req, resp);
	}
}
