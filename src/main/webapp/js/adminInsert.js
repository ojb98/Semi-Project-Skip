//전화번호 중복검사 결과 (true면 사용 가능)
var isPhoneValid = false;
	
function checkData(event) {
    event.preventDefault(); // 기본 폼 제출 방지

    // 필수 입력 필드 목록
    const fields = [
        { id: "name", message: "상호명을 입력해주세요." },
        { id: "phone", message: "전화번호를 입력해주세요." },
        { id: "location", message: "주소를 입력해주세요." }
    ];

    // 유효성 검사
    for (let field of fields) {
        let element = document.getElementById(field.id);
        let value = element.value.trim();
        if (value === "") {
            alert(field.message);
            element.focus();
            return false;
        }
    }
    
    // 전화번호 중복 검사 결과 체크
    if (!isPhoneValid) {
        alert("전화번호 중복검사를 완료해 주세요.");
        return false;
    }


    // 메인이미지 필수선택 여부 확인
    let mainImg = document.getElementById("mainImg");
    if (mainImg.files.length === 0) {
        alert("메인 이미지를 선택해주세요.");
        mainImg.focus();
        return false;
    }
    
    //추가 이미지 1 필수 선택 여부 확인
    let subImg1 = document.getElementById("subImg1");
    if (subImg1.files.length === 0) {
        alert("추가 이미지1을 선택해주세요.");
        subImg1.focus();
        return false;
    }

    //추가 이미지 2 필수 선택 여부 확인
    let subImg2 = document.getElementById("subImg2");
    if (subImg2.files.length === 0) {
        alert("추가 이미지2를 선택해주세요.");
        subImg2.focus();
        return false;
    }

    //추가 이미지 3 필수 선택 여부 확인
    let subImg3 = document.getElementById("subImg3");
    if (subImg3.files.length === 0) {
        alert("추가 이미지3을 선택해주세요.");
        subImg3.focus();
        return false;
    }


    // 모든 검사를 통과하면 폼 제출
    document.getElementById("insertForm").submit();
}

// 전화번호 자동 하이픈 삽입 함수
function formatPhoneNumber(input) {
    let value = input.value.replace(/[^0-9]/g, ""); // 숫자만 남기기
    if (value.length > 3 && value.length <= 7) {
        input.value = value.replace(/(\d{3})(\d{1,4})/, "$1-$2");
    } else if (value.length > 7) {
        input.value = value.replace(/(\d{3})(\d{4})(\d{1,4})/, "$1-$2-$3");
    } else {
        input.value = value;
    }
}

// 전화번호 중복검사 AJAX 함수
function phoneCheck() {
	let phone = document.getElementById("phone").value.trim();
	if (phone === "") {
		alert("전화번호를 입력해주세요.");
		return;
	}
	let xhr = new XMLHttpRequest();
	xhr.open("GET", contextPath + "/admin/phoneCheckAll?phone=" + encodeURIComponent(phone), true);
	xhr.onreadystatechange = function() {
	if (xhr.readyState === 4 && xhr.status === 200) {
		let response = JSON.parse(xhr.responseText);
		let resultSpan = document.getElementById("phoneCheckResult");
		if (response.isCheck) {
			resultSpan.innerHTML = "<span style='color:red;'>이미 사용중인 전화번호입니다.</span>";
			isPhoneValid = false;
		} else {
			resultSpan.innerHTML = "<span style='color:green;'>사용 가능한 전화번호입니다.</span>";
			isPhoneValid = true;
			}
		}
	};
	xhr.send();
}

// 폼 내에서 Enter 키 입력시 기본 동작(폼 제출) 방지
document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("insertForm");
    if(form) {
        form.addEventListener("keydown", function(event) {
            if(event.key === "Enter") {
                event.preventDefault();
                return false;
            	}
        });
    }
});


