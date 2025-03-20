<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리조트관리자 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminInsertUpdate.css">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="${pageContext.request.contextPath}/js/adminInsert.js"></script>

<!-- 카카오(다음) 주소 API 스크립트 추가 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode(){
		new daum.Postcode({
			oncomplete: function(data){
				document.getElementById("location").value = data.address;
			}
		}).open();
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
	
<h1>리조트 등록</h1>
<div class="form-container">
<form id="insertForm" action="${pageContext.request.contextPath }/adminResort/insert" 
	method="post"enctype="multipart/form-data" onsubmit="return checkData(event)">
	
	<label for="name">리조트명</label>
	<input type="text" name="name" id="name"><br>
	
	<label for="resortType">리조트 유형</label>
	<select name="resort_type" id="resortType">
			<option value="condo">콘도</option>
			<option value="hostel">호텔</option>
	</select><br>
	
	<label for="checkTime">입실/퇴실(운영) 시간</label>
	<input type="text" name="check_time" id="checkTime" placeholder="15:00/11:00"><br>
	
	<label for="phone">리조트 전화번호</label>
	<input type="text" name="resort_phone" id="phone" placeholder="070-1111-2222"
		maxlength="13" oninput="formatPhoneNumber(this)"><br>
	
	<label for="location">주소</label>
	<div class="address-row">
	    <input type="text" name="location" id="location" readonly>
	    <button type="button" onclick="execDaumPostcode()">주소 검색</button>
	</div>
	
	<label for="mainImg">메인이미지</label>
	<input type="file" name="remain_img" id="mainImg"><br>

	<label for="subImg1">이미지추가1</label>
	<input type="file" name="resub_img1" id="subImg1"><br>
	
	<label for="subImg2">이미지추가2</label>
	<input type="file" name="resub_img2" id="subImg2"><br>
	
	<label for="subImg3">이미지추가3</label>
	<input type="file" name="resub_img3" id="subImg3"><br>
	
	<label for="description">리조트 추가설명</label><br>
	<textarea cols="30" rows="5" name="description" id="description"></textarea><br>
	
	
	<h2>이용 가능한 시설 선택</h2>
	<c:set var="typeName" value="" />
	

	<c:forEach var="facility" items="${flist}">
	    <!-- 시설유형이름 변경시 제목 출력 -->
	    <c:if test="${facility.type_name != typeName}">
	        <h4>${facility.type_name}</h4>
	        <c:set var="typeName" value="${facility.type_name}" />
	    </c:if>	
	    
	    <!-- 시설이름 체크박스 영역을 div로 감싸기 -->
	    <div class="facility-group">
	        <input type="checkbox" id="${facility.ftypesDto[0].facility_id}" name="facility_id" value="${facility.ftypesDto[0].facility_id}">
	        <label for="${facility.ftypesDto[0].facility_id}">${facility.ftypesDto[0].facility_name}</label>
	    </div>
	</c:forEach>

	<br>
	<input type="submit" value="등록">
	
</form>
</div>
</main>

</body>
</html>