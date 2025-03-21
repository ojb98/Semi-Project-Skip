<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminFacilityInsert.css">
</head>
<body>
<!-- header -->
<jsp:include page="/rentalAdmin/header.jsp" />

<!-- 메인 컨텐츠 영역 -->
<main class="main-content">

<h1>장비카테고리 수정</h1>
<div class="form-container">
<form id="categoryForm" method="post"
	action="${pageContext.request.contextPath }/adminRentCategory/update">

	<input type="hidden" name="category_id" value="${rcdto.category_id }">
	<label for="itemType">장비 종류</label>
	<select name="item_type" id="itemType" disabled="disabled">
		<option value="리프트권" <c:if test="${rcdto.item_type eq '리프트권' }">selected</c:if>>리프트권</option>
		<option value="패키지" <c:if test="${rcdto.item_type eq '패키지' }">selected</c:if>>패키지</option>
		<option value="스키" <c:if test="${rcdto.item_type eq '스키' }">selected</c:if>>스키</option>
		<option value="보드" <c:if test="${rcdto.item_type eq '보드' }">selected</c:if>>보드</option>
		<option value="보호구" <c:if test="${rcdto.item_type eq '보호구' }">selected</c:if>>보호구</option>
		<option value="상의" <c:if test="${rcdto.item_type eq '상의' }">selected</c:if>>상의</option>
		<option value="하의" <c:if test="${rcdto.item_type eq '하의' }">selected</c:if>>하의</option>
		<option value="신발" <c:if test="${rcdto.item_type eq '신발' }">selected</c:if>>신발</option>
	</select><br>
	<label for="price">시간당 대여 가격</label>
	<input type="number" name="price_per_hour" id="price" value="${rcdto.price_per_hour }"><br><br>
	
	<input type="submit" value="수정" class="submit-btn">
</form>
</div>

</main>
</body>
</html>