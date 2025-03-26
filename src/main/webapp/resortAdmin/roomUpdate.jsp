<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminRoomInsertUpdate.css">
<script src="${pageContext.request.contextPath}/js/resortAdminRoomUpdate.js"></script>

</head>
<body>
<!-- header -->
<jsp:include page="/resortAdmin/header.jsp" />



<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
<h1>객실 수정</h1>
<div class="form-container">
<form id="roomForm" action="${pageContext.request.contextPath }/adminRoom/update" 
	method="post" enctype="multipart/form-data" onsubmit="return checkData(event)">
	
	<label for="roomName">객실명</label>
	<input type="text" name="room_name" id="roomName" value="${dto.room_name }"><br>
		
	<label for="roomType">객실 유형</label>
	<select id="roomType" name="room_type" disabled="disabled">
		<option value="SINGLE"<c:if test="${dto.room_type eq 'SINGLE' }">selected="selected"</c:if>>싱글룸</option>
		<option value="TWIN" <c:if test="${dto.room_type eq 'TWIN' }">selected="selected"</c:if>>트윈룸</option>
		<option value="DOUBLE" <c:if test="${dto.room_type eq 'DOUBLE' }">selected="selected"</c:if>>더블룸</option>
		<option value="SUITE" <c:if test="${dto.room_type eq 'SUITE' }">selected="selected"</c:if>>스위트룸</option>
		<option value="FAMILY" <c:if test="${dto.room_type eq 'FAMILY' }">selected="selected"</c:if>>패밀리룸</option>
	</select><br>
	<input type="hidden" name="room_type" value="${dto.room_type}">
	
	<label for="roomQuantity">객실 수</label>
	<input type="number" name="room_quantity" id="roomQuantity" value="${dto.room_quantity }"><br>

	<label for="maxGuests">최대 숙박인원</label>
	<input type="number" name="max_guests" id="maxGuests" value="${dto.max_guests }"><br>
	
	<label for="price">1박당 가격</label>
	<input type="number" name="price_per_night" id="price" value="${dto.price_per_night }"><br>
	
	<label for="mainImg">메인이미지</label>
		<input type="file" name="rmain_img" id="mainImg"><br>

	<label for="subImg1">이미지추가1</label>
		<input type="file" name="rsub_img1" id="subImg1"><br>
	
	<label for="subImg2">이미지추가2</label>
		<input type="file" name="rsub_img2" id="subImg2"><br>
	
	<label for="subImg3">이미지추가3</label>
		<input type="file" name="rsub_img3" id="subImg3"><br>
	
	<label for="description">객실 추가설명</label><br>
	<textarea cols="30" rows="5" name="description" id="description">${dto.description }</textarea><br>
	
	<input type="hidden" name="room_id" value="${dto.room_id }"><br>
	<input type="hidden" name="resort_id" value="${dto.resort_id }"><br>
	
	<input type="submit" value="수정"> 
</form>
</div>

</main>
</body>
</html>