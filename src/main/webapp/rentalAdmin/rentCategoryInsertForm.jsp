<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:choose>
	<c:when test="${user.role eq 'RENTAL' }">
		<jsp:include page="/rentalAdmin/header.jsp" />
	</c:when>
	<c:when test="${user.role eq 'SKI' }">
		<jsp:include page="/skiAdmin/header.jsp" />
	</c:when>
</c:choose>


<!-- 메인 컨텐츠 영역 -->
<main class="main-content">

<h1>장비카테고리 등록</h1>
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
	action="${pageContext.request.contextPath }/adminRentCategory/insert"
	onsubmit="return checkData(event)">

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

</main>
</body>
</html>