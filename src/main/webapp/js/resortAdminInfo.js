document.addEventListener("DOMContentLoaded", function () {
    // 초기 리조트 상세 정보 로드
    loadResortDetail();

    // 카테고리 버튼 이벤트 추가
    document.getElementById("resortInfoBtn").addEventListener("click", loadResortDetail);
    document.getElementById("facilityInfoBtn").addEventListener("click", loadFacilityDetail);
    document.getElementById("roomInfoBtn").addEventListener("click", loadRoomDetail);
});

//리조트 상세 정보 불러오기
function loadResortDetail() {
    let resortId = getResortId();
    fetch(`/resort/detail?resort_id=${resortId}`)
        .then(response => response.text())
        .then(data => {
            document.getElementById("content").innerHTML = data;
        })
        .catch(error => console.error("Error:", error));
}

//시설 상세 정보 불러오기
function loadFacilityDetail() {
    let resortId = getResortId();
    fetch(`/resort/facility?resort_id=${resortId}`)
        .then(response => response.text())
        .then(data => {
            document.getElementById("content").innerHTML = data;
        })
        .catch(error => console.error("Error:", error));
}

//객실 상세 정보 불러오기 (페이지네이션 적용)
function loadRoomDetail(page = 1) {
    let resortId = getResortId();
    fetch(`/resort/room?resort_id=${resortId}&page=${page}`)
        .then(response => response.text())
        .then(data => {
            document.getElementById("content").innerHTML = data;
        })
        .catch(error => console.error("Error:", error));
}

//현재 리조트 ID 가져오기
function getResortId() {
    let urlParams = new URLSearchParams(window.location.search);
    return urlParams.get("resort_id");
}