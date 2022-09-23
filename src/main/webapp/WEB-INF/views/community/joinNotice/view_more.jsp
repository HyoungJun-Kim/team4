<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="<c:url value="/resources/css/community/community_global.css?ver=2"/>">
<!--쇼핑몰 글로벌 아이콘 cdn-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Document</title>
</head>

<body>
	<c:forEach var="data" items="${data}">
		<div class="section_footer_commentList_comment">
			<div class="section_footer_commentList_comment_count">
				<i class="xi-thumbs-up"><span> : 50</span></i> <i
					class="xi-thumbs-down"><span> : 2</span></i>
			</div>
			<p>${data.member_id}</p>
			<P>
				<fmt:formatDate value="${data.camping_reply_regdate}"
					pattern="yy-MM-dd HH:mm:ss" />
			</P>
			<div class="section_footer_commentList_comment_text">
				<p>${data.camping_reply_text}</p>
			</div>
			<div class="section_footer_commentList_comment_btnArea">
				<input type="button"
					class="section_footer_commentList_comment_btnArea_likebtn"
					value="좋아요"> <input type="button"
					class="section_footer_commentList_comment_btnArea_dislikebtn"
					value="싫어요">
			</div>
		</div>
	</c:forEach>
</body>

</html>
