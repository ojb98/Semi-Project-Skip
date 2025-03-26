<%@page import="ski.dto.SkiSalesListDto"%>
<%@page import="java.time.LocalDate"%>
<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	LocalDate defaultDay = LocalDate.now();
	LocalDate defaultDay1 = defaultDay.minusDays(14);
	LocalDate defaultDay2 = defaultDay.plusDays(14);
	String defaultDate1 = defaultDay1.toString();
	String defaultDate2 = defaultDay2.toString();
	
	List<SkiSalesListDto> SalesList = (List<SkiSalesListDto>)request.getAttribute("salesList");
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
  	<script type="text/javascript">
	  	let atStart = "<%=defaultDate1%>";
	  	let atEnd = "<%=defaultDate2%>"; 	
	  	let currentChartType = "amount";
	  	const contextPath = "${pageContext.request.contextPath}";
	  	
	  	document.addEventListener("DOMContentLoaded", function(){
	  		document.getElementById("searchAtStart").value = "<%=defaultDate1%>";
	  		document.getElementById("searchAtEnd").value = "<%=defaultDate2%>";

	  		atStart = "<%=defaultDate1%>";
	  		atEnd = "<%=defaultDate2%>";

	  		selectSalesByTime(atStart, atEnd); // 카드값 갱신
	  		updateChart("amount");

	  		document.getElementById("searchAtStart").addEventListener("change", dateChange);
	  		document.getElementById("searchAtEnd").addEventListener("change", dateChange);
	  	});
	  	
	  	function dateChange() {
	  	    atStart = document.getElementById("searchAtStart").value;
	  	    atEnd = document.getElementById("searchAtEnd").value;
	  	    if(atStart && atEnd){            
	  	        selectSalesByTime(atStart, atEnd);
	  	        updateChart(currentChartType);  // 현재 설정된 차트 유형을 사용
	  	    }
	  	}
	  
	  	function selectSalesByTime(atStart,atEnd) {
	  	    var xhr = new XMLHttpRequest();
	  	    xhr.onreadystatechange = function() {
	  	        if(xhr.readyState === 4 && xhr.status === 200) {
	  	            try {
	  	                var result = JSON.parse(xhr.responseText);
	  	                // 카드에 값 반영
	  	                document.getElementById("totalSaleCard").textContent = result.totalSale.toLocaleString() + "원";
	  	                document.getElementById("confirmReservCard").textContent = result.confirmReserv + "건";
	  	                document.getElementById("cancleReservCard").textContent = result.cancleReserv + "건";
	  	            } catch (e) {
	  	                console.error("파싱 오류:", e);
	  	            }
	  	        }
	  	    };
	  	    xhr.open("GET", contextPath + "/skiAdmin/skiSaleManage?atStart=" + encodeURIComponent(atStart) + "&atEnd=" + encodeURIComponent(atEnd), true);
	  	    xhr.send();
	  	}
	  	
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
              <h3>📅조회일자선택</h3>
              <div class="date-range">
                  <input type="date" id="searchAtStart" value="<%=defaultDate1%>">
                  <span>~</span>
                  <input type="date" id="searchAtEnd" value="<%=defaultDate2%>">
              </div>
          </div>
        <div class="card">
		    <h3>💰 총 매출</h3>
		    <p id="totalSaleCard">${totalSale}</p>
		</div>
		<div class="card">
		    <h3>✅ 완료된 예약</h3>
		    <p id="confirmReservCard">${confirmReserv }</p>
		</div>
		<div class="card">
		    <h3>❌ 취소된 예약</h3>
		    <p id="cancleReservCard">${cancleReserv }</p>
		</div>
    </section>

    <!-- 차트 카드 (매출 추이 & 예약 상태 비율) -->
    <div class="chart-cards">
        <!-- 매출 변동 차트 -->
        <div class="chart-card1">
            <h3>📈 날짜별 매출 변동</h3>
            <!-- 버튼 영역 -->
			<div class="btn-group">
			  <!-- 각 버튼에 id를 달아서 JavaScript로 active 클래스를 제어하기 쉽게 함 -->
			  <button id="countBtn" class="toggle-btn active" onclick="updateChart('count')">결제건수</button>
			  <button id="amountBtn" class="toggle-btn" onclick="updateChart('amount')">결제금액</button>
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
            <tbody id="SalesTableBody">                               
            </tbody>
        </table>
    </div>
</main>

