<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
</head>
<body>

<!-- 상단 헤더 -->
<header>
    <div class="header-left">
        <a href="${pageContext.request.contextPath}/admin/dashboard">
            <h1>SKI:P</h1>
        </a>
    </div>
    <!-- 우측 정보는 삭제 -->
</header>

<!-- 왼쪽 사이드바 -->
<aside class="sidebar">
    <div class="sidebar-profile">
        <img src="" alt="사진프로필" class="profile-icon">
        <div class="admin-name">관리자님</div>
    </div>
    <ul>
        <li><a href="${pageContext.request.contextPath}/admin/dashboard">대시보드</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/adminApprovalRequest.jsp">관리자 요청 승인/관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/customersInfo">고객 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/paymentsInfo">매출 관리</a></li>
    </ul>
</aside>

<!-- 메인 컨텐츠 영역 -->
<main class="main-content adminmain">
    <!-- <section class="dashboard">
        <div class="card">
            <h3>총 회원 수</h3>
            <p style="color:red;"><%= request.getAttribute("totalUsers") %>명</p>
        </div>
        <div class="card">
            <h3>관리자 승인 대기자 수</h3>
            <p style="color:red;"><%= request.getAttribute("pendingCounts") %>건</p>
        </div>
        <div class="card">
            <h3>오늘 방문자</h3>
            <p style="color:red;"><%= request.getAttribute("todayVisitors") %>명</p>
        </div>
        <div class="card">
            <h3>인기 스키장</h3>
            <p style="color:red;"><%= request.getAttribute("popularSkiResort") %></p>
        </div>
    </section>
    
    <!-- 차트와 신규 가입자 리스트를 포함한 카드 영역
    <div class="chart-cards">
        <!-- 매출 차트 카드
        <div class="chart-card">
            <h3>금일 시간별 매출 추이</h3>
            <canvas id="revenueChart"></canvas>
        </div>
        <!-- 신규 가입자 리스트 카드 (최대 5줄)
        
        <div class="chart-card">
            <h3>최근 신규 가입자</h3>
            <table >
                <thead>
                    <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>역할</th>
                        <th>가입일</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<UsersDTO> newUsers = (List<UsersDTO>) request.getAttribute("newUserList");
                        if(newUsers != null) {
                            int count = 0;
                            for(UsersDTO user : newUsers) {
                                if(count++ >= 9) break;
                    %>
                    <tr>
                        <td><%= user.getUser_id() %></td>
                        <td><%= user.getName() %></td>
                        <td><%= user.getRole() %>   
						<td><%= sdf.format(user.getRegdate()) %></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
        <!-- 회원 역할 분포 차트 카드
        <div class="chart-card">
            <h3>회원 역할 분포</h3>
            <canvas id="roleChart"></canvas>
        </div>
    </div> -->

	<section class="sales-section">
		<div>일매출: ${daily.TODAY}</div>
		
		<div>주매출: ${weekly.THISWEEK}</div>
		
		<div>월매출: ${monthly.THISMONTH}</div>
		
		<div>연매출: ${yearly.THISYEAR}</div>
	</section>
	
	<section class="user-section">
        <div>방문자 수:${todayVisitorCount} 그래프 with 순 방문자 수:${todayPureVisitorCount}, 전체 이용자 수${totalUsers}, 현재 접속자 수${currentUsers}</div>
        
        <div>승인 대기 리스트</div>
        
        <div>최근 가입자 리스트</div>
	</section>
	
	<section class="popular-section">
		<div>최근 스키${SKI_PIE} 렌탈${RENTAL_PIE} 리조트${RESORT_PIE} 중 매출 파이</div>
		
		<div>최근 인기 있는 시설</div>
	</section>
</main>

<!-- (예시) 차트 스크립트 -->
<script>
    // 매출 차트
    let revenueData = {
        labels: ["09:00", "11:00", "13:00", "15:00", "17:00", "19:00", "21:00", "23:00", "1:00", "3:00"],
        datasets: [
            {
                label: "총매출 (₩)",
                data: [120000, 150000, 180000, 410000, 750000, 1000000, 1500000],
                backgroundColor: "rgba(0, 123, 255, 0.5)",
                borderColor: "#007bff",
                borderWidth: 2
            },
            {
                label: "입장권 매출 (₩)",
                data: [40000, 80000, 120000, 200000, 400000, 800000, 880000],
                backgroundColor: "rgba(255, 0, 0, 0.5)",
                borderColor: "#252525",
                borderWidth: 2
            }
        ]
    };

    let revenueCtx = document.getElementById("revenueChart").getContext("2d");
    new Chart(revenueCtx, {
        type: "line",
        data: revenueData,
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // 회원 역할 분포 차트
    let roleData = {
        labels: ["일반 사용자", "스키장 운영자", "렌탈샵 운영자", "리조트 운영자"],
        datasets: [{
            data: [
                <%= request.getAttribute("userCount") %>,
                <%= request.getAttribute("skiOwners") %>,
                <%= request.getAttribute("rentalOwners") %>,
                <%= request.getAttribute("resortOwners") %>
            ],
            backgroundColor: [
                "rgba(255, 99, 132, 0.5)",
                "rgba(54, 162, 235, 0.5)",
                "rgba(255, 206, 86, 0.5)",
                "rgba(75, 192, 192, 0.5)"
            ],
            borderColor: [
                "rgba(255, 99, 132, 1)",
                "rgba(54, 162, 235, 1)",
                "rgba(255, 206, 86, 1)",
                "rgba(75, 192, 192, 1)"
            ],
            borderWidth: 1
        }]
    };

    let roleCtx = document.getElementById("roleChart").getContext("2d");
    new Chart(roleCtx, {
        type: "doughnut",
        data: roleData,
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: "top"
                }
            }
        }
    });
</script>
</body>
</html>
