<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">
<!--쇼핑몰 글로벌 css-->
<link rel="stylesheet" href="<c:url value="/resources/css/community/community_global.css?ver=2"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/community/joinNotice/main.css?ver=1"/>">

<!--쇼핑몰 글로벌 아이콘 cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Document</title>
</head>
<body>
	<!--헤더-->
	<%@ include file="../header.jsp"%>

	<!--메인-->
	<main>
		<!-- 사이드 메뉴 -->
		<%@ include file="side.jsp"%>

		<div class="section">
			<div class="section_header">
				<li>글번호</li>
				<li>제목</li>
				<li>글쓴이</li>
				<li>지역</li>
				<li>모집인원</li>
				<li>출발일</li>
				<li>기간</li>
				<li>조회수</li>
				<li>마감여부</li>
			</div>

			<form class="section_notice">
				<div class="section_notice_main">
					<%@ include file="list.jsp"%>
				</div>

				<script>
					let camping_region = '<c:out value="${option.camping_region}"/>';
					let camping_recruitment = '<c:out value="${option.camping_recruitment}"/>';
					let camping_departure = '<c:out value="${option.camping_departure}"/>';
					let camping_period = '<c:out value="${option.camping_period}"/>';
					let camping_close = '<c:out value="${option.camping_close}"/>';
					let keyword = '<c:out value="${option.keyword}"/>';
				</script>

				<div class="section_notice_footer">
					<c:set var="camping_count" value="${count.camping_count}" />

					<p class="first_btn"><<</p>
					<div class="section_notice_footer_overflow">
						<div class="section_notice_footer_page"></div>
					</div>
					<p class="end_btn">>></p>

					<!-- 페이징 처리에 필요한 전체 게시글 갯수 -->
					<script>
						let camping_count = '<c:out value="${camping_count}"/>';
					</script>

					<input type="button" value="글쓰기" class="write_btn" onclick="location.href='input'">
				</div>
			</form>
		</div>
	</main>

	<!--푸터-->
	<%@ include file="../footer.jsp"%>

	<script src="<c:url value="/resources/js/community/joinNotice/main.js?ver=1"/>"></script>

</body>
</html>