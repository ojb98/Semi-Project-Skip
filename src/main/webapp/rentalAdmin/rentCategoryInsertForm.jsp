<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminFacilityInsert.css">
</head>
<body>

<h1>장비카테고리 등록</h1>
<div class="form-container">
<form id="categoryForm" method="post"
	action="${pageContext.request.contextPath }/adminRentCategory/insert">

	<label for="itemType">장비 종류</label>
	<select name="item_type" id="itemType">
		<option value="리프트권">리프트권</option>
		<option value="패키지">패키지</option>
		<option value="스키">스키</option>
		<option value="보드">보드</option>
		<option value="보호구">보호구</option>
		<option value="상의">상의</option>
		<option value="하의">하의</option>
		<option value="신발">신발</option>
	</select><br>
	<label for="price">시간당 대여 가격</label>
	<input type="number" name="price_per_hour" id="price"><br><br>
	
	<input type="submit" value="등록" class="submit-btn">
</form>
</div>

</body>
</html>