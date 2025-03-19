<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    


<h1>시설 상세정보</h1>
<div class="button-container-right">
    <button class="add-btn" onclick="window.location.href='${pageContext.request.contextPath}/adminRfmap/insert?resort_id=${rdto.resort_id}'">추가</button>
</div>

<input type="hidden" id="resortId" value="${param.resort_id}">
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
            <td><a href="${pageContext.request.contextPath}/adminRfmap/update?resort_id=${rdto.resort_id}&type_id=${f.type_id}">
                <button class="update-btn">수정</button></a>
            </td>
            <td><a href="${pageContext.request.contextPath}/adminRfmap/delete?resort_id=${rdto.resort_id}&type_id=${f.type_id}"
                onclick="return confirm('정말 삭제하시겠습니까?');">
                <button class="delete-btn">삭제</button></a>
            </td> 
        </tr>
    </c:forEach>
</table>