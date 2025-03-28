<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<%
    session.setAttribute("skiID", 1);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style type="text/css">
/* 검은색 배경 오버레이 */
.black_overlay {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.8);
  z-index: 1001;
}

/* 흰색 팝업 박스 */
.white_content {
  display: none;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 70%;
  height: 70%;
  padding: 16px;
  border: 5px solid #00A2E8;
  background-color: white;
  z-index: 1002;
  overflow: auto;
}
</style>

<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	
  	function showLightbox() {
      document.getElementById("light").style.display = "block";
      document.getElementById("fade").style.display = "block";
  	}

	function hideLightbox() {
      document.getElementById("light").style.display = "none";
      document.getElementById("fade").style.display = "none";
  	}  
	  
	function requestQnaList() {
		var xhr = new XMLHttpRequest();
	    var skiID = '<%= session.getAttribute("skiID") %>';  //로그인정보 : skiID
		xhr.onreadystatechange = function() {
		    if(xhr.readyState === 4) {
		        if(xhr.status === 200) {
		        	document.getElementById("QnaTableBody").innerHTML = xhr.responseText;
		        } else {
		            alert("문의리스트 갱신 중 오류");
		        }
		    }
		};
		xhr.open("GET", contextPath + "/skiAdmin/QnaList?skiID="+encodeURIComponent(skiID), true);
		xhr.send();
	}
	function requestAnswer(qna_Id) { //**** 관리자가 예약 취소 : 환불까지 이어져야 함 ****
		  if (!confirm("정말로 이 예약을 삭제하시겠습니까?")) return;
	      var xhr = new XMLHttpRequest();
	      xhr.onreadystatechange = function(){
	    	  if(xhr.readyState === 4){
		    		 if(xhr.status === 200){
		           		if (xhr.responseText === "success") {
		           			alert("삭제가 완료되었습니다.");
			                requestReservationList();
		           		} else if (xhr.responseText === "invalid_reserv_id") {
		                    alert("잘못된 UUID 값입니다.");
		                } else {
		                    alert("삭제 요청 실패.");
		                }
		              } else {
		                  alert("삭제 중 오류");
		              }
		          }
	      };
	      xhr.open("POST", contextPath + "/skiAdmin/deleteReservation", true);
	      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	      xhr.send("reserv_id=" + encodeURIComponent(reserv_id));
	}
	function searchList() {
	      var keyword = document.getElementById("searchInput").value;
	      var filter = document.getElementById("filterSelect").value;
	      var reservDateStart = document.getElementById("reservDateStart").value || "";
	      var reservDateEnd = document.getElementById("reservDateEnd").value || "";
	      var createdAtStart = document.getElementById("createdAtStart").value || "";
	      var createdAtEnd = document.getElementById("createdAtEnd").value || "";
	      var skiID = '<%= session.getAttribute("skiID") %>';
	      var xhr = new XMLHttpRequest();
	      xhr.onreadystatechange = function(){
	          if(xhr.readyState === 4){
	              if(xhr.status === 200){
	                  document.getElementById("reservationTableBody").innerHTML = xhr.responseText;
	              } else {
	                  alert("검색 중 오류");
	              }
	          }
	      };
	      // usersList.jsp 파일에 검색어와 필터 값 전달 (백엔드에서 해당 파라미터에 따른 결과 반환 필요)
	      xhr.open("GET", contextPath + "/skiAdmin/reservationList?keyword=" + encodeURIComponent(keyword) + "&filter=" + encodeURIComponent(filter) + "&skiID="+encodeURIComponent(skiID) +
	    		  "&reservDateStart=" + encodeURIComponent(reservDateStart) + "&reservDateEnd=" + encodeURIComponent(reservDateEnd) + 
	    		  "&createdAtStart=" + encodeURIComponent(createdAtStart)+ "&createdAtEnd=" + encodeURIComponent(createdAtEnd), true);
	      xhr.send();
	}
	  // 페이지 로드 시 승인 대기 리스트 자동 갱신
	window.onload = function() {
	};
	  
</script>
</head>
<body>

<!-- 상단 헤더 -->
<header>
    <div class="header-left">
        <a href="${pageContext.request.contextPath}/admin/dashboard">
            <h1>SKI:P</h1>
        </a>
    </div>
</header>

<!-- 왼쪽 사이드바 -->
<aside class="sidebar">
    <ul>
        <li><a href="${pageContext.request.contextPath}/skiAdmin/skiRegist.jsp">사업장등록신청</a></li>
        <li><a href="${pageContext.request.contextPath}/skiAdmin/skiItemRegist.jsp">상품등록/관리</a></li>
        <li><a href="${pageContext.request.contextPath}/skiAdmin/skiReservation.jsp">예약 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/skiAdmin/skiQnA.jsp">문의 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/skiAdmin/skiAdminReview">리뷰 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/skiAdmin/skiSaleManage.jsp">매출관리/통계</a></li>
    </ul>
</aside>

<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
    <div class="table-container">
        <h3>고객문의</h3>
        <table>
            <thead>
                <tr>
                    <th>문의번호</th>                        
                    <th>아이디</th>
                    <th>제목</th>
                    <th>문의일</th>
                    <th>상태</th> 
                    <th>클릭</th>
                </tr>
            </thead>
            <tbody id="QnaTableBody">
                <tr>
                    <td>1</td>
                    <td>user123</td>
                    <td>문의 제목</td>
                    <td>2024-03-18</td>
                    <td>대기</td>
                    <td><a href="javascript:void(0)" onclick="showLightbox()">답변하기</a></td>
                </tr>
            </tbody>
        </table>
    </div>
</main>

<!-- 팝업 모달 (테이블 밖으로 이동) -->
<div id="light" class="white_content">
  <p>이것은 Lightbox 팝업입니다.</p>
  <a href="javascript:void(0)" onclick="hideLightbox()">닫기</a>
</div>

<div id="fade" class="black_overlay"></div>

</body>
</html>