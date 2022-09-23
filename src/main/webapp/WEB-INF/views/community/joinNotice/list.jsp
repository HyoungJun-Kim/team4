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
	<li>${data.camping_id}</li>
	<li><a href="/community/joinNotice/detail_user?camping_id=${data.camping_id}">${data.camping_title} [${data.reply_count}]</a></li>
	<li>${data.member_id}</li>
	<li>${data.camping_region}</li>
	<li>${data.camping_applicant}/${data.camping_recruitment}</li>
	<li><fmt:formatDate value="${data.camping_departure}" pattern="yy-MM-dd" /></li>
	<li>${data.camping_period}</li>
	<li>${data.camping_hit}</li>
	<li>${data.camping_close}</li>
</div>
</c:forEach>