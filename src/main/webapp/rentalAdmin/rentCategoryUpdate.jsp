<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminFacilityInsert.css">

<script type="text/javascript">
function checkData(event) {
    // "시간당 대여 가격" 필드 검사
    let price = document.getElementById("price").value.trim();
   
 	// 가격이 비어있거나, 숫자가 아니거나, 0이하인 경우 
    if (price === "" || Number(price) <= 0) {
        alert("시간당 대여 가격을 올바르게 입력해 주세요.");
        document.getElementById("price").focus();
        return false;
    }
    return true; // 모든 검사를 통과하면 true를 반환
}
</script>

</head>
<body>
<!-- header -->
<jsp:include page="/rentalAdmin/header.jsp" />

<!-- 메인 컨텐츠 영역 -->
<main class="main-content">

<h1>장비카테고리 수정</h1>
<!-- 에러 메시지 출력 -->
<c:if test="${not empty sessionScope.errMsg}">
	<div class="error-message" style="color:red;">
		${sessionScope.errMsg}
	</div>
	<!-- 한 번 출력 후 제거 -->
	<c:remove var="errMsg" scope="session" />
</c:if><br>

<div class="form-container">
<form id="categoryForm" method="post"
	action="${pageContext.request.contextPath }/adminRentCategory/update"
	onsubmit="return checkData(event)">

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