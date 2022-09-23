let board_id = $('.board_id').val(); // ajax 통신에 이용할 게시판 번호
let user_id = document.querySelector('#user_id').value; // 현재 접속중인 유저 아이디
let s_count = 5; // view more에 사용할 변수
const get_reply_count = document.querySelector(".reply_count"); // 댓글수가 표시되는 부분

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
				board_id : board_id
			};
			$.ajax({
				type : "POST",
				url : "/community/freeNotice/reply_input",
				dataType : "text",
				contentType : "application/json",
				data : JSON.stringify(reply_info),
				success : function(data) {
					$('.section_footer_commentList').prepend(data);
					console.log(input_reply_count);
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
				board_id : board_id,
				s_count : s_count,
		};
		$.ajax({
			type : "POST",
			url : "/community/freeNotice/view_more",
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
