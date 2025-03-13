//contextPath 변수
const contextPath = "/Semi_Project_Skip/";


function getList(pageNum) {
	console.log("함수호출 확인, pageNum:" + pageNum);
  const xhr = new XMLHttpRequest();
  xhr.onload = function () {
   const reviewList = document.querySelector(".review_list");
    
    const resp = xhr.responseText;
 //   alert(resp);
    const json = JSON.parse(resp);
    // console.log(json + "호출확인"); 확인됨

    json.list.forEach(function (reviewDto) {
      
      const reviews = json.list;
      // console.log("reviews:" + reviews); 확인됨
      
      const review_item = document.createElement("li");
      review_item.className = "review_item";
	  
      reviewList.appendChild(review_item);

      
  })
}
  xhr.open('get', `${contextPath}/review/list?pageNum=${pageNum}`, true);
  xhr.send();
}
getList(1); //함수 호출
