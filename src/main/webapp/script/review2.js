/**
 * 
 */

console.log("파일 정상 로드");

window.List2 = function() {
  console.log("페이지함수");
}

//function getList(pageNum)

function getList(pageNum) {
	console.log("함수호출 확인, pageNum:" + pageNum);
  const xhr = new XMLHttpRequest();
  xhr.onload = function () {
    const reviewList = document.querySelector(".review_list");
    
    const resp = xhr.responseText;
    const json = JSON.parse(resp);
    console.log(json + "호출확인");

    json.list.forEach(function (reviewList) {
      const review_item = document.createElement("li");
      review_item.className = "review_item";
      const reviews = json.list;


      reviews.forEach(function (review) {
        /* 평점 별 */
        let starts = "";
        for (let i = 0; i < review.rating; i++) {
          starts += `<i class="fa fa-star"></i>`;
        }

        /* 리뷰이미지 */
        let imgTag = "";
        if (review.reviewImg) {
          imgTag = `<img src=${contextPath}/reviewImgs/${review.reviewImg}>`;
        }

        review_item.innerHTML = `
          <div class= "user_review">
            <div class= "item_content">
              <div class= "rating_box">
                <div class= "star_box">
                  ${starts}
                </div>
                <span class="rating_number">${review.rating} 점</span>
              </div>
              <div class="user_box">
                <p class="user_id">${review.uuid}</p>
                <p class="created_at">${review.createdAt}</p>
                <div class="content">
                  <p>${review.resortComment}</p>
                </div>
              </div>
              <div class="item_img">
                ${imgTag}
              </div>
            </div>
          </div>
          <div class="item_ctrl">
            <a href="${contextPath}/jsp/update?reviewId=${review.reviewId}">수정</a>
            <a href="${contextPath}/jsp/delete?reviewId=${review.reviewId}" onclick = "return confirm ('정말 삭제하시겠습니까?');">삭제</a>	                  	
          </div>
        `
      })
    })
    //페이징
    const page_btn = document.querySelector(".page_btn");

    let str = "<div>";

    //이전 버튼
    if (json.startPage > 10) {
      str += "<a href='javascript:getList(" + (json.startPage - 1) + ")'><i class='fa fa-angle-left'></i>이전</a>";
    }

    //페이지 숫자
    for (let i = json.startPage; i <= json.endPage; i++) {
      if (i == json.pageNum) {
        str += "<a href='javascript:getList(" + i + ")' class='active'>" + i + "</a>";
      } else {
        str += "<a href='javascript:getList(" + i + ")'>i</a>";
      }
    }

    //다음 버튼
    if (json.endPage < json.pageCount) {
      str += "<a href='javascript:getList(" + (json.endPage + 1) + ")'<i class='fa fa-angle-right'></i>다음</a>";
    }

    str += "</div>"
    page_btn.innerHTML += str;
  }
  xhr.open('get', `${contextPath}/review/list?pageNum=${pageNum}`, true);
  xhr.send();
}
getList(1);

      // const div = document.createElement("div");
      // const str = ` "리뷰아이디:" + ${reviewDto.reviewId} + <br> +
      // "결제아이디:" + ${reviewDto.paymentId} + <br> +
      // "아이디:" + ${reviewDto.uuid} + <br> +
      // "리조트아이디:" + ${reviewDto.resortId} + <br> +
      // "별점:" + ${reviewDto.rating} + <br> +
      // "리뷰내용:" + ${reviewDto.resortComment} + <br> +
      // "리뷰이미지:" + ${reviewDto.reviewImg} + <br>
      // `
      // div.innerHTML=str;
      // div.className="comm";
      // reviewList.appendChild(div);
