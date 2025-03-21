<%@page import="java.util.Map"%>
<%@page import="adminUtil.FilterMapping"%>
<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
    
	<script type="text/javascript">
	  var contextPath = "${pageContext.request.contextPath}";
	  
	  function requestUsersList(){
	      var xhr = new XMLHttpRequest();
	      xhr.onreadystatechange = function(){
	          if(xhr.readyState === 4){
	              if(xhr.status === 200){
	                  document.getElementById("customerTableBody").innerHTML = xhr.responseText;
	              } else {
	                  alert("리스트 갱신 중 오류");
	              }
	          }
	      };
	      xhr.open("GET", contextPath + "/admin/usersList", true);
	      xhr.send();
	  }
	  function requestDelete(uuid) {
		    if (!confirm("정말로 이 사용자를 삭제하시겠습니까?")) return;
	
		    var xhr = new XMLHttpRequest();
		    xhr.onreadystatechange = function(){
		        if(xhr.readyState === 4){
		            if(xhr.status === 200){
		                if (xhr.responseText === "success") {
		                    alert("회원이 정상적으로 삭제되었습니다.");
		                    requestUsersList(); 
		                } else if (xhr.responseText === "invalid_uuid") {
		                    alert("잘못된 UUID 값입니다.");
		                } else {
		                    alert("삭제 실패.");
		                }
		            } else {
		                alert("서버 오류 발생");
		            }
		        }
		    };
		    xhr.open("POST", contextPath + "/admin/deleteUser", true);
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
	                  document.getElementById("customerTableBody").innerHTML = xhr.responseText;
	              } else {
	                  alert("검색 중 오류");
	              }
	          }
	      };
	      xhr.open("GET", contextPath + "/admin/usersList?keyword=" + encodeURIComponent(keyword) + "&filter=" + encodeURIComponent(filter), true);
	      xhr.send();
	  }
	  
	  window.onload = function() {
	      requestUsersList();
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
            <li><a href="${pageContext.request.contextPath}/admin/dashboard">대시보드</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/adminApprovalRequest.jsp">관리자 요청 승인/관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/customersInfo">고객 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/paymentsInfo">매출 관리</a></li>
        </ul>
    </aside>
    
    <!-- 메인 컨텐츠 영역 -->
    <main class="main-content">
        <!-- 테이블 영역 -->
        <div class="table-container">
        <!-- 리스트 상단 우측에 작게 표시되는 검색 컨트롤 영역 -->
        <div class="list-header">
        <h3>전체 회원 리스트</h3>
            <div class="search-filter-container">
                <select id="filterSelect">
				    <%
				        Map<String, String> filterMap = FilterMapping.getFilterMap();
				        for (Map.Entry<String, String> entry : filterMap.entrySet()) {
				    %>
				        <option value="<%= entry.getValue() %>"><%= entry.getKey() %></option>
				    <% } %>
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
                <tbody id="customerTableBody">
                    <!-- 백엔드에서 반복문으로 출력할 데이터 -->
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>
