<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="adminDto.UsersDTO" %>
<%
    List<UsersDTO> userList = (List<UsersDTO>) request.getAttribute("userList");
    int currentPage = (Integer) request.getAttribute("currentPage");
    int totalPages = (Integer) request.getAttribute("totalPages");
    String listType = (String) request.getAttribute("listType");
%>
<table>
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>역할</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>가입일</th>
			<th>상태</th>
			<th>승인/거부</th>
		</tr>
	</thead>
	<tbody>
	<%
		if(userList != null && !userList.isEmpty()){
			for(UsersDTO user : userList){
	%>
		<tr>
			<td><%= user.getUser_id() %></td>
			<td><%= user.getName() %></td>
			<td><%= user.getRole() %></td>
			<td><%= user.getPhone() %></td>
			<td><%= user.getEmail() %></td>
			<td><%= user.getRegdate() %></td>
			<td><%= user.getStatus() %></td>
			<td>
				<button onclick="requestApproval('<%= user.getUuid() %>')" style="background-color: #00A2E8; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">승인</button>
				<button onclick="requestDeny('<%= user.getUuid() %>')"style="background-color: #FF5D17; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">거부</button>
			</td>
		</tr>
	<%
			}
		} else {
	%>
		<tr>
			<td colspan="8">승인 대기 리스트가 없습니다.</td>
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
