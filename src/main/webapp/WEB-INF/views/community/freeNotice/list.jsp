<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<c:if test="${empty data}">
		<div class=not_found>
			<i class="xi-search side_nav_search_btn"></i>
			<h1>검색 결과가 없습니다</h1>
		</div>
	</c:if>
	
	<c:forEach var="data" items="${data}">
		<div class="section_notice_main_content">
			<li>${data.board_id}</li>
			<li>[<span class="tag_id">${data.board_tag_name}</span>]</li>
			<li class="board_title">
			<a href="/community/freeNotice/detail_user?board_id=${data.board_id}">${data.board_title} [${data.reply_count}]</a>
			</li>
			<li>${data.member_id}</li>
			<li><fmt:formatDate value="${data.board_regdate}" pattern="yy-MM-dd" /></li>
			<li>${data.board_hit}</li>
			<li>${data.board_recommend}</li>
		</div>
	</c:forEach>
	

	
	