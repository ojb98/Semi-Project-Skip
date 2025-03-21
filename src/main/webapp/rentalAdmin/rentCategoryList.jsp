<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminFacilityList.css">

</head>
<body>
<!-- header -->
<jsp:include page="/rentalAdmin/header.jsp" />

<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
<h1>카테고리 리스트</h1>
<!-- 에러 메시지 출력 -->
<c:if test="${not empty sessionScope.errMsg}">
	<div class="error-message" style="color:red;">
		${sessionScope.errMsg}}
	</div>
	<!-- 한 번 출력 후 제거 -->
	<c:remove var="errMsg" scope="session" />
</c:if><br>

<table border="1" width="600">
    <thead>
        <tr>
            <th>번호</th><th>시설유형</th><th>시간당 대여 가격</th><th>수정</th><th>삭제</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="dto" items="${list }">
        	<!-- 필터링을 위한 data-type 추가 -->
            <tr data-type="${dto.item_type}"> 
                <td>${dto.category_id }</td>
                <td>${dto.item_type }</td>
                <fmt:formatNumber var="price" value="${dto.price_per_hour }" pattern="###,###" />
                <td>${price }원</td>
                
                <td>
                    <a href="${pageContext.request.contextPath }/adminRentCategory/update?category_id=${dto.category_id }&item_type=${dto.item_type }">
                        <button class="update-btn">수정</button>
                    </a>
                </td>
                
                <td>
                    <a href="${pageContext.request.contextPath }/adminRentCategory/delete?category_id=${dto.category_id }"
                    	onclick="return confirm('정말 삭제하시겠습니까?');">
                        <button class="delete-btn">삭제</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</main>
</body>
</html>