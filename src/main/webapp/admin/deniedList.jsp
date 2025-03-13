<%@page import="adminPageMapper.RootAdminMapper"%>
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
    List<UsersDTO> deniedList = (List<UsersDTO>)request.getAttribute("deniedList");
%>

<%
    if (deniedList != null && !deniedList.isEmpty()) {
        for (UsersDTO user : deniedList) { %>
    <tr>
	    <td><%= user.getUser_id() %></td>
		<td><%= user.getName() %></td>
		<td><%= user.getRole() %></td>
		<td><%= user.getPhone() %></td>
		<td><%= user.getEmail() %></td>
		<td><%= sdf.format(user.getRegdate()) %></td>
		<td><%= "N".equals(user.getStatus()) ? "승인 대기중" : user.getStatus()%></td>
		<td>
		    <button type="button" onclick="requestApproval('<%= user.getUuid() %>')" style="background-color: #1074df; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">승인</button>
		    <button type="button" onclick="requestDelete('<%= user.getUuid() %>')" style="background-color: #df4e10; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">삭제</button>
		</td>
    </tr>
<% } } else { %>
    <tr>
        <td colspan="8">리스트가 존재하지 않습니다.</td>
    </tr>
<% } %>
