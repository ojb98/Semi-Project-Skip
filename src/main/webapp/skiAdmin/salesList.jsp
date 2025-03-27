<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ski.dto.SkiSalesListDto, java.util.List, java.text.SimpleDateFormat" %>
<%
    SimpleDateFormat sdfhms = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    List<SkiSalesListDto> salesList = (List<SkiSalesListDto>) request.getAttribute("salesList");
%>
<% if(salesList != null && !salesList.isEmpty()) {
     for (SkiSalesListDto sales : salesList) { %>
<tr>
    <td><%= sales.getPayment_id() %></td>
    <td><%= sales.getSki_reserv_id() %></td>
    <td><%= sales.getUser_id() %></td>
    <td><%= sales.getPayment_method() %></td>
    <td><%= sales.getTotal_price() %></td>
    <td><%= sales.getStatus() %></td>
    <td><%= sdfhms.format(sales.getCreated_at()) %></td>
</tr>
<%  }
   } else { %>
<tr>
    <td colspan="7">매출 내역이 존재하지 않습니다.</td>
</tr>
<% } %>
