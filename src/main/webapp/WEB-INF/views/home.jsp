<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">
<title>홈</title>

</head>

<body>
	<c:if test="${sessionScope.login_id ne null}">
		${sessionScope.login_id } 님 
	</c:if>
	<h1>환영합니다.</h1>
	<a href="shop">쇼핑몰 일반</a>
	<a href="shop/admin">쇼핑몰 관리자</a>
	<a href="community/main">커뮤니티</a>
	<a href="map">지도 테스트</a>
	<a href="agree">회원가입</a>
	
	<c:if test="${sessionScope.login_id ne null}">
		<a href="logout">로그아웃</a>
	</c:if>
	<c:if test="${sessionScope.login_id eq null}">
		<a href="login">로그인</a>
	</c:if>
	
</body>
</html>