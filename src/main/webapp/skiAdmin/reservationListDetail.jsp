<%@page import="adminDto.SkiReservationDetailDTO"%>
<%@page import="skiAdminPageMapper.SkiAdminMapper"%>
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
	List<SkiReservationDetailDTO> reservationDetailList = (List<SkiReservationDetailDTO>)request.getAttribute("reservationDetailList");
%>
<% 
	if(reservationDetailList != null && !reservationDetailList.isEmpty()){
       for (SkiReservationDetailDTO reservation : reservationDetailList) {
    		String rowStyle = "";
    		String reservStatus = "";
    		//디테일.jsp 출력까지 확인하기. (reservation)
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
         <button type="button" onclick="reservationDetailList('<%= reservation.getSkiReservId() %>')" style="background-color: #00A2E8; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">상세보기 ▼</button>
      </td>
    </tr>
<% } } else { %>
    <tr>
      <td colspan="9">예약 리스트가 존재하지 않습니다.</td>
    </tr>
<% } %>
