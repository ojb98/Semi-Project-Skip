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
	        <li><a href="${pageContext.request.contextPath}/skiAdmin/skiReview.jsp">리뷰 관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/skiAdmin/skiSaleManage.jsp">매출관리/통계</a></li>
        </ul>
    </aside>
    
    <!-- 메인 컨텐츠 영역 -->
<main class="main-content">
    <h2>📊 매출 관리 / 통계</h2>

    <!-- 매출 요약 카드 -->
    <section class="dashboard">
        <div class="card">
            <h3>💰 총 매출</h3>
            <p>${totalSale }</p>
        </div>
        <div class="card">
            <h3>📅 총 예약</h3>
            <p>${totalReserv}</p>
        </div>
        <div class="card">
            <h3>✅ 완료된 예약</h3>
            <p>${confirmReserv }</p>
        </div>
        <div class="card">
            <h3>❌ 취소된 예약</h3>
            <p>${cancleReserv }</p>
        </div>
    </section>

    <!-- 차트 카드 (매출 추이 & 예약 상태 비율) -->
    <div class="chart-cards">
        <!-- 매출 변동 차트 -->
        <div class="chart-card">
            <h3>📈 날짜별 매출 변동</h3>
            <canvas id="salesChart"></canvas>
        </div>

        <!-- 예약 상태 비율 차트 -->
        <div class="chart-card">
            <h3>📊 예약 상태별 비율</h3>
            <canvas id="statusChart"></canvas>
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
                    <th>고객명</th>
                    <th>아이디</th>
                    <th>결제금액</th>
                    <th>결제상태</th>
                    <th>결제일자</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>0001</td>
                    <td>홍길동</td>
                    <td>user001</td>
                    <td>200,000원</td>
                    <td>결제완료</td>
                    <td>2025-03-15</td>
                </tr>
                <tr>
                    <td>0002</td>
                    <td>김철수</td>
                    <td>user002</td>
                    <td>150,000원</td>
                    <td>환불완료</td>
                    <td>2025-03-14</td>
                </tr>
            </tbody>
        </table>
    </div>
</main>

<!-- Chart.js 스크립트 -->
<script>
    // 매출 변동 차트 (막대 그래프)
    var ctx1 = document.getElementById('salesChart').getContext('2d');
    new Chart(ctx1, {
        type: 'bar',
        data: {
            labels: ['3월 1일', '3월 5일', '3월 10일', '3월 15일', '3월 20일'],
            datasets: [{
                label: '매출 (단위: 원)',
                data: [2000000, 1500000, 2500000, 1800000, 2200000],
                backgroundColor: 'rgba(54, 162, 235, 0.6)'
            }]
        }
    });

    // 예약 상태 비율 차트 (원형 그래프)
    var ctx2 = document.getElementById('statusChart').getContext('2d');
    new Chart(ctx2, {
        type: 'pie',
        data: {
            labels: ['완료된 예약', '취소된 예약'],
            datasets: [{
                data: [120, 30],
                backgroundColor: ['#4CAF50', '#FF5733']
            }]
        }
    });

    // 상품별 매출 기여도 (막대 그래프)
    var ctx3 = document.getElementById('productChart').getContext('2d');
    new Chart(ctx3, {
        type: 'bar',
        data: {
            labels: ['리프트권', '스키 대여', '스키 강습', '스노우보드 대여'],
            datasets: [{
                label: '매출 (단위: 원)',
                data: [4000000, 3000000, 2000000, 1000000],
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0']
            }]
        }
    });
</script>

</body>
</html>
