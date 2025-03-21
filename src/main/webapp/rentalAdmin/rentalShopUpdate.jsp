<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminInsertUpdate.css">

<script src="${pageContext.request.contextPath}/js/adminUpdate.js"></script>

<!-- 카카오(다음) 주소 API 스크립트 추가 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode(){
		new daum.Postcode({
			oncomplete: function(data){
				//사용자가 도로명 주소를 선택한 경우
				if(data.userSelectedType === 'R' && data.roadAddress){
					document.getElementById("location").value = data.address;	
				}else{
					//도로명 주소가 아닐 경우 사용자에게 알림
					alert("도로명 주소만 선택해 주세요")
				}
				
			}
		}).open();
	}
</script>
</head>
<body>
<!-- header -->
<jsp:include page="/rentalAdmin/header.jsp" />

<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
<h1>렌탈샵 수정</h1>
<div class="form-container">
<form id="updateForm" action="${pageContext.request.contextPath }/adminRental/update" 
	method="post" enctype="multipart/form-data" onsubmit="return checkData(event)">
	
	<label for="name">렌탈샵명</label>
	<input type="text" name="name" id="name" value="${rsdto.name }"><br>
	
	<label for="phone">렌탈샵 전화번호</label>
	<input type="text" name="rental_phone" id="phone" value="${rsdto.rental_phone }"
		maxlength="13" oninput="formatPhoneNumber(this)"><br>
		
	<label for="location">도로명 주소</label>
	<div class="address-row">
	    <input type="text" name="location" id="location" value="${rsdto.location }" readonly>
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
	<textarea cols="30" rows="5" name="description" id="description">${rsdto.description }</textarea><br>
	<input type="hidden" name="rentalshop_id" value="${rsdto.rentalshop_id }"><br>
	<input type="hidden" name="uuid" value="${rsdto.uuid }"><br>

	<input type="submit" value="수정">
	
</form>
</div>

</main>
</body>
</html>