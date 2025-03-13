<%@page import="adminPageMapper.RootAdminMapper"%>
<%@page import="adminDto.SkiReviewsDTO"%>
<%@page import="adminDto.SkiReservationDTO"%>
<%@page import="skiAdminPageMapper.SkiAdminMapper"%>
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
	int skiID = Integer.parseInt(request.getParameter("skiID"));  
	Map<String,Object> params =new HashMap<>();
	params.put("skiID",skiID);
	String reservStatus = "";
	
	SqlSession sqlSession= SqlSessionFactoryService.getSqlSessionFactory().openSession();
	SkiAdminMapper mapper = sqlSession.getMapper(SkiAdminMapper.class);
	RootAdminMapper Rmapper = sqlSession.getMapper(RootAdminMapper.class);
	List<SkiReviewsDTO> reviewsList = mapper.getSkiReviews(params);
	List<SkiReviewsDTO> searchReviewsList = mapper.getSearchSkiReviews(params);	
	if (keyword != null && !keyword.trim().isEmpty()) {
	    if ("userName".equals(filter)) {
	        params.put("name", keyword);
	    } else if ("userId".equals(filter)) {
	        params.put("user_id", keyword);
	    } else if ("userEmail".equals(filter)) {
	        params.put("email", keyword);
	    }
	    searchReviewsList = mapper.getSearchSkiReviews(params);
	}
	List<SkiReviewsDTO> displayList = (searchReviewsList != null) ? searchReviewsList : reviewsList;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<% if (displayList != null && !displayList.isEmpty()) {
	   int count = 0;
       for (SkiReviewsDTO review : displayList) {
    	   if(count++ >= 10) break;
%>
    <tr>
      <td><%= review.getPaymentId() %></td>
      <td><%= review.getReviewImg() %></td>
      <td><%= review.getReviewComment() %></td>
      <td><%= review.getCreatedAt() %></td>
      <td><%= sdf.format(review.getCreatedAt()) %></td>
      <td><%= reservStatus %></td>
      <td>
         <button type="button" onclick="requestDelete('<%= review.getReviewId() %>')" style="background-color: #00A2E8; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">삭제</button>
         <button type="button" style="background-color: #00A2E8; color: white; border: none; border-radius: 5px; padding: 5px 15px; cursor: pointer;">상세보기 ▼</button>
      </td>
    </tr>
<%    } 
   } else { %>
    <tr>
      <td colspan="9">예약 리스트가 존재하지 않습니다.</td>
    </tr>
<% } sqlSession.close();%>
