<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<%
    session.setAttribute("rentalID", 1);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style type="text/css">
.reservation-detail-card {
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    margin: 0 20px 20px 20px;
    padding: 20px;
}

.detail-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.close-btn {
    background: none;
    border: none;
    color: #666;
    font-size: 24px;
    cursor: pointer;
    padding: 0 8px;
}

.detail-content {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.detail-row {
    display: flex;
    gap: 20px;
}

.detail-col {
    flex: 1;
    display: flex;
    flex-direction: column;
}

.detail-col.full {
    flex: 2;
}

.detail-col label {
    font-size: 12px;
    color: #666;
    margin-bottom: 4px;
}

.detail-col span {
    font-size: 14px;
    color: #333;
    font-weight: 500;
}</style>

<script type="text/javascript">
// 기존 함수들...

function reservationDetailList(reservId) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
    	if(xhr.readyState === 4) {
	        if(xhr.status === 200) {
	        	document.getElementById("detailTableBody").innerHTML = xhr.responseText;
	        } else {
	            alert("디테일리스트 갱신 중 오류");
	        }
	    }
    };
    xhr.open("GET", contextPath + "/rentalAdmin/reservationDetailList?reservId=" + encodeURIComponent(reservId), true);
    xhr.send("reservId=" + encodeURIComponent(reservId));
}

  var contextPath = "${pageContext.request.contextPath}";
  
  function requestReservationList() {
    var xhr = new XMLHttpRequest();
    var rentalID = '<%= session.getAttribute("rentalID") %>';  //로그인정보 : rentalID
	xhr.onreadystatechange = function() {
	    if(xhr.readyState === 4) {
	        if(xhr.status === 200) {
	        	document.getElementById("reservationTableBody").innerHTML = xhr.responseText;
	        } else {
	            alert("일반리스트 갱신 중 오류");
	        }
	    }
	};
	xhr.open("GET", contextPath + "/rentalAdmin/reservationList?rentalID="+encodeURIComponent(rentalID), true);
	xhr.send();
  }
  function requestDelete(reserv_id) { //**** 관리자가 예약 취소 : 환불까지 이어져야 함 ****
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
      xhr.open("POST", contextPath + "/rentalAdmin/deleteReservation", true);
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
      var rentalID = '<%= session.getAttribute("rentalID") %>';
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
      xhr.open("GET", contextPath + "/rentalAdmin/reservationList?keyword=" + encodeURIComponent(keyword) + "&filter=" + encodeURIComponent(filter) + "&rentalID="+encodeURIComponent(rentalID) +
    		  "&reservDateStart=" + encodeURIComponent(reservDateStart) + "&reservDateEnd=" + encodeURIComponent(reservDateEnd) + 
    		  "&createdAtStart=" + encodeURIComponent(createdAtStart)+ "&createdAtEnd=" + encodeURIComponent(createdAtEnd), true);
      xhr.send();
  }
  // 페이지 로드 시 승인 대기 리스트 자동 갱신
  window.onload = function() {
	  requestReservationList();
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
        <div class="sidebar-profile">
            <img src="" alt="사진프로필" class="profile-icon">
            <div class="admin-name">관리자님</div>
        </div>
        <ul>
            <li><a href="${pageContext.request.contextPath}/rentalAdmin/rentalRegist.jsp">사업장등록신청</a></li>
	        <li><a href="${pageContext.request.contextPath}/rentalAdmin/rentalItemRegist.jsp">상품등록/관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/rentalAdmin/rentalReservation.jsp">예약 관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/rentalAdmin/rentalQnA.jsp">문의 관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/rentalAdmin/rentalReview.jsp">리뷰 관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/rentalAdmin/rentalSaleManage.jsp">매출관리/통계</a></li>
        </ul>
    </aside>
    
    <!-- 메인 컨텐츠 영역 -->
    <main class="main-content">
    <!-- 상세정보 카드 영역 추가 -->
        <div class="reservation-detail-card">
        <div class="detail-header">
            <h3>예약 상품 상세정보</h3>
        </div>
        <table>
            <thead>
                <tr>
                    <th>예약상세ID</th>
                    <th>상품명</th>
                    <th>예약번호</th>
                    <th>수량</th>
                    <th>금액 계</th>
                </tr>
            </thead>
            <tbody id="detailTableBody">
                <tr>
                    <td colspan="6" style="text-align: center;">예약을 선택하면 상품 상세정보가 표시됩니다.</td>
                </tr>
            </tbody>
        </table>
    </div>
        <!-- 테이블 영역 -->
        <div class="table-container">
        <!-- 리스트 상단 우측에 작게 표시되는 검색 컨트롤 영역 -->
        <div class="list-header">
        <h3>전체 예약 리스트</h3>
            <div class="search-filter-container">
            	
               

                <!-- 날짜 필터링 추가 -->
                <div class="date-filter">
                    <label>이용예정일:</label>
                    <input type="date" id="reservDateStart">
                    <span>~</span>
                    <input type="date" id="reservDateEnd">
                </div>
				
                <div class="date-filter">
                    <label>예약생성일:</label>
                    <input type="date" id="createdAtStart">
                    <span>~</span>
                    <input type="date" id="createdAtEnd">
                </div>
                
                <select id="filterSelect">
                    <option value="이름">이름</option>
                    <option value="아이디">아이디</option>
                    <option value="이메일">이메일</option>                    
                </select>
                
                <div class="search-box">
                  <input type="text" id="searchInput" placeholder="검색어 입력" />
                  <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="검색 아이콘" class="search-icon" onclick="searchList()"/>
                </div>
            </div>
        </div>
            <table>
                <thead>
                    <tr>
                        <th>예약번호</th>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th>이용예정일</th>                         
                        <th>예약생성일</th>
                        <th>예약상태</th>
                        <th>상세보기</th>
                    </tr>
                </thead>
                <tbody id="reservationTableBody">
                    <!-- 백엔드에서 반복문으로 출력할 데이터 -->
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>
