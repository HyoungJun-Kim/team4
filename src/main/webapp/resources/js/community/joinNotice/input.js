const campsite_search = document.querySelector(".campsite_search"); // 캠핑장 찾기 모달 팝업 버튼
const modal = document.querySelector(".section_header_back"); // 캠핑장 찾기 모달
const modal_search = document.querySelector(".modal_search"); // 모달에서 검색 버튼
const modal_submit = document.querySelector(".modal_submit"); // 모달 확인 버튼
const modal_close = document.querySelector(".modal_close"); // 모달 닫기 버튼
const search_category = document.querySelector(".section_header_modal_category"); //모달 카테고리
const search_region = document.querySelector(".search_region"); //모달 지역 검색
const search_keyword = document.querySelector(".search_keyword"); //모달 검색 키워드
const search_result = document.querySelector(".section_header_modal_result_box"); // 모달 검색 시 내용이 표시될 곳

document.addEventListener('keydown', function(event) { // 엔터키 이벤트 막기
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);

console.log(camping_cruitment);

campsite_search.addEventListener("click",function(){ //캠핑장 찾기 모달 팝업
	modal.style.display = "block";
	document.body.style= "overflow: hidden";
})

modal_search.addEventListener("click",function(){ // 캠핑장 검색
	let campsite_search = {
			search_category : search_category.value,
			search_region : search_region.value,
			search_keyword : search_keyword.value
		};
		console.log(campsite_search);
		$.ajax({
			type : "POST",
			url : "/community/joinNotice/campsite",
			dataType : "text",
			contentType : "application/json",
			data : JSON.stringify(campsite_search),
			success : function(data) {
				$(search_result).html(data);
			},
			error : function(data) {
				console.log(data);
			}
		});
})

modal_submit.addEventListener("click",function(){ //모달 창 확인
	let list = document.getElementsByName("list");
	for(let i=0; i<list.length; i++){
		if (list[i].checked){
			document.getElementsByName("camping_campsite")[0].value = list[i].id;
		}
	}
	console.log(list);
	modal.style.display = "none";
	document.body.style= "overflow: auto";
})

modal_close.addEventListener("click",function(){ //모달 창 닫기
	modal.style.display = "none";
	document.body.style= "overflow: auto";
})


