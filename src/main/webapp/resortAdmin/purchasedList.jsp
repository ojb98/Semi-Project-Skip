<%@page import="resort.dto.ResortSalesListDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%
    List<ResortSalesListDto> purchasedList = (List<ResortSalesListDto>) request.getAttribute("salesList");
    int currentPage = (Integer) request.getAttribute("currentPage");
    int totalPages = (Integer) request.getAttribute("totalPages");
    String listType = (String) request.getAttribute("listType");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>	
	<%
		if(purchasedList != null && !purchasedList.isEmpty()){
			for(ResortSalesListDto sales : purchasedList){		    
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
			<td colspan="6">결제 내역이 없습니다.</td>
		</tr>
	<%
		}
	%>	
<td colspan="6">
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
</td>