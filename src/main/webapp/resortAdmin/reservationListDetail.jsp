<%@page import="resort.dto.ResortReservationItemDto"%>
<%@page import="resort.dto.ResortReservationPrintDto"%>
<%@page import="resort.dto.ResortReservationDetailDTO"%>
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
	List<ResortReservationPrintDto> reservationDetailList = (List<ResortReservationPrintDto>)request.getAttribute("reservationDetailList");
	List<ResortReservationItemDto> reservationItemList;
%>
<% 
	if(reservationDetailList != null && !reservationDetailList.isEmpty()){
       for (ResortReservationPrintDto reservation : reservationDetailList) {
    	reservationItemList = reservation.getResortReservationItemDtoList(); 
    	for(ResortReservationItemDto reservationitem : reservationItemList){
%>
    <tr>
      <td><%= reservationitem.getResortRoomId() %></td>
      <td><%= reservationitem.getResortReservId() %></td>
      <td><%= reservationitem.getResortRoomType() %></td>
      <td><%= reservationitem.getResortRoomName() %></td>  
      <td><%= reservationitem.getQuantity() %></td>      
      <td><%= reservationitem.getPricePerNight() %>원</td>
          
    </tr>
<% } } } else { %>
    <tr>
      <td colspan="9">예약 리스트가 존재하지 않습니다.</td>
    </tr>
<% } %>
