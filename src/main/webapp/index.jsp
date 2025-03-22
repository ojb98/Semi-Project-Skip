<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SKI:P</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage.css">
</head>
<body>
<!-- header -->
<jsp:include page="/header.jsp" />

<!-- main -->
<main>
	<div class="slide">
		<div>
			<h1>전국의</h1>
			<h1>스키장 렌탈</h1>
			<h1>한 곳에서 모아보기!</h1>
		</div>
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
								<!-- 혼자 먼저 로딩되는 것을 방지하기 위한 숨김 설정 -->
								<div class="temp_symbol" style="display: none;">
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
					<div class="forecast" style="display: none;">
						<div class="forecast_day"></div>
						<div class="forecast_time"></div>
						<img class="forecast_img" width="100px" height="100px" hidden>
						<div class="forecast_temp"></div>
					</div>
					<c:forEach var="i" begin="1" end="8">
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
	</div>
</main>

<!-- footer -->
<jsp:include page="/footer.jsp" />

<script>
	const days = ['일', '월', '화', '수', '목', '금', '토'];

	const select = document.getElementsByTagName("select")[0];

	// 상세 예보
	const forecast_wrapper = document.getElementsByClassName("forecast_wrapper")[0];
	const forecast_date_main = document.getElementsByClassName("forecast_date_main")[0];
	const forecast_day_main = document.getElementsByClassName("forecast_day_main")[0];
	const forecast_time_main = document.getElementsByClassName("forecast_time_main")[0];
	const forecast_img_main = document.getElementsByClassName("forecast_img_main")[0];
	const forecast_temp_main = document.getElementsByClassName("forecast_temp_main")[0];
	const temp_symbol = document.getElementsByClassName("temp_symbol")[0];
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

	// (동기 통신) 도로명 주소를 위도, 경도로 변환해서 받아오기
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

	// AJAX로 받아온 예보 JSON 객체를 저장하는 배열
	const lists = new Array(lats.length);

	// list에서 지금 시간에 가장 가까운 인덱스를 찾고 저장하는데 쓰는 배열
	const minIdx = [];
	for (let i = 0; i < lats.length; i++) {
		minIdx.push(0);
	}

	// 특정 예보를 상세하게 보여주는 함수
	function showDetails(idx, list_idx) {
		for (let i = 0; i < forecast.length; i++) { 
			forecast[i].style.display = "flex";
		}
		forecast[idx].style.display = "none";
		const list = lists[select.value];
		let date;
		if (idx === 0) {
			date = new Date();
			forecast_time_main.innerText = "Now";
		} else {
			date = new Date(list[list_idx].dt_txt);
			forecast_time_main.innerText = (list[list_idx].sys.pod === 'd') ? "6 AM" : "6 PM";
		}
		forecast_date_main.innerText = date.getDate();
		forecast_day_main.innerText = days[date.getDay()] + "요일";
		forecast_img_main.src = "${pageContext.request.contextPath}/img/weather_icon/" + list[list_idx].weather[0].icon + ".png";
		forecast_img_main.style.display = "block";
		forecast_temp_main.innerText = list[list_idx].main.temp;
		forecast_desc.innerText = list[list_idx].weather[0].description;
		forecast_feel.innerText = "체감: " + list[list_idx].main.feels_like + "°";
		forecast_humid.innerText = "습도: " + list[list_idx].main.humidity + "%";
		forecast_wind.innerText = "바람: " + list[list_idx].wind.speed + "m/s";
		try {
			forecast_rain.innerText = "비: " + list[list_idx].rain["3h"] + "mm/h";
		} catch (err) {
			forecast_rain.innerText = '비: X';
		}
		forecast_cloud.innerText = "구름: " + list[list_idx].clouds.all + "%";
		try {
			forecast_snow.innerText = "눈: " + list[list_idx].snow["3h"] + "mm/h";
		} catch (err) {
			forecast_snow.innerText = '눈: X';
		}
		temp_symbol.style.display = "flex";
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
		showDetails(0, minIdx[select.value]);
		forecast[0].addEventListener('click', () => showDetails(0, minIdx[select.value]));
		forecast_times[0].innerText = "Now";
		forecast_days[0].innerText = days[now.getDay()].substring(0, 3);
		forecast_imgs[0].src = "${pageContext.request.contextPath}/img/weather_icon/" + list[minIdx[select.value]].weather[0].icon + ".png";
		forecast_imgs[0].style = "display: block";
		forecast_temps[0].innerText = list[minIdx[select.value]].main.temp + "°";
		
		// 내일 6시 부터 예보를 받아오기 위한 오프셋
		let offset;
		for (let i = 2; i < 11; i++) {
			if (new Date(list[i].dt_txt).getHours() === 6) {
				offset = i - 4; // 밑 for 문에서 i가 1부터 시작하기 때문에 i - 4를 저장
				break;
			}
		}
		
		// 내일 부터 4일간의 날씨 정보를 각각 오전 6시, 오후 6시를 기준으로 가져온다.
		for (let i = 1; i < 9; i++) {
			const list_idx = offset + 4 * i;
			const date = new Date(list[list_idx].dt_txt);
			forecast[i].addEventListener('click', () => showDetails(i, list_idx));
			forecast_days[i].innerText = days[date.getDay()].substring(0, 3);
			if (list[list_idx].sys.pod === "d") {
				forecast_times[i].innerText = "6 AM";
			} else {
				forecast_times[i].innerText = "6 PM";
			}
			forecast_imgs[i].src = "${pageContext.request.contextPath}/img/weather_icon/" + list[list_idx].weather[0].icon + ".png";
			forecast_imgs[i].style = "display: block";
			forecast_temps[i].innerText = list[list_idx].main.temp + "°";
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