<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			
			<c:set var="reply_count" value="${reply_count.camping_reply_count}" />
					<script>
						let input_reply_count = '<c:out value="${reply_count}"/>';
					</script>
			
			<div class="section_footer_commentList_comment_btnArea">
				<input type="button"
					class="section_footer_commentList_comment_btnArea_likebtn"
					value="좋아요"> <input type="button"
					class="section_footer_commentList_comment_btnArea_dislikebtn"
					value="싫어요">
			</div>
		</div>

