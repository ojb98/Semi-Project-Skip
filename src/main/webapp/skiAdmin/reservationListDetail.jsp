<%@page import="adminDto.SkiReservationDetailDTO"%>
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
	List<SkiReservationDetailDTO> reservationDetailList = (List<SkiReservationDetailDTO>)request.getAttribute("reservationDetailList");
%>
<% 
	if(reservationDetailList != null && !reservationDetailList.isEmpty()){
       for (SkiReservationDetailDTO reservation : reservationDetailList) {
    		String rowStyle = "";
    		String reservStatus = "";
    		//디테일.jsp 출력까지 확인하기. (reservation)
           
%>
    <tr<%= rowStyle %>>
      <td><%= reservation.getItemId() %></td>
      <td><%= reservation.getCategoryId() %></td>
      <td><%= reservation.getItemName() %></td>
      <td><%= reservation.getQuantity() %></td>
      <td><%= reservation.getTotalQuantity() %></td>
      <td><%= reservStatus %></td>
      
    </tr>
<% } } else { %>
    <tr>
      <td colspan="9">예약 리스트가 존재하지 않습니다.</td>
    </tr>
<% } %>
