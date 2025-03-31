<!-- /rentalAdmin/purchasedList.jsp -->
<%@page import="rental.dto.RentalSalesListDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%
    List<RentalSalesListDto> purchasedList = (List<RentalSalesListDto>) request.getAttribute("salesList");
    int currentPage = (Integer) request.getAttribute("currentPage");
    int totalPages = (Integer) request.getAttribute("totalPages");
    String listType = (String) request.getAttribute("listType");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>	


<table>
	<thead>
		<tr>
			<th>결제번호</th>
			<th>아이디</th>
			<th>결제방식</th>
			<th>결제총액</th>
			<th>결제상태</th>
			<th>결제일시</th>
		</tr>
	</thead>
	<tbody>
		<%
		    if(purchasedList != null && !purchasedList.isEmpty()){
		        for(RentalSalesListDto sales : purchasedList){
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
	</tbody>
</table>		

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
	
			