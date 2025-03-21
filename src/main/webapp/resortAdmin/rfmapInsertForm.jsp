<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminRfmapInsertUpdate.css">

</head>
<body>
<!-- header -->
<jsp:include page="/resortAdmin/header.jsp" />

<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
<h1>리조트 시설 추가</h1>
<div class="form-container">
  <form action="${pageContext.request.contextPath}/adminRfmap/insert" method="post">
    <input type="hidden" name="resort_id" value="${resort_id}">
    
    <h3>추가할 시설을 선택하세요:</h3>
    <c:set var="typeName" value="" />
    
    <!-- 시설유형 + 시설이름 리스트 -->
    <c:forEach var="f" items="${flist}">
      <!-- 시설유형이름 변경시 출력(중복안되게 한번만 출력하기위한 조건) -->
      <c:if test="${f.type_name != typeName}">
        <h4>${f.type_name}</h4>
        <c:set var="typeName" value="${f.type_name}" />
      </c:if>
      
      <!-- List<Facilities>에 담긴 전체 시설명 -->
      <c:forEach var="facility" items="${f.ftypesDto}">
        <!-- facility의 id를 변수에 저장 -->
        <c:set var="facId" value="${facility.facility_id}" />
        
        <!-- 전체 facility_id에 리조트에 저장된 facilityIds들이 포함되어있는지 확인  -->
        <div class="facility-group">
        <c:choose>
          <c:when test="${facilityIds != null && facilityIds.contains(facId)}">
            <!-- 이미 등록된 경우: 체크박스 체크되고 비활성화 -->
            <input type="checkbox" id="facilityId_${facId}" name="facility_id" value="${facId}" 
            	checked="checked" disabled="disabled">
            <label for="facilityId_${facId}">${facility.facility_name}</label><br>
          </c:when>
          
          <c:otherwise>
            <input type="checkbox" id="facilityId_${facId}" name="facility_id" value="${facId}">
            <label for="facilityId_${facId}">${facility.facility_name}</label><br>
          </c:otherwise>
        </c:choose>
        </div>
      </c:forEach>
    </c:forEach>
    
    <br>
    <input type="submit" value="등록">
  </form>
</div>  
  
  <button class="back-btn" onclick="window.location.href='${pageContext.request.contextPath}/adminResort/detail?resort_id=${resort_id}'">돌아가기</button>
</main>  
</body>
</html>