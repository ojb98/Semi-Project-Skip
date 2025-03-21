<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ski:p</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage.css">
</head>
<body>
<!-- header -->
<jsp:include page="/header.jsp" />

<!-- main -->
<main>
	<div class="slide">
	  슬라이드 영역
	</div>
	<div class="main_menu">
		<button type="button" class="menu_btn"><i class="fa fa-map-marker"></i>스키장 어디로 가시나요?</button>
		<button type="button" class="search_btn">리조트 검색</button>
		<!-- 지역 선택 박스 -->
		<div class="location_box">
			<div class="location_inner">
				<div class="search_bar">
					<input type="text" placeholder="지역명, 명소명, 호텔명 검색">
					<button type="button" class="close_btn" id="closeBtn">&times;</button>
				</div>
				
				<div class="location_list">
					<h3><i class="fa fa-map-marker"></i>주요도시</h3>
					
					<h4>강원도</h4>
					<div class="button_group">
						<button>평창 휘닉스파크</button>
						<button>평창 모나용평</button>
						<button>평창 알펜시아</button>
						<button>춘천 엘리시안 강촌</button>
						<button>정선 하이원 리조트</button>
						<button>홍천 비발디파크</button>
						<button>원주 오크밸리</button>
						<button>횡성 웰리힐리파크</button>
						<button>태백 오투리조트</button>
					</div>
					
					<h4>경기도</h4>
					<div class="button_group">
						<button>광주 곤지암 리조트</button>
						<button>이천 지산 포레스트</button>
					</div>
					<h4>전라북도</h4>
					<div class="button_group">
						<button>무주 리조트</button>
					</div>
					<h4>경상남도</h4>
					<div class="button_group">
						<button>양산 에덴밸리 리조트</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- main -->
	<div class="main_container">
		<div class="main_title_box">
			<div class="search_menu">
				<label for="" class="main_title">지금 스키장 날씨는?</label>
				<select class="forecast_select" onchange="getForecast()">
				</select>
			</div>
		</div>
		<div class="main_content">
			<div class="forecasts">
				<c:forEach var="i" begin="1" end="9">
					<div class="forecast">
						<div class="forecast_day"></div>
						<div class="forecast_time"></div>
						<img class="forecast_img" width="100px" height="100px" hidden>
						<div class="forecast_temp"></div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</main>

<!-- footer -->
<jsp:include page="/footer.jsp" />
<script>
	const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

	const select = document.getElementsByTagName("select")[0];

	const forecast_times = document.getElementsByClassName("forecast_time");
	const forecast_days = document.getElementsByClassName("forecast_day");
	const forecast_imgs = document.getElementsByClassName("forecast_img");
	const forecast_temps = document.getElementsByClassName("forecast_temp");

	let lats = [];
	let lons = [];

	const xhr1 = new XMLHttpRequest();
	xhr1.onreadystatechange = () => {
		if (xhr1.readyState === 4 && xhr1.status === 200) {
			const json = JSON.parse(xhr1.responseText);
			lats = json.lats;
			lons = json.lons;
			for (let i = 0; i < json.list.length; i++) {
				const option = document.createElement("option");
				option.value = i;
				option.innerText = json.list[i].name;
				select.appendChild(option);
			}
		}
	};
	xhr1.open("get", "${pageContext.request.contextPath}/ski/location", false);
	xhr1.send();

	const lists = new Array(lats.length);

	function setForecastScreen(list) {
		const now = new Date();
		let date = new Date(list[0].dt_txt);
		let minDif = Math.abs(date - now);
		let minIdx = 0;
		for (let i = 1; i < 8; i++) {
			date = new Date(list[i].dt_txt);
			const dif = Math.abs(date - now);
			if (dif < minDif) {
				minDif = dif;
				minIdx = i;
			}
		}
		forecast_times[0].innerText = "Now";
		forecast_days[0].innerText = days[now.getDay()];
		forecast_imgs[0].src = "${pageContext.request.contextPath}/img/weather_icon/" + list[minIdx].weather[0].icon + ".png";
		forecast_imgs[0].style = "display: block";
		forecast_temps[0].innerText = list[minIdx].main.temp + "°";
		for (let i = 10; i < 40; i += 4) {
			const date = new Date(list[i].dt_txt);
			const idx = (i - 6) / 4;
			forecast_days[idx].innerText = days[date.getDay()];
			if (list[i].sys.pod === "d") {
				forecast_times[idx].innerText = "6 AM";
			} else {
				forecast_times[idx].innerText = "6 PM";
			}
			forecast_imgs[idx].src = "${pageContext.request.contextPath}/img/weather_icon/" + list[i].weather[0].icon + ".png";
			forecast_imgs[idx].style = "display: block";
			forecast_temps[idx].innerText = list[i].main.temp + "°";
		}
	}

	function getForecast() {
		if (typeof lists[select.value] === "undefined") {
			const xhr = new XMLHttpRequest();
			xhr.onreadystatechange = () => {
				if (xhr.readyState === 4 && xhr.status === 200) {
					const json = JSON.parse(xhr.responseText);
					const list = json.list;
					lists[select.value] = list;
					setForecastScreen(list);
				}
			};
			xhr.open("get", "https://api.openweathermap.org/data/2.5/forecast?lat=" + lats[select.value] +
				"&lon=" + lons[select.value] + "&appid=6fb949b3ade2fd03973596dbc2f2939a&units=metric&cnt=40");
			xhr.send();
		} else {
			setForecastScreen(lists[select.value]);
		}
	}
	
	getForecast();
</script>
</body>
</html>