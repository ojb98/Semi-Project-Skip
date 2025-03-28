<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        </div>
        <!-- 회원 역할 분포 차트 카드
        <div class="chart-card">
            <h3>회원 역할 분포</h3>
            <canvas id="roleChart"></canvas>
        </div>
    </div> -->

	<section class="sales-section">
		<div class="section-item">
			<section class="section-item-top">
				<span>어제</span>
				<span><fmt:formatNumber value="${daily.YESTERDAY}" type="number" pattern="###, ###"/>원</span>
			</section>
			<section class="section-item-bottom">
				<h4>일매출</h4>
				<h1><fmt:formatNumber value="${daily.TODAY}" type="number" pattern="###, ###"/>원</h1>
			</section>
		</div>
		
		<div class="section-item">
			<section class="section-item-top">
				<span>지난주</span>
				<span><fmt:formatNumber value="${weekly.LASTWEEK}" type="number" pattern="###, ###"/>원</span>
			</section>
			<section class="section-item-bottom">
				<h4>주매출</h4>
				<h1><fmt:formatNumber value="${weekly.THISWEEK}" type="number" pattern="###, ###"/>원</h1>
			</section>
		</div>
		
		<div class="section-item">
			<section class="section-item-top">
				<span>지난달</span>
				<span><fmt:formatNumber value="${monthly.LASTMONTH}" type="number" pattern="###, ###"/>원</span>
			</section>
			<section class="section-item-bottom">
				<h4>월매출</h4>
				<h1><fmt:formatNumber value="${monthly.THISMONTH}" type="number" pattern="###, ###"/>원</h1>
			</section>
		</div>
		
		<div class="section-item">
			<section class="section-item-top">
				<span>작년</span>
				<span><fmt:formatNumber value="${yearly.LASTYEAR}" type="number" pattern="###, ###"/>원</span>
			</section>
			<section class="section-item-bottom">
				<h4>연매출</h4>
				<h1><fmt:formatNumber value="${yearly.THISYEAR}" type="number" pattern="###, ###"/>원</h1>
			</section>
		</div>
	</section>
	
	<section class="user-section">
        <div class="section-item">
        	<canvas id="visitor_chart" width="480" height="360"></canvas>
        </div>
        
        <div class="section-item">
            <h3>관리자 승인 대기자 수</h3>
            <p style="color:red;"><%= request.getAttribute("pendingCounts") %>건</p>
		</div>
        
        <div class="section-item">
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
	</section>
	
	<section class="popular-section">
		<div class="section-item">
            <h3>최근 매출 파이</h3>
            <canvas id="pie"></canvas>
        </div>
	</section>
</main>

<!-- (예시) 차트 스크립트 -->
<script>
	const visitor_json = ${visitor_json};
	const label = [];
	for (let i = 0; i < visitor_json.list.length; i++) {
		if (i % 10 === 0) {
			label.push(visitor_json.list[i].log_date.substr(5, 5));
			continue;
		}
		label.push('');
	}
	label.push('오늘');
	const log_count = visitor_json.list.map(o => o.log_count);
	log_count.push(${todayVisitorCount});
	const unique_log_count = visitor_json.list.map(o => o.unique_log_count);
	unique_log_count.push(${todayPureVisitorCount});
	// 방문자 수 차트
	let visitorData = {
		labels: label,
		datasets: [{
			label: "방문자",
			data: log_count,
			borderWidth: 1,
			borderColor: "rgba(54, 162, 235, 1)",
			backgroundColor: "rgba(54, 162, 235, 1)"
		},
		{
			label: "순방문자",
			data: unique_log_count,
			borderWidth: 1,
			borderColor: "rgba(255, 206, 86, 0.5)",
			backgroundColor: "rgba(255, 206, 86, 0.5)"
		}]
	};
	
	let visitorCtx = document.getElementById("visitor_chart").getContext("2d");
	new Chart(visitorCtx, {
		type: "line",
		data: visitorData,
		options: {
			responsive: false,
			plugins: {
	            subtitle: {
	                display: true,
	                text: '전체 가입자 수: ${totalUsers}                현재 접속자 수: ${currentUsers}'
	            }
	        }
		}
	});
	

    // 매출 파이 차트
    let salesData = {
        labels: ["스키장", "렌탈샵", "리조트"],
        datasets: [{
            data: [
                <%= request.getAttribute("SKI_PIE") %>,
                <%= request.getAttribute("RENTAL_PIE") %>,
                <%= request.getAttribute("RESORT_PIE") %>
            ],
            backgroundColor: [
                "rgba(54, 162, 235, 0.5)",
                "rgba(255, 206, 86, 0.5)",
                "rgba(75, 192, 192, 0.5)"
            ],
            borderColor: [
                "rgba(54, 162, 235, 1)",
                "rgba(255, 206, 86, 1)",
                "rgba(75, 192, 192, 1)"
            ],
            borderWidth: 1
        }]
    };

    let salesCtx = document.getElementById("pie").getContext("2d");
    new Chart(salesCtx, {
        type: "pie",
        data: salesData,
        options: {
            responsive: false,
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
