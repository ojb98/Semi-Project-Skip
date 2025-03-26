<%@page import="resort.dto.ResortReservationPrintDto"%>
<%@page import="resort.mapper.ResortReservationMapper"%>
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
	List<ResortReservationPrintDto> reservationList = (List<ResortReservationPrintDto>)request.getAttribute("reservationList");
	java.util.Date today = new java.util.Date();
    java.sql.Date sqlToday = new java.sql.Date(today.getTime());
%>
<%
if(reservationList != null && !reservationList.isEmpty()){
       for (ResortReservationPrintDto reservation : reservationList) {
    		String rowStyle = "";
    		String reservStatus = "";
    		if("취소".equals(reservation.getStatus())){
                rowStyle = "style='background-color:#f08080;'";
            }else if("완료".equals(reservation.getStatus())){
         	   rowStyle = "style='background-color:#e8e8e8;'";
            }
%>
    <tr<%= rowStyle %>>
      <td><%= reservation.getResort_reserv_id() %></td>
      <td><%= reservation.getUser_name() %></td>
      <td><%= reservation.getUserId() %></td>
      <td><%= reservation.getUserEmail() %></td>
      <td><%= reservation.getPhone() %></td>
      <td><%= reservation.getCheckin_date() %></td>
      <td><%= reservation.getCheckout_date() %></td>
      <td><%= reservation.getCreated_at() %></td>
      <td><%= reservation.getStatus() %></td>
      <td>
         <!-- <button type="button" onclick="requestDelete('<%= reservation.getResort_reserv_id() %>')" style="background-color: #00A2E8; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">삭제</button> -->
         <button type="button" onclick="reservationDetailList('<%= reservation.getResort_reserv_id() %>')" style="background-color: #00A2E8; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">상세보기 ▼</button>
      </td>
    </tr>
<% } } else { %>
    <tr>
      <td colspan="9">예약 리스트가 존재하지 않습니다.</td>
    </tr>
<% } %>
