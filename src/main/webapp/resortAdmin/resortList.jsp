<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminList.css">
</head>
<body>
<!-- header -->
<jsp:include page="/resortAdmin/header.jsp" />
ide.jsp" />

<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
<h1>리조트 리스트 관리</h1>
	<table border="1" width="1000">
		<tr>
			<th>번호</th><th>관리자ID</th><th>리조트명</th><th>리조트유형</th><th>주소</th><th>전화번호</th>
			<th>객실등록</th><th>상세보기</th><th>삭제</th>
		</tr>
		<c:forEach var="dto" items="${relist }">
			<tr>
				<td>${dto.resort_id }</td>
				<td>${dto.user_id }</td>
				<td>${dto.name }</td>
				<td>${dto.resort_type }</td>
				<td>${dto.location }</td>
				<td>${dto.resort_phone }</td>
				<td><a href="${pageContext.request.contextPath }/adminRoom/insert?resort_id=${dto.resort_id }&name=${dto.name}">
				<button class="add-btn">추가</button></a></td>
				
				<td>
                <!-- 상세보기 버튼 (클릭 시 resort_id를 포함하여 상세 페이지로 이동) -->
                <button class="detail-btn" onclick="goToDetail(${dto.resort_id})">상세보기</button>
            	</td>
            	
            	
				<td>
					<a href="${pageContext.request.contextPath}/adminResort/delete?resort_id=${dto.resort_id}" 
     					onclick="return confirm('정말 삭제하시겠습니까?');">
     					<button class="delete-btn">삭제</button>
  					</a>
  				</td>
			</tr>
		</c:forEach>
	</table>
	
	<script>
    function goToDetail(resortId) {
        window.location.href = "${pageContext.request.contextPath }/adminResort/detail?resort_id=" + resortId;
    }
</script>
</main>
</body>
</html>