<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
	<script type="text/javascript">
	  // 승인 대기 리스트 갱신 (AJAX GET)
	  function requestPendingList(){
	      var xhr = new XMLHttpRequest();
	      xhr.onreadystatechange = function(){
	          if(xhr.readyState === 4){
	              if(xhr.status === 200){
	                  document.getElementById("pendingListBody").innerHTML = xhr.responseText;
	              } else {
	                  alert("리스트 갱신 중 오류");
	              }
	          }
	      };
	      xhr.open("GET", "pendingList.jsp", true);
	      xhr.send();
	  }
	  
	  function requestDeniedList(){
	      var xhr = new XMLHttpRequest();
	      xhr.onreadystatechange = function(){
	          if(xhr.readyState === 4){
	              if(xhr.status === 200){
	                  document.getElementById("deniedListBody").innerHTML = xhr.responseText;
	              } else {
	                  alert("거부리스트 갱신 중 오류");
	              }
	          }
	      };
	      xhr.open("GET", "deniedList.jsp", true);
	      xhr.send();
	  }
	
	  // 특정 사용자 승인 처리(AJAX POST)
	  function requestApproval(uuid) {
		  if (currentRequest) {
		        currentRequest.abort(); // 이전 요청 중지
		    }
	      var xhr = new XMLHttpRequest();
	      xhr.onreadystatechange = function(){
	          if(xhr.readyState === 4){
	              if(xhr.status === 200){
	                  requestPendingList();
	                  requestDeniedList();
	              } else {
	                  alert("승인 중 오류");
	              }
	          }
	      };
	      xhr.open("POST", "approvalRequest.jsp", true);
	      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	      xhr.send("uuid=" + encodeURIComponent(uuid));
	  }
	  function requestDeny(uuid) {
	      var xhr = new XMLHttpRequest();
	      xhr.onreadystatechange = function(){
	          if(xhr.readyState === 4){
	              if(xhr.status === 200){
	                  requestPendingList();
	                  requestDeniedList();
	              } else {
	                  alert("거부 중 오류");
	              }
	          }
	      };
	      xhr.open("POST", "denyRequest.jsp", true);
	      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	      xhr.send("uuid=" + encodeURIComponent(uuid));
	  }
	  function requestDelete(uuid) {
	      var xhr = new XMLHttpRequest();
	      xhr.onreadystatechange = function(){
	          if(xhr.readyState === 4){
	              if(xhr.status === 200){
	                  requestDeniedList();
	              } else {
	                  alert("삭제 중 오류");
	              }
	          }
	      };
	      xhr.open("POST", "deleteRequest.jsp", true);
	      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	      xhr.send("uuid=" + encodeURIComponent(uuid));
	  }
	  function searchList() {
	      var keyword = document.getElementById("searchInput").value;
	      var filter = document.getElementById("filterSelect").value;
	      
	      var xhr = new XMLHttpRequest();
	      xhr.onreadystatechange = function(){
	          if(xhr.readyState === 4){
	              if(xhr.status === 200){
	                  document.getElementById("pendingListBody").innerHTML = xhr.responseText;
	              } else {
	                  alert("검색 중 오류");
	              }
	          }
	      };
	      // usersList.jsp 파일에 검색어와 필터 값 전달 (백엔드에서 해당 파라미터에 따른 결과 반환 필요)
	      xhr.open("GET", "pendingList.jsp?keyword=" + encodeURIComponent(keyword) + "&filter=" + encodeURIComponent(filter), true);
	      xhr.send();
	  }
	  // 페이지 로드 시 승인 대기 리스트 자동 갱신
	  window.onload = function() {
	      requestPendingList();
	      requestDeniedList();
	  };
	</script>
</head>
<body>
<header>
    <div class="header-left">
        <a href="${pageContext.request.contextPath}/admin/dashboard">
            <h1>SKI:P</h1>
        </a>
    </div>
</header>

<aside class="sidebar">
    <div class="sidebar-profile">
        <img src="" alt="사진프로필" class="profile-icon">
        <div class="admin-name">관리자님</div>
    </div>
    
    <ul>
        <li><a href="${pageContext.request.contextPath}/admin/dashboard">대시보드</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/approvalRequest" >관리자 요청 승인/관리</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/customersInfo">고객 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/paymentsInfo">매출 관리</a></li>
    </ul>
</aside>
<!-- 문제점: 해당 업체의 진짜 관리자인지, 사칭하는 일반 유저인지에 대한 구별 필요 -->
<main class="main-content">
	<div class="table-container" >
	<div class="list-header">
       <h3>승인 대기 리스트(관리자)</h3>
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
		      <th>아이디</th>
		      <th>이름</th>
		      <th>역할</th>
		      <th>전화번호</th>
		      <th>이메일</th>
		      <th>가입일</th>
		      <th>상태</th>
		      <th>승인</th>
		    </tr>
		  </thead>
		  <tbody id="pendingListBody">
		  </tbody>
		</table>
	</div>
	<div class="table-container" >
	<div class="list-header">
       <h3>승인 거부 리스트(관리자)</h3>
    </div>				
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
		      <th>승인</th>
		    </tr>
		  </thead>
		  <tbody id="deniedListBody">
		  </tbody>
		</table>
	</div>
</main>
</body>
</html>