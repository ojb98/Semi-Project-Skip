<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminInsertUpdate.css">
</head>
<body>

<h1>렌탈샵 장비등록</h1>
<div class="form-container">
<form id="" action="${pageContext.request.contextPath }/adminItem/insert"
	method="post" enctype="multipart/form-data">
	<input type="hidden" name="rentalshop_id" value="${param.rentalshop_id }">
	
	<label for="name">렌탈샵명</label>
	<input type="text" name="name" id="name" value="${param.name }" readonly="readonly"><br>
	
	<label for="itemName">장비이름</label>
	<input type="text" name="item_name" id="itemName"><br>
	
	<label for="itemDetail">장비상세</label>
	<input type="text" name="item_detail" id="itemDetail"><br>
	
	<label for="quantity">총 장비수량</label>
	<input type="number" name="total_quantity" id="quantity"><br>
	
	<label for="itemImg">장비 이미지</label>
	<input type="file" name="item_img" id="itemImg"><br>
	
	
	<h2>장비 카테고리 선택</h2>
	<div class="facility-group">
    <c:forEach var="category" items="${rclist}">
    <fmt:formatNumber var="price" value="${category.price_per_hour }" pattern="###,###" /> 
		<input type="radio" id="category_${category.category_id}" name="category_id" value="${category.category_id}">
		<label for="category_${category.category_id}">
			${category.item_type}(${price }원)
		</label><br>
	</c:forEach>
	</div>
	
	<input type="submit" value="등록">
</form>
</div>
<button class="back-btn" onclick="window.location.href='${pageContext.request.contextPath}/adminRental/list'">돌아가기</button>

</html>