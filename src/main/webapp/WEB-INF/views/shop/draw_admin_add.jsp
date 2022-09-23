<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">

<link rel="stylesheet" href="/resources/css/shop/draw_admin_add.css">
<title>Document</title>
<style>
.categoryBtns {
	width: 150px;
	height: 50px;
	background-color: black;
	color: white;
}
</style>
</head>




<body>
	<!-- 헤더 -->
	<jsp:include page="header.jsp" />

	<!--메인-->
	<main>
		<form class="admin_container" id="admin_container" name="admin_container" method="post">
			<div class="draw_container">

				<div class="admin_main">
					<table class="admin_body">
						<!-- <tr class="admin_body_file">
                            <td class="file_top_fir">이벤트 이미지</td>
                            <td>
                                <input type="file" name="file" class="drawInputs">
                            </td>
                        </tr> -->

						<tr class="admin_title">

							<td>상품키</td>
							<td><input type="button" value="상품 보기" id="selectDrawBtn"> <span id="selectedDrawName"></span></td>

						</tr>
						<tr class="admin_title">

							<td>상품 이름</td>
							<!-- <td>
                                ${vo.product_name};
                            </td> -->
							<td><input type="text" class="drawInputs"></td>
						<tr class="admin_title">
							<td>상품 가격</td>
							<td><input type="text" class="drawInputs"></td>
							<!-- <td>
                                <fmt:formatNumber value="${vo.product_price}"
                                pattern="###,##,###"/>
                            </td> -->

						</tr>
						<tr class="admin_title">
							<td>인원</td>
							<td><input type="number" value="1" id="selectDrawBtn"></td>
						</tr>
						<tr class="admin_title">
							<td>이벤트 시작일</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>이벤트 종료일</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>구매 시작일</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>구매 종료일</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>코멘트</td>
							<td><textarea name="" id="" cols="30" rows="10"></textarea></td>
						</tr>

					</table>

				</div>
				<input type="submit" name="submit" value="등록" class="file_submit">
			</div>
		</form>
		<!--디비에서 한정판 상품 목록 보여주는 디비전 -->
		<div class="selectDrawProductContainer">
			<div class="drawList">
				<div class="drawList_cc">
					카테고리
					<div class="drawList_ul">
						<ul>
							<li class="drawList_li">
								<button class="btn" data-category-id="1">텐트</button>
							</li>
							<li class="drawList_li">
								<button class="btn" data-category-id="2">의자</button>
							</li>
							<li class="drawList_li"><button class="btn" data-category-id="4">테이블</button></li>
							<li class="drawList_li"><button class="btn" data-category-id="5">화롯대</button></li>
						</ul>
					</div>
				</div>
				<div class="drawList_b">
					브랜드
					<!-- <table class="drawList_brand_table">
                        <tbody>
                        <tr>
                            <td> <button class="btn_brand" value="1">노스피크</button>
                            
                            </td>
                    </tr>
                    <tr>
                        <td> <button class="btn_brand" value="2"> 카즈미</button>
                           
                        </td>
                    </tr>
                    <tr>
                        <td> <button class="btn_brand" value="3">t스노우 피크</button>
                            
                        </td>
                    </tr>
                 
                   </tbody>
                </table >  -->
				</div>
				<div class="drawList_i">
					상품
					<!--  <table class="drawList_brand_table">
                        <tbody>
                        <tr>
                            <td> <button class="btn_product" value="1">노스피크 에어리빙쉘터</button>
                    </tr>
                    <tr>
                        <td> <button class="btn_product" value="2"> 캠핑칸 오크돔</button>
                           
                        </td>
                    </tr>
                    <tr>
                        <td> <button class="btn_product" value="2"> 스노우피크 설빙제</button>
                           
                        </td>
                    </tr>
                 
                   </tbody>
                </table > -->
				</div>
			</div>
		</div>
	</main>

	<!-- 푸터 -->
	<jsp:include page="footer.jsp" />

	<script src="/resources/js/shop/draw_customer_add.js"></script>
	<script>
	//====== 조직도에서 팀이름 클릭 했을때 ====== //
	const btn = document.querySelectorAll('.btn');
	btn.forEach( function(item) {
		item.addEventListener('click' , ajaxCategory);
		
	});
	
	function ajaxCategory(){
		console.log('클릭');
		const param = { product_category_id : this.dataset.categoryId }
		//에이잭스 시작
		$.ajax({
			//url
			url : '/shop/admin_add_plus.os',
			//내가 보낼 거 
			data : param,
			//method (get/post)
			type : 'get',
			//에이잭스 통신 실패 했을시 실행할 함수
			error : function(){
				alert('카테고리 에이잭스 통신 실패');
			},
			//에이잭스 통신 성공 했을시 실행할 함수
			success : function(productList){
				console.log(productList);
				const drawList_b = document.querySelector('.drawList_b');
				for(let i = 0; i < productList.length; i++){
					
						
							//productList 값으로 버튼 생성
							let testBtn = document.createElement('button');
							testBtn.className = 'categoryBtns';
							//카테고리 구역에 버튼들 추가
							drawList_b.appendChild(testBtn);
							//버튼에 브랜드 이름 추가
							testBtn.innerHTML = productList[i].product_brand_id;
							//checkTest.setAttribute('checked',true);
							testBtn.setAttribute('data-category_id', productList[i].product_category_id);
							testBtn.addEventListener('click' , ajaxProduct);	
							
						}
						
					
						
				}
				
		
			
		})
		}
	
	function ajaxProduct(){
		const param = {
						product_category_id : this.dataset.category_id,
						product_brand_id : this.innerHTML
					  }
		// product_name 에이젝스 시작
		$.ajax({
			
			//url
			url : '/shop/admin_add_plus_product.os',
			//내가 보낼 거 
			data : param,
			//method (get/post)
			type : 'get',
			//에이잭스 통신 실패 했을시 실행할 함수
			error : function(){
				alert('카테고리 에이잭스 통신 실패');
			},
			success : function(product){
				const drawList_i = document.querySelector('.drawList_i');
				for(let i = 0; i < product.length; i++){
					console.log(product[i]);
					//product 값으로 버튼 생성
					let testBtn = document.createElement('button');
					testBtn.className = 'productBtns';
					//카테고리 구역에 버튼들 추가
					drawList_i.appendChild(testBtn);
					//버튼에 브랜드 이름 추가
					testBtn.innerHTML = product[i].product_name;
				}
				
			}
			
			
			
		})
		
				
		
		console.log(param);
	}
</script>
</body>

</html>