function checkData(event) {
	event.preventDefault(); 

	//필수 입력필드 목록
	const fields = [
		{ id: "roomName", message: "객실명을 입력해주세요." },
		{ id: "roomQuantity", message: "객실 수를 입력해주세요.", isNumber: true },
		{ id: "maxGuests", message: "최대 숙박 인원을 입력해주세요.", isNumber: true },
		{ id: "price", message: "1박당 가격을 입력해주세요.", isNumber: true },
	];

	//유효성 검사
	for (let field of fields) {
		let element = document.getElementById(field.id);
		let value = element.value.trim();

		if (value === "" || (field.isNumber && value <= 0)) {
			alert(field.message);
			element.focus();
			return false;
		}
	}

	document.getElementById("roomForm").submit(); // 폼 제출
}