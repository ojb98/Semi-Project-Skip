<%@page import="ski.dto.SkiReservationItemDto"%>
<%@page import="ski.dto.SkiReservationPrintDto"%>
<%@page import="ski.dto.SkiReservationDetailDTO"%>
<%@page import="ski.mapper.SkiReservationMapper"%>
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
	List<SkiReservationPrintDto> reservationDetailList = (List<SkiReservationPrintDto>)request.getAttribute("reservationDetailList");
	List<SkiReservationItemDto> reservationItemList;
%>
<% 
	if(reservationDetailList != null && !reservationDetailList.isEmpty()){
       for (SkiReservationPrintDto reservation : reservationDetailList) {
    	reservationItemList = reservation.getSkiReservationItemDtoList(); 
    	for(SkiReservationItemDto reservationitem : reservationItemList){
%>
    <tr>
      <td><%= reservationitem.getSki_reserv_id() %></td>
      <td><%= reservationitem.getSki_item_id() %></td>
      <td><%= reservationitem.getItem_name() %></td>            
      <td><%= reservationitem.getQuantity() %></td>
      <td><%= reservationitem.getSubtotal_price() %>원</td>      
    </tr>
<% } } } else { %>
    <tr>
      <td colspan="9">예약 리스트가 존재하지 않습니다.</td>
    </tr>
<% } %>
