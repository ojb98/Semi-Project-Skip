<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
</head>
<body>

<!-- 상단 헤더 -->
<header>
    <div class="header-left">
        <a href="${pageContext.request.contextPath}/rentalAdmin/rentalAdminMain.jsp">
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
        <li><a href="${pageContext.request.contextPath}/adminRental/insert">렌탈샵 등록</a></li>
        <li><a href="${pageContext.request.contextPath}/adminRental/list">렌탈샵 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/adminRentCategory/insert">장비카테고리 등록</a></li>
        <li><a href="${pageContext.request.contextPath}/adminRentCategory/list">장비카테고리 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/rentalAdmin/rentalReservation">예약 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/rentalAdmin/testservlet4">문의 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/rentalshopAdmin/rentalshopAdminReview">리뷰 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/rentalAdmin/testservlet6">통계</a></li>
    </ul>
</aside>