<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
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
        <li><a href="${pageContext.request.contextPath}/adminResort/reservList">예약 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/resortAdmin/testservlet4">문의 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/resortAdmin/testservlet5">리뷰 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/resortAdmin/testservlet6">통계</a></li>
    </ul>
</aside>
    