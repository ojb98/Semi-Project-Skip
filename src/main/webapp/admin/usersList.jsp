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
	String keyword = request.getParameter("keyword");
	String filter = request.getParameter("filter");
	Map<String,Object> params =new HashMap<>();

	SqlSession sqlSession= SqlSessionFactoryService.getSqlSessionFactory().openSession();
	RootAdminMapper mapper = sqlSession.getMapper(RootAdminMapper.class);
	List<UsersDTO> usersList = mapper.getUsersList();  
	List<UsersDTO> searchUsersList = mapper.getSearchUsersList(params);
	
	if (keyword != null && !keyword.trim().isEmpty()) {
	    if ("userName".equals(filter)) {
	        params.put("name", keyword);
	    } else if ("userId".equals(filter)) {
	        params.put("user_id", keyword);
	    } else if ("userEmail".equals(filter)) {
	        params.put("email", keyword);
	    }
	    searchUsersList = mapper.getSearchUsersList(params);
	}
	//검색어 유무에 따라 출력할 리스트
	List<UsersDTO> displayList = (searchUsersList != null) ? searchUsersList : usersList;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>
<%

	if (displayList != null && !displayList.isEmpty()) {
	   int count = 0;
       for (UsersDTO user : displayList) {
    	   if(count++ >= 10) break;	%>
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
         <button type="button" onclick="requestDelete('<%= user.getUuid() %>')" style="background-color: #df4e10; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">탈퇴</button>
      </td>
    </tr>
<%    } 
   } else { %>
    <tr>
      <td colspan="9">리스트가 존재하지 않습니다.</td>
    </tr>
<% } sqlSession.close();%>
	