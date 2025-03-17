package skiAdminPageController;

import mybatis.service.SqlSessionFactoryService;
import ski.mapper.SkiAdminMapper;

import org.apache.ibatis.session.SqlSession;

import adminDto.SkiReservationDTO;
import adminDto.SkiReservationDetailDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * <%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%
    String url = "jdbc:mysql://localhost:3306/your_db_name";
    String username = "your_username";
    String password = "your_password";
    
    JSONArray jsonArray = new JSONArray();
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        String reservId = request.getParameter("reservId");
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
        
        // SKI_RESERVATION_ITEM과 SKI_ITEM 테이블 조인하여 상품 정보 조회
        String sql = "SELECT i.item_id, i.category_id, i.item_name, i.item_status, " +
                    "ri.quantity, ri.subtotal_price " +
                    "FROM ski_reservation_item ri " +
                    "JOIN ski_item i ON ri.item_id = i.item_id " +
                    "WHERE ri.reserv_id = ?";
                    
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, reservId);
        rs = pstmt.executeQuery();
        
        while(rs.next()) {
            JSONObject item = new JSONObject();
            item.put("itemId", rs.getInt("item_id"));
            item.put("categoryId", rs.getInt("category_id"));
            item.put("itemName", rs.getString("item_name"));
            item.put("itemStatus", rs.getString("item_status"));
            item.put("quantity", rs.getInt("quantity"));
            item.put("subtotalPrice", rs.getInt("subtotal_price"));
            
            jsonArray.add(item);
        }
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonArray.toString());
        
    } catch(Exception e) {
        JSONObject error = new JSONObject();
        error.put("error", "데이터를 불러오는 중 오류가 발생했습니다.");
        response.setStatus(500);
        response.getWriter().write(error.toString());
        e.printStackTrace();
    } finally {
        if(rs != null) try { rs.close(); } catch(SQLException e) {}
        if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
        if(conn != null) try { conn.close(); } catch(SQLException e) {}
    }
%>
 */
@WebServlet("/skiAdmin/reservationDetailList")
public class SkiReservationDetailController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        String reservID = "1";  //req.getParameter("reservID");
        
        if (reservID == null) {
            out.print("에러 : 예약정보 조회 중 오류"); //세션 공부 및 수정 필요
            return;
        }
        
        int reservIDparam = Integer.parseInt(reservID);
        Map<String, Object> params = new HashMap<>();
        params.put("reservID", reservIDparam);
        

        List<SkiReservationDetailDTO> reservationDetailList;
        try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            SkiAdminMapper mapper = sqlSession.getMapper(SkiAdminMapper.class);
            reservationDetailList = mapper.getSkiReservationDetail(params);
        }
        req.setAttribute("reservationDetailList", reservationDetailList);
        req.getRequestDispatcher("/skiAdmin/reservationList.jsp").forward(req, resp);
    }
   
    
}
