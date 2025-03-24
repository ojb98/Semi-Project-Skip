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

    //메인이미지 필수선택 여부 확인
    let mainImg = document.getElementById("mainImg");
    if (mainImg.files.length === 0) {
        alert("메인 이미지를 선택해주세요.");
        mainImg.focus();
        return false;
    }

    //모든 검사를 통과하면 폼 제출
    document.getElementById("insertForm").submit();
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