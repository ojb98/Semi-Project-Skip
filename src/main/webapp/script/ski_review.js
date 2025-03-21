console.log("스크립트 파일 정상 로드 확인");


//최신순, 평점 높은순, 평점 낮은순 선택시 색상 변화
const filterBtns = document.querySelectorAll(".filter_btn");

filterBtns.forEach(function (btn) {
    btn.addEventListener("click", function () {
        // 모든 버튼에서 active 제거
        filterBtns.forEach(btn => btn.classList.remove("active"));
        // 현재 클릭한 버튼에 active 추가
        this.classList.add("active");
    });
});



// contextPath 변수
const contextPath = "/Semi_Project_Skip/";


//리뷰 작성(insert) 팝업
function popup() {
	console.log("popup함수 작동");
    var url = "${pageContext.request.contextPath}/jsp/reviewInsert";
    var name = "reviewPopup";
    var option = "width=600,height=600,top=100,left=100,location=no";

    window.open(url, name, option);
}

//리뷰 수정 팝업
function updatePopup(review_id) {
	console.log("리뷰 수정 팝업 호출 확인:", review_id);
	
	const url = `${contextPath}/jsp/update?review_id=${review_id}`;
	const name = "updatePopup";
	const option = "width=500,height=500,top=100,left=100,location=no";
	
	const updatePop = window.open(url, name, option);
	
	if(!updatePop) {
		alert("팝업이 차단되었습니다. 팝업 차단을 해제 해주세요.");
	}
}





