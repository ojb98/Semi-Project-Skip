<%@page import="java.util.Iterator"%>
<%@page import="adminUtil.FilterMapping"%>
<%@page import="java.util.Map"%>
<%@page import="ski.dto.SkiSalesListDto"%>
<%@page import="java.time.LocalDate"%>
<%@page import="adminDto.UsersDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 기본 날짜 범위 설정 (오늘 기준 -14일, +14일)
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    LocalDate defaultDay = LocalDate.now();
    LocalDate defaultDay1 = defaultDay.minusDays(14);
    LocalDate defaultDay2 = defaultDay.plusDays(14);

    String defaultDate1 = defaultDay1.toString(); 
    String defaultDate2 = defaultDay2.toString();
	
    // (임시) 세션에 skiID = 1 강제 설정
    session.setAttribute("skiID", 1);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지 - 매출관리/통계</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
    <jsp:include page="/skiAdmin/header.jsp" />
    <!-- Odometer CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/odometer@0.4.8/themes/odometer-theme-default.css" />
    <!-- Odometer & Chart.js 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/odometer@0.4.8/odometer.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <!-- 전역 JS 변수 (JSP에서 전달) -->
    <script>
      window.odometerOptions = { duration: 200 };
      var defaultDate1 = "<%=defaultDate1%>";
      var defaultDate2 = "<%=defaultDate2%>";
      var contextPath  = "${pageContext.request.contextPath}";
      
    </script>
    
    
</head>
<body>
    <!-- 메인 컨텐츠 영역 -->
    <main class="main-content">
        <h2>📊 매출 관리 / 통계</h2>

        <!-- 매출 요약 카드 -->
        <section class="dashboard">
            <!-- 조회일자 선택 -->
            <div class="card">
                <h3>📅 조회일자선택</h3>
                <div class="date-range">
                    <input type="date" id="searchAtStart" value="<%=defaultDate1%>">
                    <span>~</span>
                    <input type="date" id="searchAtEnd" value="<%=defaultDate2%>">
                </div>
            </div>
            
            <!-- 총 매출 -->
            <div class="card">
    		    <h3>💰 총 매출</h3>
    		    <p id="totalSaleCard" class="odometer"></p>원
    		</div>
            <!-- 완료된 예약 -->
    		<div class="card">
    		    <h3>✅ 완료된 예약</h3>
    		    <p id="confirmReservCard" class="odometer"></p>건
    		</div>
            <!-- 취소된 예약 -->
    		<div class="card">
    		    <h3>❌ 취소된 예약</h3>
    		    <p id="cancleReservCard" class="odometer"></p>건
    		</div>
        </section>

        <!-- 차트 카드 (매출 추이 & 상품별 매출) -->
        <div class="chart-cards">
            <!-- 꺾은선(라인) 그래프 (날짜별 매출 변동) -->
            <div class="chart-card1">
              <div class="chart-card1-header">
                <h3>📈 날짜별 매출 변동</h3>
                <!-- 토글 버튼: 결제건수/결제금액 -->
                <div class="btn-group">
                  <button id="countBtn" class="toggle-btn active">결제건수</button>
                  <button id="amountBtn" class="toggle-btn">결제금액</button>
                </div>
              </div>
              <canvas id="salesChart" width="1000" height="280"></canvas>
            </div>

            <!-- 상품별 매출 비교 차트 (도넛 차트) -->
            <div class="chart-card">
                <h3>🏂 상품별 매출 기여도</h3>
                <canvas id="productChart"></canvas>
            </div>
        </div>

        <!-- 결제 내역 테이블 -->
        <div class="table-container">
            <h3>💳 결제 내역</h3>
            <div class="search-filter-container">
			    <select id="filterSelectPending">
		        	<%
					    Map<String, String> filterMap = FilterMapping.getFilterMap();
					    Iterator<Map.Entry<String, String>> it = filterMap.entrySet().iterator();
					    
					    Map.Entry<String, String> secondEntry = null;
					    
					    // 첫 번째 항목 건너뛰기
					    if (it.hasNext()) {
					        it.next();
					    }
					    // 두 번째 항목 가져오기
					    if (it.hasNext()) {
					        secondEntry = it.next();
					    }
					%>
					
					<% if (secondEntry != null) { %>
					    <option value="<%= secondEntry.getValue() %>"><%= secondEntry.getKey() %></option>
					<% } %>            
	                </select>
			    <div class="search-box">
			        <input type="text" id="searchInputPending" placeholder="검색어 입력" />			       
			        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="검색 아이콘" class="search-icon" onclick="searchList('skiPurchased')"/>
			    </div>
			</div>
            <div id=purchasedList></div>
        </div>
    </main>
    <script src="${pageContext.request.contextPath}/js/skiSaleManage.js"></script>
</body>
</html>
