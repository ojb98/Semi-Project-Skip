package rental.controller;

import rental.dao.WishDao;
import rental.dto.WishDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/wish")
public class WishController extends HttpServlet {
        private final WishDao wishDao = new WishDao();

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            try {
                int uuid = Integer.parseInt(req.getParameter("uuid"));
                System.out.println("찜get uuid :"+uuid);

                List<Integer> wishList = wishDao.getWishRefIdList(uuid);

                JSONObject jsonResponse = new JSONObject();
                jsonResponse.put("wishList", wishList);

                resp.setContentType("application/json");
                resp.getWriter().write(jsonResponse.toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            try {
                boolean isWish = Boolean.parseBoolean(req.getParameter("isWish"));
                int uuid = Integer.parseInt(req.getParameter("uuid"));
                System.out.println("찜post uuid :"+uuid);
                int refId = Integer.parseInt(req.getParameter("ref_id"));
                String category = req.getParameter("category");

                // 로그 출력
                System.out.println("Received POST request: isWish=" + isWish + ", uuid=" + uuid + ", refId=" + refId + ", category=" + category);

                if (isWish) {  // 찜 추가
                    int result = wishDao.insertWish(new WishDTO(0, uuid, category, refId));
                    if (result > 0) {
                        System.out.println("Wish added to database");
                        sendResponse(resp, true);
                    } else {
                        sendResponse(resp, false, "Failed to insert wish.");
                    }
                } else {  // 찜 삭제
                    Map<String, Object> map = new HashMap<>();
                    map.put("uuid", uuid);
                    map.put("category", category);
                    map.put("ref_id", refId);
                    int result = wishDao.deleteWish(map);
                    if (result > 0) {
                        System.out.println("Wish removed from database");
                        sendResponse(resp, true);
                    } else {
                        sendResponse(resp, false, "Failed to delete wish.");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                sendResponse(resp, false, "Server error: " + e.getMessage());
            }
        }

        // 성공 응답 보내기
        private void sendResponse(HttpServletResponse resp, boolean success) throws IOException {
            sendResponse(resp, success, null);
        }

        // 성공/실패 메시지 포함된 응답 보내기
        private void sendResponse(HttpServletResponse resp, boolean success, String message) throws IOException {
            resp.setContentType("application/json");
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("success", success);
            if (message != null) {
                jsonResponse.put("message", message);
            }
            resp.getWriter().write(jsonResponse.toString());
        }
    }

