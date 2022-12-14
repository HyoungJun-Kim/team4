<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 글로벌 -->
<link rel="stylesheet" href="/resources/css/global.css">
<!--커뮤니티 글로벌 css-->
<link rel="stylesheet" href="<c:url value="/resources/css/community/community_global.css?ver=1"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/community/main.css?ver=1"/>">
<!--쇼핑몰 글로벌 아이콘 cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">

<title>Document</title>
</head>
<body>
	<!--헤더-->
	<%@ include file="header.jsp"%>

	<!--메인-->
	<main>
		<!-- 화제의 사진 -->
		<div class="recommendation">
			<div class="recommendation_header">
				<h1>
					화제의
					<span>사진</span>
				</h1>
				<h3>+ 더보기</h3>
			</div>

			<div class="recommendation_main">
				<div class="recommendation_main_imgBox">
					<div class="recommendation_img">
						<img src="/resources/img/community/recommendation.jpg" alt="">
					</div>
					<div class="recommendation_img">
						<img src="/resources/img/community/recommendation.jpg" alt="">
					</div>
					<div class="recommendation_img">
						<img src="/resources/img/community/recommendation.jpg" alt="">
					</div>
					<div class="recommendation_img">
						<img src="/resources/img/community/recommendation.jpg" alt="">
					</div>
					<div class="recommendation_img">
						<img src="/resources/img/community/recommendation.jpg" alt="">
					</div>
				</div>
			</div>

		</div>

		<section>
			<div class="section1">
				<!-- 자유게시판 -->
				<div class="section1_noticeBoard">
					<div class="section1_noticeBoard_header">
						<h1>
							자유게시판
							<span>Top 10</span>
						</h1>
						<h3>+ 더보기</h3>
					</div>

					<div class="section1_noticeBoard_main">
						<div class="section1_noticeBoard_content"></div>
					</div>
				</div>
				<!-- 공지사항 -->
				<div class="section1_notice">
					<div class="section1_notice_header">
						<h1>공지사항</h1>
						<h3>+ 더보기</h3>
					</div>

					<div class="section1_notice_main">
						<div class="section1_notice_content"></div>
					</div>
				</div>
			</div>

			<div class="section2">
				<!-- 이벤트,프로모션 -->
				<div class="section2_event">
					<div class="section2_event_header">
						<h1>
							이벤트
							<span>& 프로모션</span>
						</h1>
					</div>

					<div class="section2_event_main">
						<div class="section2_event_content"></div>
					</div>
				</div>
				<!-- 날씨 정보 -->
				<div class="section2_map">
					<div class="section2_map_header">
						<h1>날씨정보</h1>
					</div>

					<div class="section2_map_main">
						<div class="section2_map_content"></div>
					</div>
				</div>
				<!-- 실시간 채팅 -->
				<div class="section2_chat">
					<div class="section2_chat_header">
						<h1>
							실시간
							<span>채팅</span>
						</h1>
						<h3>참여</h3>
					</div>

					<div class="section2_chat_main">
						<div class="section2_chat_content"></div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!--푸터-->
	<%@ include file="footer.jsp"%>

</body>

<script src="<c:url value="/resources/js/community/main.js?ver=1"/>"></script>
</html>