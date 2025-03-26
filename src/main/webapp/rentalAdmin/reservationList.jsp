<%@page import="rental.dto.RentalReservationPrintDto"%>
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
	List<RentalReservationPrintDto> reservationList = (List<RentalReservationPrintDto>)request.getAttribute("reservationList");
	java.util.Date today = new java.util.Date();
    java.sql.Date sqlToday = new java.sql.Date(today.getTime());
%>
<%
if(reservationList != null && !reservationList.isEmpty()){
       for (RentalReservationPrintDto reservation : reservationList) {
    		String rowStyle = "";
    		String reservStatus = "";
           if("대여중".equals(reservation.getStatus()) && reservation.getRental_end().before(sqlToday)){
               rowStyle = "style='background-color:#f08080;'";
           }else if("반납완료".equals(reservation.getStatus()) || "취소".equals(reservation.getStatus())){
        	   rowStyle = "style='background-color:#e8e8e8;'";
           }else if("대여중".equals(reservation.getStatus())){
        	   rowStyle = "style='background-color:#87cefa;'";
           }
%>
	<tr <%= rowStyle %>>
      <td><%= reservation.getRent_reserv_id() %></td>
      <td><%= reservation.getUserName() %></td>
      <td><%= reservation.getUserId() %></td>
      <td><%= reservation.getUserEmail() %></td>
      <td><%= reservation.getPhone() %></td>
      <td><%= reservation.getRental_start() %></td>
      <td><%= reservation.getRental_end() %></td>
      <td><%= reservation.getCreated_at() %></td>
      <td><%= reservation.getStatus() %></td>
      <td>         
         <button type="button" onclick="reservationDetailList('<%= reservation.getRent_reserv_id() %>')" style="background-color: #00A2E8; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">상세보기 ▼</button>
      </td>
      <td>
      <% if(reservation.getStatus().equals("대여중")){ %>       
         <button type="button" onclick="requestUpdate('<%= reservation.getRent_reserv_id() %>')" style="background-color: #00A2E8; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">반납완료</button>
      <% } %> 
      </td>
    </tr>
<% } } else { %>
    <tr>
      <td colspan="9">예약 리스트가 존재하지 않습니다.</td>
    </tr>
<% } %>
