(function(){
  let atStart, atEnd;
  let currentChartType = "amount";
  let chartInstance;

  document.addEventListener("DOMContentLoaded", function(){
    // DOM 요소가 로드된 후 값 읽기
    atStart = document.getElementById("searchAtStart").value;
    atEnd = document.getElementById("searchAtEnd").value;
    
    console.log("초기 날짜:", atStart, atEnd);
    
    selectSalesByTime(atStart, atEnd);
    updateChart("amount");
    
    document.getElementById("searchAtStart").addEventListener("change", dateChange);
    document.getElementById("searchAtEnd").addEventListener("change", dateChange);
    
    // productChart 생성 (수평 막대그래프)
    var productChartCanvas = document.getElementById('productChart');
    if (productChartCanvas) {
      var ctx3 = productChartCanvas.getContext('2d');
      new Chart(ctx3, {
        type: 'bar',
        data: {
          labels: ['리프트권', '스키 대여', '스키 강습', '보드', '카테고리5', '카테고리6'],
          datasets: [{
            label: '매출 (단위: 원)',
            data: [4000000, 3000000, 2000000, 1000000, 500000, 300000],
            backgroundColor: [
              '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#36A2EB', '#FFCE56'
            ]
          }]
        },
        options: {
          indexAxis: 'y',
          responsive: true,
          scales: {
            x: {
              beginAtZero: true
            }
          }
        }
      });
    } else {
      console.error("productChart 캔버스 요소를 찾을 수 없습니다.");
    }
  });
  
  function dateChange() {
    atStart = document.getElementById("searchAtStart").value;
    atEnd = document.getElementById("searchAtEnd").value;
    console.log("날짜 변경:", atStart, atEnd);
    if (atStart && atEnd) {
      selectSalesByTime(atStart, atEnd);
      updateChart(currentChartType);
    }
  }
  
  function selectSalesByTime(atStart, atEnd) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function(){
      if (xhr.readyState === 4) {
        if(xhr.status === 200) {
          try {
            var result = JSON.parse(xhr.responseText);
            console.log("매출 요약 데이터:", result);
            document.getElementById("totalSaleCard").innerHTML = result.summary.totalSale;
            document.getElementById("confirmReservCard").innerHTML = result.summary.confirmReserv;
            document.getElementById("cancleReservCard").innerHTML = result.summary.cancleReserv;
          } catch(e) {
            console.error("파싱 오류:", e);
          }
        } else {
          console.error("요청 오류:", xhr.status);
        }
      }
    };
    xhr.open("GET", contextPath + "/skiAdmin/skiSaleManage?atStart=" + encodeURIComponent(atStart) + "&atEnd=" + encodeURIComponent(atEnd), true);
    xhr.send();
  }
  
  function fetchChartData(atStart, atEnd, type) {
    fetch(contextPath + "/skiAdmin/salesChartData?atStart=" + atStart + "&atEnd=" + atEnd)
      .then(res => res.json())
      .then(data => {
        console.log("차트 데이터:", data);
        const fullLabels = generateDateLabels(atStart, atEnd).map(dateStr => {
          const d = new Date(dateStr);
          const month = d.getMonth() + 1;
          const day = d.getDate();
          return (month < 10 ? "0" + month : month) + "/" + (day < 10 ? "0" + day : day);
        });
        const dataset = fillDataForDates(fullLabels, data, type);
        renderChart(type, fullLabels, dataset);
      })
      .catch(err => console.error(err));
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
          pointHoverRadius: 6
        }]
      },
      options: {
        responsive: true,
        plugins: {
          tooltip: {
            callbacks: {
              label: function(ctx) {
                const rawValue = ctx.raw;
                if (type === 'amount') {
                  return "₩ " + Number(rawValue).toLocaleString(undefined, { 
                    minimumFractionDigits: 2, 
                    maximumFractionDigits: 2  
                  });
                } else {
                  return rawValue + " 건";
                }
              }
            }
          }
        },
        scales: {
          y: {
            beginAtZero: true,
            ticks: {
              callback: value => type === 'amount' ? '₩' + value.toLocaleString() : value + '건'
            }
          }
        }
      }
    });
  }
  
  function updateChart(type) {
    document.querySelectorAll('.btn-group .toggle-btn').forEach(btn => btn.classList.remove('active'));
    if (type === 'count') {
      document.getElementById('countBtn').classList.add('active');
    } else {
      document.getElementById('amountBtn').classList.add('active');
    }
    currentChartType = type;
    fetchChartData(atStart, atEnd, type);
  }
  
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
  
  function fillDataForDates(fullLabels, data, type) {
    const dataMap = {};
    data.forEach(item => {
      dataMap[item.SALESDATE] = type === 'amount' ? item.AMOUNT : item.COUNT;
    });
    return fullLabels.map(label => dataMap[label] !== undefined ? dataMap[label] : 0);
  }
  
  window.updateChart = updateChart;
})();
