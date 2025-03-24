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

<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
<h1>스키장 수정</h1>
<div class="form-container">
<form id="updateForm" action="${pageContext.request.contextPath }/adminSki/update" 
	method="post" enctype="multipart/form-data" onsubmit="return checkData(event)">
	
	<label for="name">스키장명</label>
	<input type="text" name="name" id="name" value="${skdto.name }"><br>
	
	<label for="phone">스키장 전화번호</label>
	<input type="text" name="ski_phone" id="phone" value="${skdto.ski_phone }"
		maxlength="13" oninput="formatPhoneNumber(this)"><br>
		
	<label for="location">도로명 주소</label>
	<div class="address-row">
	    <input type="text" name="location" id="location" value="${skdto.location }" readonly>
	    <button type="button" onclick="execDaumPostcode()">주소 검색</button>
	</div>	
	
	<label for="webcam_url">웹캠 URL</label>
	<input type="text" name="webcam_url" id="webcam_url" value="${skdto.webcam_url }"><br>
	
	<label for="mainImg">메인이미지</label>
	<input type="file" name="skmain_img" id="mainImg"><br>

	<label for="subImg1">이미지추가1</label>
	<input type="file" name="sksub_img1" id="subImg1"><br>
	
	<label for="subImg2">이미지추가2</label>
	<input type="file" name="sksub_img2" id="subImg2"><br>
	
	<label for="subImg3">이미지추가3</label>
	<input type="file" name="sksub_img3" id="subImg3"><br>
	
	<label for="description">스키장 추가설명</label><br>
	<textarea cols="30" rows="5" name="description" id="description">${skdto.description }</textarea><br>
	<input type="hidden" name="ski_id" value="${skdto.ski_id }"><br>
	<input type="hidden" name="uuid" value="${skdto.uuid }"><br>

	<input type="submit" value="수정">
	
</form>
</div>
</main>

</body>
</html>