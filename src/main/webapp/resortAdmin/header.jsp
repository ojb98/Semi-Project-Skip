<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리조트관리자 페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
    
</head>
<body>

<!-- 상단 헤더 -->
<header>
    <div class="header-left">
        <a href="${pageContext.request.contextPath}/resortAdmin/resortAdminMain.jsp">
            <h1>SKI:P</h1>
        </a>
    </div>
    <!-- 우측 정보는 삭제 -->
</header>

<!-- 왼쪽 사이드바 -->
<aside class="sidebar">
    <div class="sidebar-profile">
        <img src="" alt="사진프로필" class="profile-icon">
        <div class="admin-name">관리자님</div>
    </div>
    <ul>
        <li><a href="${pageContext.request.contextPath}/adminResort/insert">리조트 등록</a></li>
        <li><a href="${pageContext.request.contextPath}/adminResort/list">리조트 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/adminFacility/insert">시설 등록</a></li>
        <li><a href="${pageContext.request.contextPath}/adminFacility/list">시설 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/resortAdmin/reservationList">예약 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/resortAdmin/testservlet4">문의 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/resortAdmin/testservlet5">리뷰 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/resortAdmin/testservlet6">통계</a></li>
    </ul>
</aside> 