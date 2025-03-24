<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminInsertUpdate.css">
<script src="${pageContext.request.contextPath}/js/itemAdminUpdate.js"></script>

</head>
<body>

<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
<h1>스키장 카테고리&장비 수정</h1>

<div class="form-container">
<form id="itemUpdateForm" action="${pageContext.request.contextPath }/adminSkiItem/update"
	method="post" enctype="multipart/form-data" onsubmit="return checkData(event)">
	
	<h2>장비</h2>
	<input type="hidden" name="item_id" value="${sidto.item_id }">
	<input type="hidden" name="ski_id" value="${sidto.ski_id }">
	
	<label for="itemName">장비이름</label>
	<input type="text" name="item_name" id="itemName" value="${sidto.item_name }"><br>
	
	<label for="itemDetail">장비상세</label>
	<input type="text" name="item_detail" id="itemDetail" value="${sidto.item_detail }"><br>
	
	<label for="quantity">총 장비수량</label>
	<input type="number" name="total_quantity" id="quantity" value="${sidto.total_quantity }"><br>
	
	<label for="itemImg">장비 이미지</label>
	<input type="file" name="item_img" id="itemImg"><br><br>
	

	<h2>장비 카테고리 선택</h2>
	<div class="radio-group">
    <c:forEach var="category" items="${rclist}">
    <div class="radio-item">
    <fmt:formatNumber var="price" value="${category.price_per_hour }" pattern="###,###" /> 
		<input type="radio" id="category_${category.category_id}" name="category_id" 
		value="${category.category_id}"
		<c:if test="${category.category_id eq sidto.category_id }">checked</c:if>>
		<label for="category_${category.category_id}">
			${category.item_type}(${price }원)
		</label><br>
	</div>
	</c:forEach>
	</div>

	<input type="submit" value="등록">
</form>
</div>
</main>

</body>
</html>