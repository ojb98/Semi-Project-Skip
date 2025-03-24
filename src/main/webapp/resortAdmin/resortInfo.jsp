<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminInfo.css">

<script>
    function showSection(section) {
        document.getElementById("resortInfo").style.display = section === 'resort' ? "block" : "none";
        document.getElementById("dynamicContent").style.display = section !== 'resort' ? "block" : "none";
    }

    function loadFacilityInfo() {
        showSection('facility');
        var resortId = document.getElementById("resortInfo").getAttribute("data-resort-id");

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "${pageContext.request.contextPath}/adminFacility/detail?resort_id=" + resortId, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.getElementById("dynamicContent").innerHTML = xhr.responseText;
                document.getElementById("dynamicContent").setAttribute("data-resort-id", resortId); // resort_id 저장
            }
        };
        xhr.send();
    }

    function loadRoomInfo(page) {
        showSection('room');
        var resortId = document.getElementById("resortInfo").getAttribute("data-resort-id");

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "${pageContext.request.contextPath}/adminRoom/detail?resort_id=" + resortId + "&page=" + page, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.getElementById("dynamicContent").innerHTML = xhr.responseText;
                document.getElementById("dynamicContent").setAttribute("data-resort-id", resortId); // resort_id 저장
            }
        };
        xhr.send();
    }

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
<!-- aside -->
<jsp:include page="/resortAdmin/aside.jsp" />

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
			<td></td>
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

<button class="list-btn" onclick="window.location.href='${pageContext.request.contextPath}/adminResort/list'">리스트로 가기</button>
</main>
</body>
</html>