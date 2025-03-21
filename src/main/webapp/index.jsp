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
				<div class="forecast_main">
					<div class="forecast_date_wrapper">
						<div class="forecast_date_main"></div>
						<div class="forecast_time_info">
							<div class="forecast_time_main"></div>
							<div class="forecast_day_main"></div>
						</div>
					</div>
					<div class="forecast_info_main">
						<img class="forecast_img_main" width="150px" height="150px" hidden>
						<div class="forecast_desc_wrapper">
							<div class="forecast_desc"></div>
							<div class="forecast_temp_wrapper">
								<div class="forecast_temp_main"></div>
								<div class="temp_symbol">
									<span>°C</span>
								</div>
							</div>
						</div>
					</div>
					<div class="forecast_details">
						<div>
							<span class="forecast_feel"></span>
							<span class="forecast_humid"></span>
						</div>
						<div>
							<span class="forecast_wind"></span>
							<span class="forecast_rain"></span>
						</div>
						<div>
							<span class="forecast_cloud"></span>
							<span class="forecast_snow"></span>
						</div>
					</div>
				</div>
				<div class="forecasts_sub">
					<c:forEach var="i" begin="0" end="8">
						<div class="forecast" onclick="showDetail(${i})">
							<div class="forecast_day"></div>
							<div class="forecast_time"></div>
							<img class="forecast_img" width="100px" height="100px" hidden>
							<div class="forecast_temp"></div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</main>

<!-- footer -->
<jsp:include page="/footer.jsp" />

<script>
	const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

	const select = document.getElementsByTagName("select")[0];

	// 상세 예보
	const forecast_date_main = document.getElementsByClassName("forecast_date_main")[0];
	const forecast_day_main = document.getElementsByClassName("forecast_day_main")[0];
	const forecast_time_main = document.getElementsByClassName("forecast_time_main")[0];
	const forecast_img_main = document.getElementsByClassName("forecast_img_main")[0];
	const forecast_temp_main = document.getElementsByClassName("forecast_temp_main")[0];
	const forecast_desc = document.getElementsByClassName("forecast_desc")[0];
	const forecast_feel = document.getElementsByClassName("forecast_feel")[0];
	const forecast_humid = document.getElementsByClassName("forecast_humid")[0];
	const forecast_wind = document.getElementsByClassName("forecast_wind")[0];
	const forecast_rain = document.getElementsByClassName("forecast_rain")[0];
	const forecast_cloud = document.getElementsByClassName("forecast_cloud")[0];
	const forecast_snow = document.getElementsByClassName("forecast_snow")[0];

	// 간략 예보 배열
	const forecast = document.getElementsByClassName("forecast");
	const forecast_times = document.getElementsByClassName("forecast_time");
	const forecast_days = document.getElementsByClassName("forecast_day");
	const forecast_imgs = document.getElementsByClassName("forecast_img");
	const forecast_temps = document.getElementsByClassName("forecast_temp");

	// 좌표 정보 저장
	let lats = [];
	let lons = [];

	// 도로명 주소를 위도, 경도로 변환해서 받아오기
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

	// AJAX로 받아온 JSON 객체를 저장하는 배열
	const lists = new Array(lats.length);

	// list에서 지금 시간에 가장 가까운 인덱스를 찾고 저장하는데 쓰는 배열
	const minIdx = [];
	for (let i = 0; i < lats.length; i++) {
		minIdx.push(0);
	}

	function showDetail(idx) {
		for (let i = 0; i < forecast.length; i++) { 
			forecast[i].style.display = "flex";
		}
		forecast[idx].style.display = "none";
		const list = lists[select.value];
		const list_idx = (idx === 0) ? minIdx[select.value] : 6 + 4 * idx;
		const date = new Date(list[list_idx].dt_txt);
		forecast_date_main.innerText = date.getDate();
		forecast_day_main.innerText = days[date.getDay()];
		forecast_time_main.innerText = (idx === 0) ? "Now" : (list[list_idx].sys.pod === 'd') ? "6 AM" : "6 PM";
		forecast_img_main.src = "${pageContext.request.contextPath}/img/weather_icon/" + list[list_idx].weather[0].icon + ".png";
		forecast_img_main.style.display = "block";
		forecast_temp_main.innerText = list[list_idx].main.temp;
		forecast_desc.innerText = list[list_idx].weather[0].description;
		forecast_feel.innerText = "Feel: " + list[list_idx].main.feels_like + "°";
		forecast_humid.innerText = "Humidity: " + list[list_idx].main.humidity + "%";
		forecast_wind.innerText = "Wind: " + list[list_idx].wind.speed + " m/s";
		try {
			forecast_rain.innerText = "Rain: " + list[list_idx].rain["3h"];
		} catch (err) {
			forecast_rain.innerText = 'Rain: X';
		}
		forecast_cloud.innerText = "Cloud: " + list[list_idx].clouds.all + "%";
		try {
			forecast_snow.innerText = "Snow: " + list[list_idx].snow["3h"];
		} catch (err) {
			forecast_snow.innerText = 'Snow: X';
		}
	}

	function setForecastScreen(list) {
		const now = new Date();
		let date = new Date(list[0].dt_txt);
		let minDif = Math.abs(date - now);
		for (let i = 0; i < 8; i++) {
			date = new Date(list[i].dt_txt);
			const dif = Math.abs(date - now);
			if (dif < minDif) {
				minDif = dif;
				minIdx[select.value] = i;
			}
		}
		showDetail(0);
		forecast_times[0].innerText = "Now";
		forecast_days[0].innerText = days[now.getDay()].substring(0, 3);
		forecast_imgs[0].src = "${pageContext.request.contextPath}/img/weather_icon/" + list[minIdx[select.value]].weather[0].icon + ".png";
		forecast_imgs[0].style = "display: block";
		forecast_temps[0].innerText = list[minIdx[select.value]].main.temp + "°";
		for (let i = 10; i < 40; i += 4) {
			const date = new Date(list[i].dt_txt);
			const idx = (i - 6) / 4;
			forecast_days[idx].innerText = days[date.getDay()].substring(0, 3);
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