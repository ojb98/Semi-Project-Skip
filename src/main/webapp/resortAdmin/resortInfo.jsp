<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminInfo.css">

<!-- 전역 변수 설정 -->
 <script>
     var contextPath = "${pageContext.request.contextPath}";
     
     function showSection(section) {
         document.getElementById("resortInfo").style.display = section === 'resort' ? "block" : "none";
         document.getElementById("dynamicContent").style.display = section !== 'resort' ? "block" : "none";
     }
    
     //section: 'ski'이면 렌탈샵 기본정보만, 'item'이면 카테고리&장비 정보만 보여줌
     function showSection(section) {
         if (section === 'resort') {
             document.getElementById("resortInfo").style.display = "block";
             document.getElementById("dynamicContent").style.display = "none";
         } else if (section === 'facility') {
             document.getElementById("resortInfo").style.display = "none";
             document.getElementById("dynamicContent").style.display = "block";
         } else if (section === 'room') {
             document.getElementById("resortInfo").style.display = "none";
             document.getElementById("dynamicContent").style.display = "block";
         }
     }
     
     function loadFacilityInfo() {
         showSection('facility');
         var resortId = document.getElementById("resortInfo").getAttribute("data-resort-id");
         var xhr = new XMLHttpRequest();
         xhr.open("GET", contextPath + "/adminFacility/detail?resort_id=" + resortId, true);
         xhr.onreadystatechange = function () {
             if (xhr.readyState === 4 && xhr.status === 200) {
                 document.getElementById("dynamicContent").innerHTML = xhr.responseText;
                 document.getElementById("dynamicContent").setAttribute("data-resort-id", resortId); // resort_id 저장
             }
         };
         xhr.send();
     }

     //AJAX로 객실 목록과 페이징 네비게이션을 로드
     function loadRoomInfo(page) {
         showSection('room');
         var resortId = document.getElementById("resortInfo").getAttribute("data-resort-id");
         var xhr = new XMLHttpRequest();
         xhr.open("GET", contextPath + "/adminRoom/detail?resort_id=" + resortId + "&page=" + page, true);
         xhr.onreadystatechange = function() {
             if (xhr.readyState === 4 && xhr.status === 200) {
            	  document.getElementById("dynamicContent").innerHTML = xhr.responseText;
                  document.getElementById("dynamicContent").setAttribute("data-resort-id", resortId); // resort_id 저장
             }
         };
         xhr.send();
     }
     
    
     //리조트 기본정보만 다시 보여줌
     function showResortInfo() {
    	 showSection('resort');
    	 document.getElementById("dynamicContent").innerHTML = "";
         document.getElementById("dynamicContent").style.display = "none";
     }
 </script>

</head>
<body>
<!-- header -->
<jsp:include page="/resortAdmin/header.jsp" />


<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
<div class="button-container">
    <button onclick="showResortInfo()">리조트 상세보기</button>
    <button onclick="loadFacilityInfo()">시설 상세보기</button>
    <button onclick="loadRoomInfo(1)">객실 상세보기</button>
</div>


<div id="resortInfo" data-resort-id="${rdto.resort_id}">
<h1>리조트 상세정보</h1>

<div class="button-container-right">
	<a href="${pageContext.request.contextPath }/adminResort/update?resort_id=${rdto.resort_id}" >
	<button class="update-btn">수정</button></a>
</div>
	
	<table border="1" width="900">
		<tr>
			<th>번호</th>
			<td>${rdto.resort_id }</td>
		</tr>
		
		<tr>
			<th>관리자ID</th>
			<td>${rdto.user_id }</td>
		</tr>
		
		<tr>	
			<th>리조트명</th>
			<td>${rdto.name }</td>
		</tr>
		
		<tr>
			<th>리조트유형</th>
			<td>${rdto.resort_type }</td>
		</tr>
		
		<tr>
			<th>입실/퇴실(운영시간)</th>
			<td>${rdto.check_time }</td>
		</tr>
		
		<tr>	
			<th>주소</th>
			<td>${rdto.location }</td>
		</tr>
		
		<tr>	
			<th>전화번호</th>
			<td>${rdto.resort_phone }</td>
		</tr>
		
		<tr>
			<th>메인이미지</th>
			<td>
				<img src="${pageContext.request.contextPath }/resortImg/${rdto.remain_img }" width="300">
			</td>
		</tr>

		<tr>
			<th>서브이미지1</th>
			<td>
			<c:choose>
    			<c:when test="${not empty rdto.resub_img1}">
        			<img src="${pageContext.request.contextPath }/resortImg/${rdto.resub_img1}" width="300">
    			</c:when>
    			<c:otherwise>
        			<label>이미지 없음</label>
    			</c:otherwise>
			</c:choose>
			</td>
		</tr>
		
		<tr>
			<th>서브이미지2</th>
			<td>
			<c:choose>
    			<c:when test="${not empty rdto.resub_img2}">
        			<img src="${pageContext.request.contextPath }/resortImg/${rdto.resub_img2}" width="300">
    			</c:when>
    			<c:otherwise>
        			<label>이미지 없음</label>
    			</c:otherwise>
			</c:choose>
			</td>
		</tr>
		
		<tr>
			<th>서브이미지3</th>
			<td>
				<c:choose>
    			<c:when test="${not empty rdto.resub_img3}">
        			<img src="${pageContext.request.contextPath }/resortImg/${rdto.resub_img3}" width="300">
    			</c:when>
    			<c:otherwise>
        			<label>이미지 없음</label>
    			</c:otherwise>
			</c:choose>
			</td>
		</tr>
		
		<tr>
			<th>추가 및 설명</th>
			<td>${rdto.description }</td>
		</tr>
		
		<tr>
			<th>등록일</th>
			<td>${rdto.created_at }</td>
		</tr>
	</table>
</div>
	
<!-- 버튼을 클릭하면 AJAX로 데이터 불러오기 -->

<div id="dynamicContent" style="display: none;"></div>


</main>
</body>
</html>