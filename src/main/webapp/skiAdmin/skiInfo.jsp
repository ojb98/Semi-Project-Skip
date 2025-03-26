<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminInfo.css">

<!-- 전역 변수 설정 -->
  <script>
      var contextPath = "${pageContext.request.contextPath}";
      
      //section: 'ski'이면 렌탈샵 기본정보만, 'item'이면 카테고리&장비 정보만 보여줌
      function showSection(section) {
          if (section === 'ski') {
              document.getElementById("skiInfo").style.display = "block";
              document.getElementById("dynamicContent").style.display = "none";
          } else if (section === 'item') {
              document.getElementById("skiInfo").style.display = "none";
              document.getElementById("dynamicContent").style.display = "block";
          }
      }
      
      //AJAX로 카테고리&장비 목록과 페이징 네비게이션을 로드
      function loadItemCategoryInfo(page) {
          showSection('item');
          var skiId = document.getElementById("skiInfo").getAttribute("data-ski-id");
          var xhr = new XMLHttpRequest();
          xhr.open("GET", contextPath + "/adminSkiItemCategory/detail?ski_id=" + skiId + "&page=" + page, true);
          xhr.onreadystatechange = function() {
              if (xhr.readyState === 4 && xhr.status === 200) {
                  document.getElementById("dynamicContent").innerHTML = xhr.responseText;
              }
          };
          xhr.send();
      }
      
      //스키장 기본정보만 다시 보여줌
      function showSkiInfo() {
          showSection('ski');
          document.getElementById("dynamicContent").innerHTML = "";
      }
  </script>


</head>
<body>
<!-- header -->
<jsp:include page="/skiAdmin/header.jsp" />

<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
<div class="button-container">
    <button onclick="showSkiInfo()">스키장 상세보기</button>
    <button onclick="loadItemCategoryInfo(1)">카테고리&장비 상세보기</button>
</div>


<div id="skiInfo" data-ski-id="${skdto.ski_id}">
<h1>스키장 상세정보</h1>

<div class="button-container-right">
	<a href="${pageContext.request.contextPath }/adminSki/update?ski_id=${skdto.ski_id}" >
	<button class="update-btn">수정</button></a>
</div>
	
	<table border="1" width="900">
		<tr>
			<th>번호</th>
			<td>${skdto.ski_id }</td>
		</tr>
		
		<tr>
			<th>관리자ID</th>
			<td>${skdto.user_id }</td>
		</tr>
		
		<tr>	
			<th>스키장명</th>
			<td>${skdto.name }</td>
		</tr>
		
		<tr>	
			<th>주소</th>
			<td>${skdto.location }</td>
		</tr>
		
		<tr>	
			<th>전화번호</th>
			<td>${skdto.ski_phone }</td>
		</tr>
		
		<tr>	
			<th>웹캠uri</th>
			<td>${skdto.webcam_url }</td>
		</tr>
		
		<tr>
			<th>메인이미지</th>
			<td>
				<img src="${pageContext.request.contextPath }/skiImg/${skdto.skmain_img }" width="300">
			</td>
		</tr>

		<tr>
			<th>서브이미지1</th>
			<td>
			<c:choose>
    			<c:when test="${not empty skdto.sksub_img1}">
        			<img src="${pageContext.request.contextPath }/skiImg/${skdto.sksub_img1}" width="300">
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
    			<c:when test="${not empty skdto.sksub_img2}">
        			<img src="${pageContext.request.contextPath }/skiImg/${skdto.sksub_img2}" width="300">
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
    			<c:when test="${not empty skdto.sksub_img3}">
        			<img src="${pageContext.request.contextPath }/skiImg/${skdto.sksub_img3}" width="300">
    			</c:when>
    			<c:otherwise>
        			<label>이미지 없음</label>
    			</c:otherwise>
			</c:choose>
			</td>
		</tr>
		
		<tr>
			<th>추가 및 설명</th>
			<td>${skdto.description }</td>
		</tr>
		
		<tr>
			<th>등록일</th>
			<td>${skdto.created_at }</td>
		</tr>
	</table>
</div>
	
<!-- 버튼을 클릭하면 AJAX로 데이터 불러오기 -->
<div id="dynamicContent" style="display: none;"></div>


</main>
</body>
</html>