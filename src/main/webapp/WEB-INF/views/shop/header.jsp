<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 	<!--쇼핑몰 글로벌 css-->
    <link rel="stylesheet" href="/resources/css/shop/shop_global.css">
    
    <!--쇼핑몰 글로벌 아이콘 cdn-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Header</title>
</head>
<body>
	 <!--헤더-->
     <header>
        <div class="logo">
            <h1>Camp<span>ing</span></h1>
        </div>
        <div class="menu">
            <a href="shop.html">Shop</a>
            <a href="draw_customer.html">Draw</a>
            <a href="">Q&A</a>
        </div>
        <div class="login">
            <a href="">
                <i class="xi-search"></i>
            </a>
            <a href="">
                <i class="xi-truck"></i>
            </a>
            <a href="basket.html">
                <i class="xi-cart"></i>
            </a>
            <c:if test="${sessionScope.login_id eq null}">
            	<a href="">LogIn</a>
	            <a href="">SignUp</a>
            </c:if>
            <c:if test="${sessionScope.login_id ne null}">
	            <a>${sessionScope.login_id } 님</a>
	            <a href="/logout">LogOut</a>
            </c:if>
            
            
        </div>
    </header>
</body>
</html>