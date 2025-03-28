(function () {
  let atStart, atEnd;
  let currentChartType = "amount"; // 기본: 결제금액
  let chartInstance; // 꺾은선 그래프 인스턴스

  // 페이지 로드 시 자동으로 데이터를 불러오고 이벤트를 등록합니다.
  window.addEventListener('DOMContentLoaded', () => {
    // JSP에서 주입받은 기본 날짜값 사용
    document.getElementById('searchAtStart').value = defaultDate1;
    document.getElementById('searchAtEnd').value   = defaultDate2;

    // 초기 데이터 조회: 전체 매출 데이터, 도넛 차트, 오도미터, 결제 내역 테이블
    fetchSalesDataAndUpdateUI();

    // 날짜 변경 시 자동 재조회
    document.getElementById('searchAtStart').addEventListener('change', fetchSalesDataAndUpdateUI);
    document.getElementById('searchAtEnd').addEventListener('change', fetchSalesDataAndUpdateUI);

    // 토글 버튼 이벤트 등록 (결제건수/결제금액)
    document.getElementById('countBtn').addEventListener('click', () => {
      setToggleActive('count');
      updateChart('count');
    });
    document.getElementById('amountBtn').addEventListener('click', () => {
      setToggleActive('amount');
      updateChart('amount');
    });
  });

	// listType: 'pending' 또는 'denied', page: 현재 페이지 번호
	function loadList(listType, page) {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState === 4) {
				if(xhr.status === 200) {
					document.getElementById("SalesTableBody").innerHTML = xhr.responseText;
				} else {
					alert("리스트 로딩 중 오류가 발생했습니다.");
				}
			}
		};
		var url = contextPath + "/admin/list?type=" + listType + "&page=" + page + "&atStart=" + atStart + "&atEnd" + atEnd;
		xhr.open("GET", url, true);
		xhr.send();
	}
	function searchList(listType) {
			var keyword, filter;
			keyword = document.getElementById("searchInputPending").value;
		    filter = document.getElementById("filterSelectPending").value;
			var xhr = new XMLHttpRequest();
		    xhr.onreadystatechange = function(){
		        if(xhr.readyState === 4){
		            if(xhr.status === 200){		                
		                    document.getElementById("SalesTableBody").innerHTML = xhr.responseText;		                
		            } else {
		                alert("검색 중 오류");
		            }
		        }
		    };
		      // 기본 검색 시 페이지 1로 처리합니다.
		      xhr.open("GET", contextPath + "/admin/list?type=" + listType + "&page=1" 
		    		  + "&keyword=" + encodeURIComponent(keyword) 
		    		  + "&filter=" + encodeURIComponent(filter), true);
		      xhr.send();
		  }

  /*
   * 전체 매출 데이터를 서버에서 가져와 UI(오도미터, 도넛 차트, 결제 내역 테이블)와
   * 전역 변수(window.dailySalesData)를 업데이트하는 함수
   */
  function fetchSalesDataAndUpdateUI() {
    const start = document.getElementById('searchAtStart').value;
    const end   = document.getElementById('searchAtEnd').value;
    const url   = `${contextPath}/skiAdmin/salesChartData?atStart=${start}&atEnd=${end}`;

    fetch(url)
      .then(response => response.json())
      .then(data => {
        console.log("전체 매출 데이터:", data);
        // data 구조: { dailySales, categorySales, totalSale, confirmReserv, cancleReserv, salesList }
        // (1) 날짜별 매출 데이터 저장 (꺾은선 그래프 업데이트 시 사용)
        window.dailySalesData = data.dailySales;
        // 꺾은선 그래프 업데이트 (데이터가 준비된 후 호출)
        updateChart(getCurrentChartType());

        // (2) 도넛 차트 업데이트 (상품별 매출 기여도)
        const labels = data.categorySales.map(item => `${item.category}`);
        const salesData = data.categorySales.map(item => item.total_sales);
        updateProductChart(labels, salesData);

        // (3) 오도미터 카드 업데이트 (총 매출, 예약 완료, 취소)
        updateOdometerValue('totalSaleCard', data.totalSale);
        updateOdometerValue('confirmReservCard', data.confirmReserv);
        updateOdometerValue('cancleReservCard', data.cancleReserv);

        // (4) 결제 내역 테이블 업데이트
       //updateSalesTable(data.salesList);
      })
      .catch(err => {
        console.error("매출 데이터 요청 실패:", err);
      });
  }

  /**
   * 전체 날짜 레이블 배열 생성 함수
   * 시작일과 종료일 사이의 모든 날짜를 "MM/DD" 형식으로 반환합니다.
   */
  function generateDateLabels(startDateStr, endDateStr) {
    const labels = [];
    const startDate = new Date(startDateStr);
    const endDate = new Date(endDateStr);
    const current = new Date(startDate);
    while (current <= endDate) {
      const month = current.getMonth() + 1;
      const day = current.getDate();
      const formatted = (month < 10 ? "0" + month : month) + "/" + (day < 10 ? "0" + day : day);
      labels.push(formatted);
      current.setDate(current.getDate() + 1);
    }
    return labels;
  }

  /**
   * 꺾은선(라인) 그래프 업데이트 함수  
   * type: 'count' (결제건수) 또는 'amount' (결제금액)
   * - 전체 날짜 범위에 대해 데이터가 없는 날짜는 0으로 표시
   * - 그래프 아래를 채우지 않고(fill: false), 원래 지정한 색상으로 표시합니다.
   */
  function updateChart(type) {
    const start = document.getElementById('searchAtStart').value;
    const end = document.getElementById('searchAtEnd').value;
    const fullLabels = generateDateLabels(start, end);

    // window.dailySalesData에 저장된 데이터를 기반으로 데이터를 매핑
    const dailySalesData = window.dailySalesData || [];
    const dataMap = {};
    dailySalesData.forEach(item => {
      // 데이터 키: 소문자 또는 대문자 차이를 보완
      const dateLabel = item.salesDate || item.SALESDATE;
      if (type === 'count') {
        dataMap[dateLabel] = item.count || item.COUNT;
      } else {
        dataMap[dateLabel] = item.amount || item.AMOUNT;
      }
    });
    // fullLabels에 대해 값이 없으면 0으로 채움
    const chartData = fullLabels.map(label => dataMap[label] !== undefined ? dataMap[label] : 0);

    console.log("업데이트 차트 - fullLabels:", fullLabels, "chartData:", chartData);

    const ctx = document.getElementById('salesChart').getContext('2d');
    if (window.salesChartInstance) {
      window.salesChartInstance.destroy();
    }

    window.salesChartInstance = new Chart(ctx, {
      type: 'line',
      data: {
        labels: fullLabels,
        datasets: [{
          label: (type === 'count') ? '결제 건수' : '결제 금액',
          data: chartData,
          borderColor: '#5399f5',
          backgroundColor: 'rgba(0, 0, 0, 0)', // 그래프 아래 채우지 않음
          fill: false,
          tension: 0.3
        }]
      },
      options: {
        responsive: true,
        scales: {
          y: { beginAtZero: true }
        }
      }
    });
  }

  /**
   * 상품별 매출 기여도 도넛 차트 업데이트 함수
   */
  function updateProductChart(labels, data) {
    const ctx = document.getElementById('productChart').getContext('2d');
    if (window.productChartInstance) {
      window.productChartInstance.destroy();
    }
    window.productChartInstance = new Chart(ctx, {
      type: 'doughnut',
      data: {
        labels: labels,
        datasets: [{
          label: '상품별 매출 기여도',
          data: data,
          backgroundColor: [
              'rgba(255, 99, 132, 0.7)',
			  'rgba(54, 162, 235, 0.7)',
			  'rgba(255, 206, 86, 0.7)',
			  'rgba(75, 192, 192, 0.7)',
			  'rgba(153, 102, 255, 0.7)',
			  'rgba(255, 159, 64, 0.7)',
			  'rgba(201, 203, 207, 0.7)',
			  'rgba(100, 149, 237, 0.7)',   
			  'rgba(255, 105, 180, 0.7)',   
			  'rgba(144, 238, 144, 0.7)',   
			  'rgba(255, 215, 0, 0.7)',     
			  'rgba(199, 21, 133, 0.7)',    
			  'rgba(64, 224, 208, 0.7)',    
			  'rgba(138, 43, 226, 0.7)',    
			  'rgba(210, 105, 30, 0.7)',    
			  'rgba(32, 178, 170, 0.7)',  
			  'rgba(244, 164, 96, 0.7)'
          ],
          borderColor: 'white',
          borderWidth: 2
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: { position: 'bottom' }
        }
      }
    });
  }

  /**
   * 오도미터 카드 업데이트 함수
   */
  function updateOdometerValue(elementId, value) {
    const el = document.getElementById(elementId);
    if (el) { el.innerHTML = value; }
  }

  /**
   * 결제 내역 테이블 업데이트 함수  
   * salesList: 결제 내역 객체 배열 (getter 없이 속성명으로 접근)
   *
  function updateSalesTable(salesList) {
    const tbody = document.getElementById('SalesTableBody');
    tbody.innerHTML = ''; // 초기화

    if (!salesList || salesList.length === 0) {
      tbody.innerHTML = '<tr><td colspan="7">데이터가 없습니다.</td></tr>';
      return;
    }
	
	
    salesList.forEach(item => {
      const tr = document.createElement('tr');
      let payment_method = item.payment_method; // 기본값은 원래 값

	  if(item.payment_method === "NAVERPAY") {
	    payment_method = '네이버페이';
	  }else if(item.payment_method === "KAKAOPAY"){
		payment_method = '카카오페이';
	  }else{
		payment_method = '카드/현장결제';
	  }
      
      tr.innerHTML = `
        <td>${item.payment_id}</td>
        <td>${item.user_id}</td>
        <td>${payment_method}</td>
        <td>${item.total_price}원</td>
        <td>${item.status}</td>
        <td>${item.created_at}</td>
      `;
      tbody.appendChild(tr);
    });
  }
*/
  /**
   * 토글 버튼 활성화 상태 설정  
   * type: 'count' 또는 'amount'
   */
  function setToggleActive(type) {
    const countBtn = document.getElementById('countBtn');
    const amountBtn = document.getElementById('amountBtn');
    if (type === 'count') {
      countBtn.classList.add('active');
      amountBtn.classList.remove('active');
    } else {
      amountBtn.classList.add('active');
      countBtn.classList.remove('active');
    }
  }

  /**
   * 현재 활성화된 토글 타입('count' 또는 'amount') 반환 (기본은 'count')
   */
  function getCurrentChartType() {
    const countBtn = document.getElementById('countBtn');
    return countBtn.classList.contains('active') ? 'count' : 'amount';
  }

  // 필요시 전역에서 updateChart 함수를 사용할 수 있도록 노출
  window.updateChart = updateChart;
  window.onload = function(){
	loadList('skiPurchased',1);
	};
})();
