<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resortAdminFacilityInsert.css">

<script type="text/javascript">
	function checkData(event){
		event.preventDefault();
		const fname=document.getElementById("facility_name").value.trim();
		if(fname===""){
			document.getElementById("facility_name").focus();
			return false;
		}
		
		//AJAX로 시설 이름 중복 확인
        checkFacility(fname, function(isCheck) {
            if (isCheck) {
                alert("이미 존재하는 시설 이름입니다. 다른 이름을 입력해주세요.");
                document.getElementById("facility_name").focus();
            } else {
                document.getElementById("facilityForm").submit(); // 중복이 없으면 폼 제출
            }
        });

        return false;
    }

    //AJAX 요청: 시설이름 중복확인
    function checkFacility(fname, callback) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "${pageContext.request.contextPath}/adminFacility/check?facility_name=" + encodeURIComponent(fname), true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState===4 && xhr.status==200) {
                callback(xhr.responseText === "true"); // 응답이 "true"이면 중복됨
            }
        };
        xhr.send();
    }
</script>

</head>
<body>

<!-- header -->
<jsp:include page="/resortAdmin/header.jsp" />


<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
 	<h1>시설 등록</h1>
 	<div class="form-container">
	<form id="facilityForm" action="${pageContext.request.contextPath }/adminFacility/insert" method="post" onsubmit="return checkData(event)">
		<label for="type_id">시설 유형 : </label>
		<select name="type_id" id="type_id">
			<option value="1">편의시설</option>
			<option value="2">프런트 데스트 서비스</option>
			<option value="3">레저/건강</option>
			<option value="4">식사/음료</option>
			<option value="5">청소 서비스</option>
			<option value="6">비즈니스 서비스</option>
			<option value="7">교통/주차</option>
			<option value="8">장애인 편의시설</option>
			<option value="9">안전/보안</option>
			<option value="10">객실시설</option>
			<option value="11">일반시설</option>
			<option value="12">인기시설</option>
		</select>
		<br>
		<label for="facility_name">시설이름 : </label><input type="text" name="facility_name" id="facility_name"><br>
		<input type="submit" value="등록" class="submit-btn"> 
	</form>
	</div>
	
</main>
</body>
</html>