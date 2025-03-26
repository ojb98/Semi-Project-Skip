// 전역 변수: 전화번호 중복 검사 결과 (true면 사용 가능)
var isPhoneValid = true; // 업데이트 시 기본값은 true (변경 없으면 그대로 사용)

function checkData(event) {
    event.preventDefault(); //기본 폼 제출 방지

    //필수 입력 필드 목록
    const fields = [
        { id: "name", message: "상호명을 입력해주세요." },
        { id: "phone", message: "전화번호를 입력해주세요." },
        { id: "location", message: "주소를 입력해주세요." }
    ];

    //유효성 검사
    for (let field of fields) {
        let element = document.getElementById(field.id);
        let value = element.value.trim();

        if (value === "") {
            alert(field.message);
            element.focus();
            return false;
        }
    }
    
    //폰 입력의 원본 값을 비교하여 변경이 없으면 중복검사를 통과한 것으로 처리
    let phoneInput = document.getElementById("phone");
    let currentPhone = phoneInput.value.trim();
    let originalPhone = phoneInput.getAttribute("data-original");
    if (currentPhone === originalPhone) {
        isPhoneValid = true;
    }
    
    // 전화번호 중복 검사 결과 체크 (변경된 경우 중복체크 필요)
    if (!isPhoneValid) {
        alert("전화번호 중복검사를 완료해 주세요.");
        return false;
    }

    //모든 검사를 통과하면 폼 제출
    document.getElementById("updateForm").submit();
}

//전화번호 자동 하이픈 삽입 함수
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

// 전화번호 입력 변경 시 호출하는 함수
// 원본 값과 다르면 isPhoneValid를 false로 재설정하여 중복 검사를 요구함.
function phoneInputChanged(input) {
    formatPhoneNumber(input);
    let current = input.value.trim();
    let original = input.getAttribute("data-original");
    if (current !== original) {
        isPhoneValid = false;
        // 중복 검사 결과 영역 초기화
        document.getElementById("phoneCheckResult").innerHTML = "";
    } else {
        isPhoneValid = true;
    }
}

// AJAX를 이용한 전화번호 중복 검사 함수 (변경된 경우에만 호출)
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
    const form = document.getElementById("updateForm");
    if(form) {
        form.addEventListener("keydown", function(event) {
            if(event.key === "Enter") {
                event.preventDefault();
                return false;
            	}
        });
    }
});
