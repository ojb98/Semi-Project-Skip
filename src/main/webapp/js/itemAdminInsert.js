function checkData(event) {
    event.preventDefault(); // 기본 폼 제출 방지


    // 필수 입력 필드 목록
    const fields = [
        { id: "itemName", message: "장비이름을 입력해 주세요." },
        { id: "itemDetail", message: "장비상세를 입력해 주세요." },
        { id: "quantity", message: "총 장비수량을 입력해 주세요." }
    ];


    // 필수 입력 필드 유효성 검사
    for (let field of fields) {
        const element = document.getElementById(field.id);
        if (!element || element.value.trim() === "") {
            alert(field.message);
            element.focus();
            return false;
        }
    }


    // 파일 입력 필드 검사 (장비 이미지)
    const itemImg = document.getElementById("itemImg");
    if (!itemImg || itemImg.files.length === 0) {
        alert("장비 이미지를 선택해 주세요.");
        itemImg.focus();
        return false;
    }


    //라디오 버튼 선택 여부 검사 (장비 카테고리)
    const categorySelected = document.querySelector('input[name="category_id"]:checked');
    if (!categorySelected) {
        alert("장비 카테고리를 선택해 주세요.");
        return false;
    }


    //모든 검사를 통과하면 폼 제출
    document.getElementById("itemInsertForm").submit();
}