<!-- Chart.js 스크립트 -->
<script>
	let chartInstance;
	const ctx = document.getElementById('salesChart').getContext('2d');
	
	function fetchChartData(atStart, atEnd, type) {
	  fetch(contextPath + "/skiAdmin/salesChartData?atStart=" + atStart + "&atEnd=" + atEnd)
	    .then(res => res.json())
	    .then(data => {
	      // 예: 서버 데이터는 SALESDATE가 "03/02" 형식으로 내려온다고 가정
	      const fullLabels = generateDateLabels(atStart, atEnd).map(dateStr => {
	        // 원하는 출력 포맷으로 변환, 예를 들어 "YYYY-MM-DD" -> "MM/DD"
	        const d = new Date(dateStr);
	        const month = d.getMonth() + 1;
	        const day = d.getDate();
	        return (month < 10 ? "0" + month : month) + "/" + (day < 10 ? "0" + day : day);
	      });
	      const dataset = fillDataForDates(fullLabels, data, type);
	      renderChart(type, fullLabels, dataset);
	    });
	}
	
	function renderChart(type, labels, dataset) {
	  if (chartInstance) chartInstance.destroy();

	  chartInstance = new Chart(document.getElementById('salesChart').getContext('2d'), {
	    type: 'line',
	    data: {
	      labels: labels,
	      datasets: [{
	        label: type === 'amount' ? '결제금액 (원)' : '결제건수 (건)',
	        data: dataset,
	        borderColor: '#36a2eb',
	        tension: 0.4,
	        fill: false,
	        pointRadius: 4,
	        pointHoverRadius: 6,
	      }]
	    },
	    options: {
	      responsive: true,
	      plugins: {
	    	  tooltip: {
	    	    callbacks: {
	    	      label: function(ctx) {
	    	        const rawValue = ctx.raw; // 데이터 값
	    	        if (type === 'amount') {
	    	          // 소수점 둘째 자리까지 표시 (원 단위)
	    	        	return "₩ " + Number(rawValue).toLocaleString(undefined, { 
	    	        	    minimumFractionDigits: 2, 
	    	        	    maximumFractionDigits: 2  
	    	        	});
	    	        } else {
	    	          // 'count'인 경우 정수 + '건'
	    	          return `${rawValue} 건`;
	    	        }
	    	      }
	    	    }
	    	  }
	    	},
	      scales: {
	        y: {
	          beginAtZero: true,
	          ticks: {
	            callback: (value) => type === 'amount' ? '₩' + value.toLocaleString() : value + '건'
	          }
	        }
	      }
	    }
	  });
	}
	
	function updateChart(type) {
	 // 모든 버튼에서 active 제거
	  document.querySelectorAll('.btn-group .toggle-btn')
	    .forEach(btn => btn.classList.remove('active'));
	  
	  // 현재 선택된 타입에 맞춰 active 추가
	  if (type === 'count') {
	    document.getElementById('countBtn').classList.add('active');
	  } else {
	    document.getElementById('amountBtn').classList.add('active');
	  }
	    fetchChartData(atStart, atEnd, type);
	}
	
	function changeChartType(newType) {
	    currentChartType = newType;
	    updateChart(currentChartType);
	}
	
    // 상품별 매출 기여도 (막대 그래프)
    var ctx3 = document.getElementById('productChart').getContext('2d');
    new Chart(ctx3, {
        type: 'bar',
        data: {
            labels: ['리프트권', '스키 대여', '스키 강습', '보드'],
            datasets: [{
                label: '매출 (단위: 원)',
                data: [4000000, 3000000, 2000000, 1000000],
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0']
            }]
        }
    });
</script>
<script type="text/javascript">
//1. 전체 날짜 범위 배열 생성 함수
	function generateDateLabels(startDateStr, endDateStr) {
	  const labels = [];
	  const startDate = new Date(startDateStr);
	  const endDate = new Date(endDateStr);
	  const current = new Date(startDate);
	  while (current <= endDate) {
	    // 원하는 형식으로 날짜 포맷 (예: MM/DD)
	    const month = current.getMonth() + 1;
	    const day = current.getDate();
	    const formatted = (month < 10 ? "0" + month : month) + "/" + (day < 10 ? "0" + day : day);
	    labels.push(formatted);
	    current.setDate(current.getDate() + 1);
	  }
	  return labels;
	}

// 2. 서버 데이터와 전체 날짜를 병합하여 dataset 생성 함수
	function fillDataForDates(fullLabels, data, type) {
	  // data: 서버에서 받은 배열, 예: [{ SALESDATE: "03/02", AMOUNT: 12345, COUNT: 1 }, ...]
	  const dataMap = {};
	  data.forEach(item => {
	    // 서버 데이터의 SALESDATE 형식과 fullLabels 형식이 동일한지 확인하세요.
	    dataMap[item.SALESDATE] = type === 'amount' ? item.AMOUNT : item.COUNT;
	  });
	  // fullLabels에 대해 해당 값이 있으면 사용하고, 없으면 0
	  return fullLabels.map(label => dataMap[label] !== undefined ? dataMap[label] : 0);
	}
</script>
</body>
</html>
