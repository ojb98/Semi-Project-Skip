<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<%
    session.setAttribute("skiID", 1);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
<script type="text/javascript">
  // 승인 대기 리스트 갱신 (AJAX GET)
  function requestReservationList() {
    var xhr = new XMLHttpRequest();
    var skiID = '<%= session.getAttribute("skiID") %>';
	xhr.onreadystatechange = function() {
	    if(xhr.readyState === 4) {
	        if(xhr.status === 200) {
	        	document.getElementById("reviewTableBody").innerHTML = xhr.responseText;
	        } else {
	            alert("리스트 갱신 중 오류");
	        }
	    }
	};
	xhr.open("GET", "reviewList.jsp?skiID="+encodeURIComponent(skiID), true);
	xhr.send();
  }
  function requestDelete(review_id) {
      var xhr = new XMLHttpRequest();
      xhr.onreadystatechange = function(){
          if(xhr.readyState === 4){
              if(xhr.status === 200){
                  requestReservationList();
              } else {
                  alert("삭제 중 오류");
              }
          }
      };
      xhr.open("POST", "deleteRequest.jsp", true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xhr.send("review_id=" + encodeURIComponent(review_id));
  }
  function searchList() {
      var keyword = document.getElementById("searchInput").value;
      var filter = document.getElementById("filterSelect").value;
      var skiID = '<%= session.getAttribute("skiID") %>';
      var xhr = new XMLHttpRequest();
      xhr.onreadystatechange = function(){
          if(xhr.readyState === 4){
              if(xhr.status === 200){
                  document.getElementById("reservationTableBody").innerHTML = xhr.responseText;
              } else {
                  alert("검색 중 오류");
              }
          }
      };
      xhr.open("GET", "reviewList.jsp?keyword=" + encodeURIComponent(keyword) + "&filter=" + encodeURIComponent(filter) + "&skiID="+encodeURIComponent(skiID), true);
      xhr.send();
  }
  window.onload = function() {
	  requestReservationList();
  };
  
</script>
</head>
<body>
    <!-- 상단 헤더 -->
    <header>
        <div class="header-left">
            <a href="${pageContext.request.contextPath}/admin/dashboard">
                <h1>SKI:P</h1>
            </a>
        </div>
    </header>
    
    <!-- 왼쪽 사이드바 -->
    <aside class="sidebar">
        <div class="sidebar-profile">
            <img src="" alt="사진프로필" class="profile-icon">
            <div class="admin-name">관리자님</div>
        </div>
        <ul>
            <li><a href="${pageContext.request.contextPath}/skiAdmin/skiAdminMain.jsp">사업장등록신청</a></li>
	        <li><a href="${pageContext.request.contextPath}/skiAdmin/testservlet2">상품등록/관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/skiAdmin/skiReservation.jsp">예약 관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/skiAdmin/testservlet4">문의 관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/skiAdmin/testservlet5">리뷰 관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/skiAdmin/testservlet6">통계</a></li>
        </ul>
    </aside>
    
    <!-- 메인 컨텐츠 영역 -->
    <main class="main-content">
        <!-- 테이블 영역 -->
        <div class="table-container">
        <!-- 리스트 상단 우측에 작게 표시되는 검색 컨트롤 영역 -->
        <div class="list-header">
        <h3>전체 예약 리스트</h3>
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
                        <th>예약번호</th>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th>이용예정일</th>                         
                        <th>예약생성일</th>
                        <th>상태</th>
                        <th>수정</th>
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
