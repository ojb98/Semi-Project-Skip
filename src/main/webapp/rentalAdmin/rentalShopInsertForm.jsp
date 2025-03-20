<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminInsertUpdate.css">

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
<h1>렌탈샵 등록</h1>
<div class="form-container">
<form id="insertForm" action="${pageContext.request.contextPath }/adminRental/insert" 
	method="post" enctype="multipart/form-data" onsubmit="return checkData(event)">
	
	<label for="name">렌탈샵명</label>
	<input type="text" name="name" id="name"><br>
	
	<label for="phone">렌탈샵 전화번호</label>
	<input type="text" name="rental_phone" id="phone" placeholder="070-1111-2222"
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
	
	<label for="description">렌탈샵 추가설명</label><br>
	<textarea cols="30" rows="5" name="description" id="description"></textarea><br>
	

	<input type="submit" value="등록">
	
</form>
</div>

</body>
</html>