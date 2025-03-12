<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="adminPageMapper.AdminApprovalRequestMapper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="mybatis.service.SqlSessionFactoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	String keyword = request.getParameter("keyword");
	String filter = request.getParameter("filter");
	Map<String,Object> params =new HashMap<>();
	
	SqlSession sqlSession= SqlSessionFactoryService.getSqlSessionFactory().openSession();
	AdminApprovalRequestMapper mapper = sqlSession.getMapper(AdminApprovalRequestMapper.class);
	List<UsersDTO> pendingUsersList = mapper.getPendingUsers();
	List<UsersDTO> searchPendingUsersList = mapper.getSearchPendingUsers(params);	
	
	if (keyword != null && !keyword.trim().isEmpty()) {
	    if ("userName".equals(filter)) {
	        params.put("name", keyword);
	    } else if ("userId".equals(filter)) {
	        params.put("user_id", keyword);
	    } else if ("userEmail".equals(filter)) {
	        params.put("email", keyword);
	    }
	    searchPendingUsersList = mapper.getSearchPendingUsers(params);
	}
	List<UsersDTO> displayList = (searchPendingUsersList != null) ? searchPendingUsersList : pendingUsersList;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>
<% if (displayList != null && !displayList.isEmpty()) {
	   int count = 0;
       for (UsersDTO user : displayList) {
    	   if(count++ >= 10) break;	%>
    <tr>
      <td><%= user.getUser_id() %></td>
      <td><%= user.getName() %></td>
      <td><%= user.getRole() %></td>
      <td><%= user.getPhone() %></td>
      <td><%= user.getEmail() %></td>
      <td><%= sdf.format(user.getRegdate()) %></td>
      <td><%= "P".equals(user.getStatus()) ? "승인 대기중" : user.getStatus()%></td>
      <td>
         <button type="button" onclick="requestApproval('<%= user.getUuid() %>')" style="background-color: #1074df; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">승인</button>
         <button type="button" onclick="requestDeny('<%= user.getUuid() %>')" style="background-color: #df4e10; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">거부</button>
      </td>
    </tr>
<%    } 
   } else { %>
    <tr>
      <td colspan="6">승인 대기 리스트가 존재하지 않습니다.</td>
    </tr>
<% } sqlSession.close();%>
	