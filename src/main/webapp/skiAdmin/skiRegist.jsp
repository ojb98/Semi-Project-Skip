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
    <jsp:include page="/skiAdmin/header.jsp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
</head>
<body>


<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
        <!-- 테이블 영역 -->
        <div class="table-container">
        <!-- 리스트 상단 우측에 작게 표시되는 검색 컨트롤 영역 -->
        <div class="list-header">
        <h3>예약리스트</h3>
            <div class="search-filter-container">
                <select id="filterSelect">
                    <option value="userName">이름</option>
                    <option value="userId">아이디</option>
                    <option value="userEmail">이메일</option>                    
                </select>
                <div class="search-box">
                  <input type="text" id="searchInput" placeholder="검색어 입력" />
                  <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="검색 아이콘" class="search-icon" onclick="searchList()"/>
                </div>
            </div>
        </div>
            <table>
                <thead>
                    <tr>
                        <th>고유번호</th>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th>가입유형</th>
                        <th>유형</th>
                        <th>가입일</th>
                        <th>활동</th>
                    </tr>
                </thead>
                <tbody id="reservationTableBody">
                    <!-- 백엔드에서 반복문으로 출력할 데이터 -->
                </tbody>
            </table>
        </div>
    </main>

</body>
</html>
