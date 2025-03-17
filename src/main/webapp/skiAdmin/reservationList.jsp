<%@page import="ski.dto.SkiReservationListDto"%>
<%@page import="ski.mapper.SkiAdminMapper"%>
<%@page import="adminDto.SkiReservationDTO"%>
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
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	List<SkiReservationListDto> reservationList = (List<SkiReservationListDto>)request.getAttribute("reservationList");
	
%>
<% 
	if(reservationList != null && !reservationList.isEmpty()){
       for (SkiReservationListDto reservation : reservationList) {
    		String rowStyle = "";
    		String reservStatus = "";
           if("CANCELLED".equals(reservation.getStatus()) || "COMPLETED".equals(reservation.getStatus())){
               rowStyle = " style='background-color:#e8e8e8;'";
           }
%>
    <tr<%= rowStyle %>>
      <td><%= reservation.getSki_reserv_id() %></td>
      <td><%= reservation.getUserName() %></td>
      <td><%= reservation.getUserId() %></td>
      <td><%= reservation.getUserEmail() %></td>
      <td><%= reservation.getPhone() %></td>
      <td><%= reservation.getReserv_date() %></td>
      <td><%= reservation.getCreated_at() %></td>
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
         <button type="button" onclick="requestDelete('<%= reservation.getSki_reserv_id() %>')" style="background-color: #00A2E8; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">삭제</button>
         <button type="button" onclick="reservationDetailList('<%= reservation.getSki_reserv_id() %>')" style="background-color: #00A2E8; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">상세보기 ▼</button>
      </td>
    </tr>
<% } } else { %>
    <tr>
      <td colspan="9">예약 리스트가 존재하지 않습니다.</td>
    </tr>
<% } %>
