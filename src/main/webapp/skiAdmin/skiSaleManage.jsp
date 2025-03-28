<%@page import="ski.dto.SkiSalesListDto"%>
<%@page import="java.time.LocalDate"%>
<%@page import="adminDto.UsersDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    LocalDate defaultDay = LocalDate.now();
    LocalDate defaultDay1 = defaultDay.minusDays(14);
    LocalDate defaultDay2 = defaultDay.plusDays(14);
    String defaultDate1 = defaultDay1.toString();
    String defaultDate2 = defaultDay2.toString();
    List<SkiSalesListDto> SalesList = (List<SkiSalesListDto>)request.getAttribute("salesList");
    session.setAttribute("skiID", 1);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지 - 매출관리/통계</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
    <!-- Odometer CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/odometer@0.4.8/themes/odometer-theme-default.css" />
    <!-- Odometer & Chart.js 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/odometer@0.4.8/odometer.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <!-- 전역 변수 선언 (JSP에서 한 번만) -->
    <script>
      // Odometer 전역 옵션
      window.odometerOptions = {
         duration: 200  // 200ms (예시)
      };
      // JSP에서 전달하는 값들
      var defaultDate1 = "<%=defaultDate1%>";
      var defaultDate2 = "<%=defaultDate2%>";
      var contextPath = "${pageContext.request.contextPath}";
    </script>
    
    <!-- 외부 JavaScript 파일 포함 -->
    <script src="${pageContext.request.contextPath}/js/skiSaleManage.js"></script>
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
        <h2>📊 매출 관리 / 통계</h2>

        <!-- 매출 요약 카드 -->
        <section class="dashboard">
            <div class="card">
                  <h3>📅 조회일자선택</h3>
                  <div class="date-range">
                      <input type="date" id="searchAtStart" value="<%=defaultDate1%>">
                      <span>~</span>
                      <input type="date" id="searchAtEnd" value="<%=defaultDate2%>">
                  </div>
              </div>
            <div class="card">
    		    <h3>💰 총 매출</h3>
    		    <p id="totalSaleCard" class="odometer"></p>
    		</div>
    		<div class="card">
    		    <h3>✅ 완료된 예약</h3>
    		    <p id="confirmReservCard" class="odometer"></p>
    		</div>
    		<div class="card">
    		    <h3>❌ 취소된 예약</h3>
    		    <p id="cancleReservCard" class="odometer"></p>
    		</div>
        </section>

        <!-- 차트 카드 (매출 추이 & 예약 상태 비율) -->
        <div class="chart-cards">
            <!-- 매출 변동 차트 -->
            <div class="chart-card1">
              <div class="chart-card1-header">
                <h3>📈 날짜별 매출 변동</h3>
                <!-- 버튼 영역: 오른쪽 상단에 배치 -->
                <div class="btn-group">
                  <button id="countBtn" class="toggle-btn active" onclick="updateChart('count')">결제건수</button>
                  <button id="amountBtn" class="toggle-btn" onclick="updateChart('amount')">결제금액</button>
                </div>
              </div>
              <!-- 차트 영역 -->
              <canvas id="salesChart" width="1000" height="280"></canvas>
            </div>

            <!-- 상품별 매출 비교 차트 -->
            <div class="chart-card">
                <h3>🏂 상품별 매출 기여도</h3>
                <canvas id="productChart"></canvas>
            </div>
        </div>

        <!-- 결제 내역 테이블 -->
        <div class="table-container">
            <h3>💳 결제 내역</h3>
            <table>
                <thead>
                    <tr>
                        <th>결제번호</th>
                        <th>예약번호</th>
                        <th>아이디</th>
                        <th>결제방식</th>
                        <th>결제총액</th>
                        <th>결제상태</th>
                        <th>결제일시</th>
                    </tr>
                </thead>
                <tbody id="SalesTableBody"></tbody>
            </table>
        </div>
    </main>
</body>
</html>
