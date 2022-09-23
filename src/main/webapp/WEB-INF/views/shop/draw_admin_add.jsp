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


<!-- �۷ι� css -->
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
	<!-- ��� -->
	<jsp:include page="header.jsp" />

	<!--����-->
	<main>
		<form class="admin_container" id="admin_container" name="admin_container" method="post">
			<div class="draw_container">

				<div class="admin_main">
					<table class="admin_body">
						<!-- <tr class="admin_body_file">
                            <td class="file_top_fir">�̺�Ʈ �̹���</td>
                            <td>
                                <input type="file" name="file" class="drawInputs">
                            </td>
                        </tr> -->

						<tr class="admin_title">

							<td>��ǰŰ</td>
							<td><input type="button" value="��ǰ ����" id="selectDrawBtn"> <span id="selectedDrawName"></span></td>

						</tr>
						<tr class="admin_title">

							<td>��ǰ �̸�</td>
							<!-- <td>
                                ${vo.product_name};
                            </td> -->
							<td><input type="text" class="drawInputs"></td>
						<tr class="admin_title">
							<td>��ǰ ����</td>
							<td><input type="text" class="drawInputs"></td>
							<!-- <td>
                                <fmt:formatNumber value="${vo.product_price}"
                                pattern="###,##,###"/>
                            </td> -->

						</tr>
						<tr class="admin_title">
							<td>�ο�</td>
							<td><input type="number" value="1" id="selectDrawBtn"></td>
						</tr>
						<tr class="admin_title">
							<td>�̺�Ʈ ������</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>�̺�Ʈ ������</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>���� ������</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>���� ������</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>�ڸ�Ʈ</td>
							<td><textarea name="" id="" cols="30" rows="10"></textarea></td>
						</tr>

					</table>

				</div>
				<input type="submit" name="submit" value="���" class="file_submit">
			</div>
		</form>
		<!--��񿡼� ������ ��ǰ ��� �����ִ� ����� -->
		<div class="selectDrawProductContainer">
			<div class="drawList">
				<div class="drawList_cc">
					ī�װ�
					<div class="drawList_ul">
						<ul>
							<li class="drawList_li">
								<button class="btn" data-category-id="1">��Ʈ</button>
							</li>
							<li class="drawList_li">
								<button class="btn" data-category-id="2">����</button>
							</li>
							<li class="drawList_li"><button class="btn" data-category-id="4">���̺�</button></li>
							<li class="drawList_li"><button class="btn" data-category-id="5">ȭ�Դ�</button></li>
						</ul>
					</div>
				</div>
				<div class="drawList_b">
					�귣��
					<!-- <table class="drawList_brand_table">
                        <tbody>
                        <tr>
                            <td> <button class="btn_brand" value="1">�뽺��ũ</button>
                            
                            </td>
                    </tr>
                    <tr>
                        <td> <button class="btn_brand" value="2"> ī���</button>
                           
                        </td>
                    </tr>
                    <tr>
                        <td> <button class="btn_brand" value="3">t����� ��ũ</button>
                            
                        </td>
                    </tr>
                 
                   </tbody>
                </table >  -->
				</div>
				<div class="drawList_i">
					��ǰ
					<!--  <table class="drawList_brand_table">
                        <tbody>
                        <tr>
                            <td> <button class="btn_product" value="1">�뽺��ũ ���������</button>
                    </tr>
                    <tr>
                        <td> <button class="btn_product" value="2"> ķ��ĭ ��ũ��</button>
                           
                        </td>
                    </tr>
                    <tr>
                        <td> <button class="btn_product" value="2"> �������ũ ������</button>
                           
                        </td>
                    </tr>
                 
                   </tbody>
                </table > -->
				</div>
			</div>
		</div>
	</main>

	<!-- Ǫ�� -->
	<jsp:include page="footer.jsp" />

	<script src="/resources/js/shop/draw_customer_add.js"></script>
	<script>
	//====== ���������� ���̸� Ŭ�� ������ ====== //
	const btn = document.querySelectorAll('.btn');
	btn.forEach( function(item) {
		item.addEventListener('click' , ajaxCategory);
		
	});
	
	function ajaxCategory(){
		console.log('Ŭ��');
		const param = { product_category_id : this.dataset.categoryId }
		//�����轺 ����
		$.ajax({
			//url
			url : '/shop/admin_add_plus.os',
			//���� ���� �� 
			data : param,
			//method (get/post)
			type : 'get',
			//�����轺 ��� ���� ������ ������ �Լ�
			error : function(){
				alert('ī�װ� �����轺 ��� ����');
			},
			//�����轺 ��� ���� ������ ������ �Լ�
			success : function(productList){
				console.log(productList);
				const drawList_b = document.querySelector('.drawList_b');
				for(let i = 0; i < productList.length; i++){
					
						
							//productList ������ ��ư ����
							let testBtn = document.createElement('button');
							testBtn.className = 'categoryBtns';
							//ī�װ� ������ ��ư�� �߰�
							drawList_b.appendChild(testBtn);
							//��ư�� �귣�� �̸� �߰�
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
		// product_name �������� ����
		$.ajax({
			
			//url
			url : '/shop/admin_add_plus_product.os',
			//���� ���� �� 
			data : param,
			//method (get/post)
			type : 'get',
			//�����轺 ��� ���� ������ ������ �Լ�
			error : function(){
				alert('ī�װ� �����轺 ��� ����');
			},
			success : function(product){
				const drawList_i = document.querySelector('.drawList_i');
				for(let i = 0; i < product.length; i++){
					console.log(product[i]);
					//product ������ ��ư ����
					let testBtn = document.createElement('button');
					testBtn.className = 'productBtns';
					//ī�װ� ������ ��ư�� �߰�
					drawList_i.appendChild(testBtn);
					//��ư�� �귣�� �̸� �߰�
					testBtn.innerHTML = product[i].product_name;
				}
				
			}
			
			
			
		})
		
				
		
		console.log(param);
	}
</script>
</body>

</html>