<%@page import="ski.dto.SkiSalesListDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%
    List<SkiSalesListDto> puchasedList = (List<SkiSalesListDto>) request.getAttribute("salesList");
    int currentPage = (Integer) request.getAttribute("currentPage");
    int totalPages = (Integer) request.getAttribute("totalPages");
    String listType = (String) request.getAttribute("listType");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>	
	<%
		if(puchasedList != null && !puchasedList.isEmpty()){
			for(SkiSalesListDto sales : puchasedList){		    
	%>
		<tr>
			<td><%= sales.getPayment_id() %></td>
			<td><%= sales.getUser_id() %></td>
			<td><%= sales.getPayment_method() %></td>
			<td><%= sales.getTotal_price() %></td>
			<td><%= sales.getStatus() %></td>
			<td><%= sdf.format(sales.getCreated_at()) %></td>			
		</tr>
	<%
			}
		} else {
	%>
		<tr>
			<td colspan="6">승인 거부 리스트가 없습니다.</td>
		</tr>
	<%
		}
	%>	
<div class="pagination">
	<button onclick="changePage('<%= listType %>', <%= currentPage - 1 %>)" <%= currentPage <= 1 ? "disabled" : "" %>>이전</button>
	<%
		for(int i = 1; i <= totalPages; i++){
	%>
		<button onclick="changePage('<%= listType %>', <%= i %>)" <%= currentPage == i ? "class='active'" : "" %>><%= i %></button>
	<%
		}
	%>
	<button onclick="changePage('<%= listType %>', <%= currentPage + 1 %>)" <%= currentPage >= totalPages ? "disabled" : "" %>>다음</button>
</div>
