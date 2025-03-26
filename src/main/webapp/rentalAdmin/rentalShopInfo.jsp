<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>렌탈샵 상세보기</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminInfo.css">
  
<!-- 전역 변수 설정 -->
  <script>
      var contextPath = "${pageContext.request.contextPath}";
      
      //section: 'rental'이면 렌탈샵 기본정보만, 'item'이면 카테고리&장비 정보만 보여줌
      function showSection(section) {
          if (section === 'rental') {
              document.getElementById("rentalInfo").style.display = "block";
              document.getElementById("dynamicContent").style.display = "none";
          } else if (section === 'item') {
              document.getElementById("rentalInfo").style.display = "none";
              document.getElementById("dynamicContent").style.display = "block";
          }
      }
      
      //AJAX로 카테고리&장비 목록과 페이징 네비게이션을 로드
      function loadItemCategoryInfo(page) {
          showSection('item');
          var rentalshopId = document.getElementById("rentalInfo").getAttribute("data-rental-id");
          var xhr = new XMLHttpRequest();
          xhr.open("GET", contextPath + "/adminItemCategory/detail?rentalshop_id=" + rentalshopId + "&page=" + page, true);
          xhr.onreadystatechange = function() {
              if (xhr.readyState === 4 && xhr.status === 200) {
                  document.getElementById("dynamicContent").innerHTML = xhr.responseText;
              }
          };
          xhr.send();
      }
      
      //렌탈샵 기본정보만 다시 보여줌
      function showRentalShopInfo() {
          showSection('rental');
          document.getElementById("dynamicContent").innerHTML = "";
      }
  </script>

</head>
<body>
  <!-- header -->
  <jsp:include page="/rentalAdmin/header.jsp" />
  
  <!-- 메인 컨텐츠 영역 -->
  <main class="main-content">
    <div class="button-container">
      <button onclick="showRentalShopInfo()">렌탈샵 상세보기</button>
      <button onclick="loadItemCategoryInfo(1)">카테고리&장비 상세보기</button>
    </div>
    
    <!-- 렌탈샵 기본 정보 영역 -->
    <div id="rentalInfo" data-rental-id="${rsdto.rentalshop_id}">
      <h1>렌탈샵 상세정보</h1>
      <div class="button-container-right">
        <a href="${pageContext.request.contextPath}/adminRental/update?rentalshop_id=${rsdto.rentalshop_id}">
          <button class="update-btn">수정</button>
        </a>
      </div>
      <table border="1" width="900">
        <tr>
          <th>번호</th>
          <td>${rsdto.rentalshop_id}</td>
        </tr>
        <tr>
          <th>관리자ID</th>
          <td>${rsdto.user_id}</td>
        </tr>
        <tr>
          <th>렌탈샵명</th>
          <td>${rsdto.name}</td>
        </tr>
        <tr>
          <th>주소</th>
          <td>${rsdto.location}</td>
        </tr>
        <tr>
          <th>전화번호</th>
          <td>${rsdto.rental_phone}</td>
        </tr>
        <tr>
          <th>메인이미지</th>
          <td>
            <img src="${pageContext.request.contextPath}/rentalImg/${rsdto.remain_img}" width="300">
          </td>
        </tr>
        <tr>
          <th>서브이미지1</th>
          <td>
            <c:choose>
              <c:when test="${not empty rsdto.resub_img1}">
                <img src="${pageContext.request.contextPath}/rentalImg/${rsdto.resub_img1}" width="300">
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
              <c:when test="${not empty rsdto.resub_img2}">
                <img src="${pageContext.request.contextPath}/rentalImg/${rsdto.resub_img2}" width="300">
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
              <c:when test="${not empty rsdto.resub_img3}">
                <img src="${pageContext.request.contextPath}/rentalImg/${rsdto.resub_img3}" width="300">
              </c:when>
              <c:otherwise>
                <label>이미지 없음</label>
              </c:otherwise>
            </c:choose>
          </td>
        </tr>
        <tr>
          <th>추가 및 설명</th>
          <td>${rsdto.description}</td>
        </tr>
        <tr>
          <th>등록일</th>
          <td>${rsdto.created_at}</td>
        </tr>
      </table>
    </div>
    
    <!-- AJAX로 불러올 영역 -->
    <div id="dynamicContent" style="display: none;"></div>
  </main>
  
</body>
</html>


