let camping_id = $('.camping_id').val(); // ajax 통신에 이용할 게시판 번호
let user_id = document.querySelector('#user_id').value; // 현재 접속중인 유저 아이디
let s_count = 5; // view more에 사용할 변수
const get_reply_count = document.querySelector(".reply_count"); // 댓글수가 표시되는 부분
const container = document.querySelector('.section_map'); //지도를 담을 영역의 DOM 레퍼런스

var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(latitude, longitude); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

//댓글 달기
$(function() {
	$('.section_footer_btnArea_btn').click(function() {
		let comment = $('.section_footer_commentInput').val();
		if (comment == "" || comment == null) {
			alert("내용을 입력하세요");
		} else {  
			
			let reply_info = {
				id : user_id,
				comment : comment,
				camping_id : camping_id
			};
			$.ajax({
				type : "POST",
				url : "/community/joinNotice/reply_input",
				dataType : "text",
				contentType : "application/json",
				data : JSON.stringify(reply_info),
				success : function(data) {
					$('.section_footer_commentList').prepend(data);
					get_reply_count.textContent = input_reply_count;
				},
				error : function(data) {
					console.log(data);
				}
			});
			document.querySelector(".section_footer_commentInput").value = "";
		}
	});
});

// 댓글 view more
$(function() {
	$('.section_footer_commentList_viewMore_btn').click(function() {
		let view_more = {
				camping_id : camping_id,
				s_count : s_count,
		};
		$.ajax({
			type : "POST",
			url : "/community/joinNotice/view_more",
			dataType : "text",
			contentType : "application/json",
			data : JSON.stringify(view_more),
			success : function(data) {
				$('.section_footer_commentList').append(data);
			},
			error : function(data) {
				console.log(data);
			}
		});
		s_count = s_count+5;
		if(s_count>reply_count || s_count==reply_count){
			document.querySelector(".section_footer_commentList_viewMore").style.display = "none";
		}
	})
})
