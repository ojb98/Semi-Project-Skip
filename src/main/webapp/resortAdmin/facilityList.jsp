<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminFacilityList.css">

<script>
    function filterFacility() {
    	//셀렉트에 선택한 facilityType의 값을 가져옴
        let selectedType = document.getElementById("facilityType").value;
        let rows = document.querySelectorAll("#facilityTable tbody tr");

        rows.forEach(row => {
            let type = row.getAttribute("data-type"); //data-type 속성 가져오기
            //selectedType(사용자가 선택한 시설 유형)과 type(시설의 실제 유형)을 비교하여 일치하면 표시, 다르면 숨김.
            if (selectedType === "all" || type === selectedType) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        });
    }
</script>
</head>
<body>

<!-- header -->
<jsp:include page="/resortAdmin/header.jsp" />


<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
<h1>시설 리스트 관리</h1>
<!--시설 유형 필터링 (셀렉트 박스) -->
<div class="filter-container">
	<label for="facilityType">시설 유형 선택: </label>
	<select id="facilityType" onchange="filterFacility()">
	    <option value="all" ${facilityType eq 'all' ? 'selected' : ''}>전체</option>    
	    <c:forEach var="type" items="${uniqueTypes}">
	        <option value="${type}" ${facilityType eq type ? 'selected' : ''}>${type}</option>
	    </c:forEach>
	</select>
</div>

<table border="1" width="600" id="facilityTable">
    <thead>
        <tr>
            <th>번호</th><th>시설유형</th><th>시설명</th><th>삭제</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="dto" items="${flist}">
        	<!-- 필터링을 위한 data-type 추가 -->
            <tr data-type="${dto.type_name}"> 
                <td>${dto.ftypesDto[0].facility_id }</td>
                <td>${dto.type_name }</td>
                <td>${dto.ftypesDto[0].facility_name}</td>
                <td>
                    <a href="${pageContext.request.contextPath }/adminFacility/delete?facility_id=${dto.ftypesDto[0].facility_id }"
                       onclick="return confirm('정말 삭제하시겠습니까?');">
                        <button class="delete-btn">삭제</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
	<button class="main-btn" onclick="window.location.href='${pageContext.request.contextPath}/resortAdmin/resortAdminMain.jsp'">메인으로 가기</button>
</main>
</body>
</html>