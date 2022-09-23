<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- �۷ι� css -->
<link rel="stylesheet" href="/resources/css/global.css">
<link rel="stylesheet" href="/resources/css/shop/draw_admin.css">
<title>Document</title>
</head>

<body>
	<!-- ��� -->
	<jsp:include page="header.jsp" />

	<main>
		<div class="draw_container">
			<div class="">
				<div class="section1">
					<h1>
						Camping
						<span> Draw</span>
					</h1>
					<div class="section1_img">
						<img src="/resources/img/shop/��Ű��ο�.png" alt="">
					</div>
				</div>
				<div class="section2">
					<div class="section2-top">
						<span>��ο� ���</span>
						<button id="drawRegistBtn">
							<a href="/shop/draw_admin_add">�̺�Ʈ ����ϱ�</a>
						</button>
					</div>

					<div class="section2-bottom">
						<!--foreach �ݺ� �����-->
						<c:forEach var="row" items="${list}">
							<div class="section2_img">
								<!--�̺�Ʈ �̹���-->
								<img src="" alt="">
							</div>
							<div class="section2_font">
								<!--�̺�Ʈ �ؽ�Ʈ-->
								<div class="font_top">
									<h1>[���� �̺�Ʈ] �̺�Ʈ3</h1>
									<!--�̺�Ʈ ����-->
									<div class="adminBtnsContainer">
										<input type="button" value="����" class="adminBtns">
										<input type="button" value="����" class="adminBtns">
									</div>
								</div>
								<div class="font_bottom">
									<table>
										<tbody>
											<tr>
												<td>��ǰŰ</td>
												<td>${row.draw_id}</td>
											</tr>
											<tr>
												<td>��ǰ ����</td>
												<td>${row.draw_title}</td>
											</tr>
											<tr>
												<td>����</td>
												<td>${row.draw_price}</td>
											</tr>
											<tr>
												<td>�ο�</td>
												<td>${row.draw_reqruit}</td>
											</tr>
											<tr>
												<td>�̺�Ʈ ������</td>
												<td>${row.draw_event_start_date}</td>
											</tr>
											<tr>
												<td>�̺�Ʈ ������</td>
												<td>${row.draw_event_end_date}</td>

											</tr>
											<tr>
												<td>���� ������</td>
												<td>${row.draw_pur_start_date}</td>

											</tr>
											<tr>
												<td>���� ������</td>
												<td>${row.draw_pur_end_date}</td>

											</tr>
											<tr>
												<td>�ڸ�Ʈ</td>
												<td>${row.draw_comment}</td>
											</tr>

										</tbody>
									</table>

									<button class="font_top_button">
										<a href="/shop/draw_admin_count">����ȸ�� Ȯ��</a>
									</button>
								</div>
							</div>
						</c:forEach>
					</div>


					<!-- ���� ��� ��� -->
					<div class="modal_final_container">
						<div class="modal_final_body">
							<div class="modal_final_top">��÷���</div>
							<div class="modal_final_middle">
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
							</div>
							<div class="modal_final_bottom">
								<button class="modal_final_bottom_btn">Ȯ��</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- Ǫ�� -->
	<jsp:include page="footer.jsp" />
	<script src="/resources/js/shop/draw_admin.js"></script>
</body>

</html>