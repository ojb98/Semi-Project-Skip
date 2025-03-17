<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>리조트 상세정보</h1>
	<a href="${pageContext.request.contextPath }/resort/update?resort_id=${rdto.resort_id}" ><button>수정</button></a>
	
	<table border="1" width="900">
		<tr>
			<th>번호</th>
			<td>${rdto.resort_id }</td>
		</tr>
		
		<tr>
			<th>관리자ID</th>
			<td></td>
		</tr>
		
		<tr>	
			<th>리조트명</th>
			<td>${rdto.name }</td>
		</tr>
		
		<tr>
			<th>리조트유형</th>
			<td>${rdto.resort_type }</td>
		</tr>
		
		<tr>
			<th>입실/퇴실(운영시간)</th>
			<td>${rdto.check_time }</td>
		</tr>
		
		<tr>	
			<th>주소</th>
			<td>${rdto.location }</td>
		</tr>
		
		<tr>
			<th>메인이미지</th>
			<td>
				<img src="${pageContext.request.contextPath }/resortImg/${rdto.remain_img }">
			</td>
		</tr>

		<tr>
			<th>서브이미지1</th>
			<td>
			<c:choose>
    			<c:when test="${not empty rdto.resub_img1}">
        			<img src="${pageContext.request.contextPath }/resortImg/${rdto.resub_img1}">
    			</c:when>
    			<c:otherwise>
        			<label>이미지 없음</label>
    			</c:otherwise>
			</c:choose>
			</td>
		</tr>
		
		<tr>
			<th>서브이미지2</th>
			<td>
			<c:choose>
    			<c:when test="${not empty rdto.resub_img2}">
        			<img src="${pageContext.request.contextPath }/resortImg/${rdto.resub_img2}">
    			</c:when>
    			<c:otherwise>
        			<label>이미지 없음</label>
    			</c:otherwise>
			</c:choose>
			</td>
		</tr>
		
		<tr>
			<th>서브이미지3</th>
			<td>
				<c:choose>
    			<c:when test="${not empty rdto.resub_img3}">
        			<img src="${pageContext.request.contextPath }/resortImg/${rdto.resub_img3}">
    			</c:when>
    			<c:otherwise>
        			<label>이미지 없음</label>
    			</c:otherwise>
			</c:choose>
			</td>
		</tr>
		
		<tr>
			<th>추가 및 설명</th>
			<td>${rdto.description }</td>
		</tr>
		
		<tr>
			<th>등록일</th>
			<td>${rdto.created_at }</td>
		</tr>
	</table>
	
	
<h1>시설 상세정보</h1>	
	<a href="${pageContext.request.contextPath}/rfmap/insert?resort_id=${rdto.resort_id}"><button>추가</button></a>
	<table border="1" width="900">
	    <tr>
	        <th>시설 유형</th>
	        <th>시설 이름</th>
	        <th>수정</th>
	        <th>삭제</th>
	    </tr>
	    <c:forEach var="f" items="${fdto}">
	        <tr>
	            <td>${f.type_name}</td>
	            <td>
	             <c:forEach var="fn" items="${f.ftypesDto}" varStatus="status">
	            	${fn.facility_name}<c:if test="${!status.last}">, </c:if>
	            </c:forEach>
	            </td>
	            <td><a href="${pageContext.request.contextPath}/rfmap/update?resort_id=${rdto.resort_id}&type_id=${f.type_id}">
	            	<button>수정</button></a>
	            </td>
	            <td><a href="${pageContext.request.contextPath}/rfmap/delete?resort_id=${rdto.resort_id}&type_id=${f.type_id}"
	            	onclick="return confirm('정말 삭제하시겠습니까?');">
	            	<button>삭제</button></a>
	            </td>
	        </tr>
	    </c:forEach>
	</table>
	
	
<h1>객실 상세정보</h1>
	<table border="1" width="900">
	<tr>
        <th>번호</th>
        <th>객실명</th>
        <th>객실유형</th>
        <th>객실 수</th>
        <th>최대숙박 인원</th>
        <th>1박당 가격</th>
        <th>메인이미지</th>
        <th>서브이미지1</th>
        <th>서브이미지2</th>
        <th>서브이미지3</th>
        <th>추가 및 설명</th>
        <th>등록일</th>
        <th>객실수정</th>
        <th>객실삭제</th>
    </tr>
    <c:forEach var="rm" items="${rmdto}">
		<tr>
            <td>${rm.room_id}</td>
            <td>${rm.room_name }</td>
            <td>${rm.room_type}</td>
            <td>${rm.room_quantity}</td>
            <td>${rm.max_guests}</td>
            <td>${rm.price_per_night}</td>
            <td>
                <img src="${pageContext.request.contextPath}/roomImg/${rm.rmain_img}">
            </td>
            <td>
                <c:choose>
                    <c:when test="${not empty rm.rsub_img1}">
                        <img src="${pageContext.request.contextPath}/roomImg/${rm.rsub_img1}">
                    </c:when>
                    <c:otherwise>
                        <label>이미지 없음</label>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${not empty rm.rsub_img2}">
                        <img src="${pageContext.request.contextPath}/roomImg/${rm.rsub_img2}">
                    </c:when>
                    <c:otherwise>
                        <label>이미지 없음</label>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${not empty rm.rsub_img3}">
                        <img src="${pageContext.request.contextPath}/roomImg/${rm.rsub_img3}">
                    </c:when>
                    <c:otherwise>
                        <label>이미지 없음</label>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${rm.description}</td>
            <td>${rm.created_at}</td>
            <td><a href="${pageContext.request.contextPath}/room/update?room_id=${rm.room_id}"><button>수정</button></a></td>
            <td>
            	<a href="${pageContext.request.contextPath}/room/delete?room_id=${rm.room_id}" 
            		onclick="return confirm('정말 삭제하시겠습니까?');">
            	<button>삭제</button>
            	</a>
            </td>
        </tr>
        
    </c:forEach>
	</table>	
	

</body>
</html>