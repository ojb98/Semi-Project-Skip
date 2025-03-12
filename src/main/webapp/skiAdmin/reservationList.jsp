<%@page import="adminDto.SkiReservationDTO"%>
<%@page import="skiAdminPageMapper.SkiReservationMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="mybatis.service.SqlSessionFactoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	String keyword = request.getParameter("keyword");
	String filter = request.getParameter("filter");
	int skiID = Integer.parseInt(request.getParameter("skiID"));  
	Map<String,Object> params =new HashMap<>();
	params.put("skiID",skiID);
	String reservStatus = "";
	
	SqlSession sqlSession= SqlSessionFactoryService.getSqlSessionFactory().openSession();
	SkiReservationMapper mapper = sqlSession.getMapper(SkiReservationMapper.class);
	List<SkiReservationDTO> reservationList = mapper.getSkiReservationUsers(params);
	List<SkiReservationDTO> searchReservationList = mapper.getSearchSkiReservationUsers(params);	
	if (keyword != null && !keyword.trim().isEmpty()) {
	    if ("userName".equals(filter)) {
	        params.put("name", keyword);
	    } else if ("userId".equals(filter)) {
	        params.put("user_id", keyword);
	    } else if ("userEmail".equals(filter)) {
	        params.put("email", keyword);
	    }
	    searchReservationList = mapper.getSearchSkiReservationUsers(params);
	}
	List<SkiReservationDTO> displayList = (searchReservationList != null) ? searchReservationList : reservationList;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>
<% if (displayList != null && !displayList.isEmpty()) {
	   int count = 0;
       for (SkiReservationDTO reservation : displayList) {
    	   if(count++ >= 10) break;
    		String rowStyle = "";
           if("CANCELLED".equals(reservation.getStatus()) || "COMPLETED".equals(reservation.getStatus())){
               rowStyle = " style='background-color:#e8e8e8;'";
           }
%>
    <tr<%= rowStyle %>>
      <td><%= reservation.getSkiReservId() %></td>
      <td><%= reservation.getUserName() %></td>
      <td><%= reservation.getUserId() %></td>
      <td><%= reservation.getUserEmail() %></td>
      <td><%= reservation.getPhone() %></td>
      <td><%= sdf.format(reservation.getReservDate()) %></td>
      <td><%= sdf.format(reservation.getCreatedAt()) %></td>
<% 
	if("CONFIRMED".equals(reservation.getStatus())){
		reservStatus = "예약완료"; 
	}else if("CANCELLED".equals(reservation.getStatus())){
		reservStatus = "예약취소";
	}else{
		reservStatus = "이용완료";
	}
	
%>
      <td><%= reservStatus %></td>
      <td>
         <button type="button" onclick="requestDelete('<%= reservation.getSkiReservId() %>')" style="background-color: #00A2E8; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">삭제</button>
         <button type="button" style="background-color: #00A2E8; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">상세보기 ▼</button>
      </td>
    </tr>
<%    } 
   } else { %>
    <tr>
      <td colspan="9">예약 리스트가 존재하지 않습니다.</td>
    </tr>
<% } sqlSession.close();%>
