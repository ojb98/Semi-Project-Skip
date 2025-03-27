<%@page import="adminUtil.FilterMapping"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 요청 승인/관리</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
	
	<script type="text/javascript">
		var contextPath = "${pageContext.request.contextPath}";
		
		// listType: 'pending' 또는 'denied', page: 현재 페이지 번호
		function loadList(listType, page) {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if(xhr.readyState === 4) {
					if(xhr.status === 200) {
						if(listType === 'pending') {
							document.getElementById("pendingListContainer").innerHTML = xhr.responseText;
						} else if(listType === 'denied') {
							document.getElementById("deniedListContainer").innerHTML = xhr.responseText;
						}
					} else {
						alert("리스트 로딩 중 오류가 발생했습니다.");
					}
				}
			};
			var url = contextPath + "/admin/list?type=" + listType + "&page=" + page;
			xhr.open("GET", url, true);
			xhr.send();
		}
		
		// 페이징 버튼 클릭 시 호출
		function changePage(listType, page) {
			loadList(listType, page);
		}
		
		// 승인 요청 (POST)
		function requestApproval(uuid) {
			if(!confirm("정말로 이 사용자를 승인하시겠습니까?")) return;
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState === 4){
					if(xhr.status === 200){
						if(xhr.responseText.trim() === "success"){
							alert("승인이 완료되었습니다.");
							loadList('pending', 1);
							loadList('denied', 1);
						} else {
							alert("승인 요청 실패: " + xhr.responseText);
						}
					} else {
						alert("승인 중 오류가 발생했습니다.");
					}
				}
			};
			xhr.open("POST", contextPath + "/admin/approvalRequest", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("uuid=" + encodeURIComponent(uuid));
		}
		
		// 거부 요청 (POST)
		function requestDeny(uuid) {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState === 4){
					if(xhr.status === 200){
						loadList('pending', 1);
						loadList('denied', 1);
					} else {
						alert("거부 중 오류가 발생했습니다.");
					}
				}
			};
			xhr.open("POST", contextPath + "/admin/denyRequest", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("uuid=" + encodeURIComponent(uuid));
		}
		
		// 삭제 요청 (POST)
		function requestDelete(uuid) {
			if(!confirm("정말로 이 사용자를 삭제하시겠습니까?")) return;
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState === 4){
					if(xhr.status === 200){
						if(xhr.responseText.trim() === "success"){
							alert("삭제 완료.");
							loadList('denied', 1);
						} else {
							alert("삭제 요청 실패: " + xhr.responseText);
						}
					} else {
						alert("삭제 중 오류가 발생했습니다.");
					}
				}
			};
			xhr.open("POST", contextPath + "/admin/deleteUser", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("uuid=" + encodeURIComponent(uuid));
		}
		
		// 검색 기능: listType 인자를 받아 해당 리스트에 결과를 출력
		function searchList(listType) {
			var keyword, filter;
			if(listType == 'pending'){
		      keyword = document.getElementById("searchInputPending").value;
		      filter = document.getElementById("filterSelectPending").value;
			} else if(listType === 'denied'){
			  keyword = document.getElementById("searchInputDenied").value;
			  filter = document.getElementById("filterSelectDenied").value;
			}
		      var xhr = new XMLHttpRequest();
		      xhr.onreadystatechange = function(){
		          if(xhr.readyState === 4){
		              if(xhr.status === 200){
		                  if(listType === 'pending') {
		                      document.getElementById("pendingListContainer").innerHTML = xhr.responseText;
		                  } else if(listType === 'denied') {
		                      document.getElementById("deniedListContainer").innerHTML = xhr.responseText;
		                  }
		              } else {
		                  alert("검색 중 오류");
		              }
		          }
		      };
		      // 기본 검색 시 페이지 1로 처리합니다.
		      xhr.open("GET", contextPath + "/admin/list?type=" + listType + "&page=1" 
		    		  + "&keyword=" + encodeURIComponent(keyword) 
		    		  + "&filter=" + encodeURIComponent(filter), true);
		      xhr.send();
		  }
		
		window.onload = function() {
			loadList('pending', 1);
			loadList('denied', 1);
		};
	</script>
</head>
<body>
	<header>
		<div class="header-left">
			<a href="${pageContext.request.contextPath}/admin/dashboard"><h1>SKI:P</h1></a>
		</div>
	</header>
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
	<main class="main-content">
		<div class="table-container">		
			<h3>승인 대기 리스트(관리자)</h3>
			<div class="search-filter-container">
			    <select id="filterSelectPending">
			        	<%
					        Map<String, String> filterMap = FilterMapping.getFilterMap();
					        for (Map.Entry<String, String> entry : filterMap.entrySet()) {
					    %>
					        <option value="<%= entry.getValue() %>"><%= entry.getKey() %></option>
					    <% } %>                   
	                </select>
			    <div class="search-box">
			        <input type="text" id="searchInputPending" placeholder="검색어 입력" />
			        <!-- 인자로 'pending'을 문자열로 전달 -->
			        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="검색 아이콘" class="search-icon" onclick="searchList('pending')"/>
			    </div>
			</div>
			<!-- AJAX로 불러온 승인 대기 리스트 HTML 조각 -->
			<div id="pendingListContainer"></div>
		</div>
		<div class="table-container">
			<h3>승인 거부 리스트(관리자)</h3>
			<div class="search-filter-container">
		    <select id="filterSelectDenied">
		        	<option value="이름">이름</option>
                    <option value="아이디">아이디</option>
                    <option value="이메일">이메일</option>                    
                </select>
		    <div class="search-box">
		        <input type="text" id="searchInputDenied" placeholder="검색어 입력" />
		        <!-- 인자로 'denied'를 문자열로 전달 -->
		        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="검색 아이콘" class="search-icon" onclick="searchList('denied')"/>
		    </div>
		</div>
			<!-- AJAX로 불러온 승인 거부 리스트 HTML 조각 -->
			<div id="deniedListContainer"></div>
		</div>
	</main>
</body>
</html>
