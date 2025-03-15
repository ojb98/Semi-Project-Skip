<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    List<UsersDTO> usersList = (List<UsersDTO>)request.getAttribute("usersList");
%>

<%
    if (usersList != null && !usersList.isEmpty()) {
        for (UsersDTO user : usersList) { %>
    <tr>
        <td><%= user.getUuid() %></td>
        <td><%= user.getName() %></td>
        <td><%= user.getUser_id() %></td>
        <td><%= user.getEmail() %></td>
        <td><%= user.getPhone() %></td>
        <td><%= user.getSocial() %></td>
        <td><%= user.getRole() %></td>
        <td><%= sdf.format(user.getRegdate()) %></td>
        <td>
            <button type="button" onclick="requestDelete('<%= user.getUuid() %>')"
                    style="background-color: #df4e10; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">
                탈퇴
            </button>
        </td>
    </tr>
<% } } else { %>
    <tr>
        <td colspan="9">리스트가 존재하지 않습니다.</td>
    </tr>
<% } %>