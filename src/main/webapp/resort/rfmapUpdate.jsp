<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css_resort/rfmapInsertUpdate.css">

</head>
<body>
<h1>리조트 시설 수정</h1>
<div class="form-container">
<form action="${pageContext.request.contextPath}/rfmap/update" method="post">
	<input type="hidden" name="resort_id" value="${resort_id}">
	<input type="hidden" name="type_id" value="${type_id}">
      
	<h3>${facilityName }</h3>
	<c:forEach var="facility" items="${facilities}">
		<c:set var="facId" value="${facility.facility_id}" />
        
        <div class="facility-group">
		<c:choose>
			<c:when test="${facilityIdsByType != null && facilityIdsByType.contains(facId)}">
				<input type="checkbox" id="facilityId_${facId}" name="facility_id" value="${facId}" checked="checked">
				<label for="facilityId_${facId}">${facility.facility_name}</label><br>
			</c:when>
              
			<c:otherwise>
				<input type="checkbox" id="facilityId_${facId}" name="facility_id" value="${facId}">
				<label for="facilityId_${facId}">${facility.facility_name}</label><br>
			</c:otherwise>
		</c:choose>
		</div>
	</c:forEach>
      
	<br>
	<input type="submit" value="수정">
</form>
</div>

<button class="back-btn" onclick="window.location.href='${pageContext.request.contextPath}/resort/detail?resort_id=${resort_id}'">돌아가기</button>


</body>
</html>