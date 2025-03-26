<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminRoomInsertUpdate.css">
<script src="${pageContext.request.contextPath}/js/resortAdminRoomInsert.js"></script>

</head>
<body>
<!-- header -->
<jsp:include page="/resortAdmin/header.jsp" />


<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
<h1>객실 등록</h1>
<div class="form-container">
<form id="roomForm" action="${pageContext.request.contextPath }/adminRoom/insert" 
	method="post" enctype="multipart/form-data" onsubmit="return checkData(event)">

	<input type="hidden" name="resort_id" value="${param.resort_id }"><br>
	
	<label for="resortName">리조트명</label>
	<input type="text" name="name" id="resortName" value="${param.name }" readonly="readonly"><br>
	
	<label for="roomName">객실명</label>
	<input type="text" name="room_name" id="roomName"><br>
	
	<label for="roomType">객실 유형</label>
	<select id="roomType" name="room_type">
		<option value="SINGLE">싱글룸</option>
		<option value="TWIN">트윈룸</option>
		<option value="DOUBLE">더블룸</option>
		<option value="SUITE">스위트룸</option>
		<option value="FAMILY">패밀리룸</option>
	</select><br>
	
	<label for="roomQuantity">객실 수</label>
	<input type="number" name="room_quantity" id="roomQuantity"><br>

	<label for="maxGuests">최대 숙박인원</label>
	<input type="number" name="max_guests" id="maxGuests"><br>
	
	<label for="price">1박당 가격</label>
	<input type="number" name="price_per_night" id="price"><br>
	
	<label for="mainImg">메인이미지</label>
		<input type="file" name="rmain_img" id="mainImg"><br>

	<label for="subImg1">이미지추가1</label>
		<input type="file" name="rsub_img1" id="subImg1"><br>
	
	<label for="subImg2">이미지추가2</label>
		<input type="file" name="rsub_img2" id="subImg2"><br>
	
	<label for="subImg3">이미지추가3</label>
		<input type="file" name="rsub_img3" id="subImg3"><br>
	
	<label for="description">객실 추가설명</label><br>
	<textarea cols="30" rows="5" name="description" id="description"></textarea><br>
	
	<input type="submit" value="등록"> 
</form>
</div>

</main>
</body>
</html>