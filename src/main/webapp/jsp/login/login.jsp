<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="../../css/login.css">
</head>
<body>	
<!-- 로그인 화면 -->
	<div class="container" id="container">
	
		<div class="form-container sign-up-container">
			<form name="frm1" action="join" method="post">
				<h1>Create Account</h1>
				<br>
				<input type="hidden" name="type" value="1">
				<input type="text" placeholder="Id" name="id"/> 
				<input type="password" placeholder="Password" name="pw"/>
				<input type="text" placeholder="Name" name="name"/> 								 
				<input id="phone" type="text" size="11" maxlength="13" oninput="formatPhone()"
       			   placeholder="Phone" name="tel">     			
				<input type="text" placeholder="Email" name="email"/>
				<input type="text" placeholder="Address" name="address"/>
				<br>
				<button type="submit">Sign Up</button>
			</form>
		</div>
		
		<div class="form-container sign-in-container">
		
			<form name="frm2" action="login" method="post">
				<input type="hidden" id="forReserve" name="forReserve" value="${forReserve}">
				<c:if test="${forReserve == 'true'}">
					<input type="hidden" id="store_id" name="store_id" value="${store_id}">
				</c:if>
				<button type="button" id="homeButton" onclick="location.href='../../home'">
                	<i class="fas fa-regular fa-house"></i>
            	</button>
				<h1>LogIn</h1>	
				<br>			
				<input type="text" placeholder="Id" name="id"/> 
				<input type="password" placeholder="Password" name="pw"/>
				<input type="hidden" name="type" value="1">
				<a href="findPassword">Forgot your password?</a>	<!-- 비밀번호 재설정??? -->
				 <div class="button-container">
					<button type="button" class="customerLogin" onclick="setType(1)">
						Customer
					</button>
					<button type="button" class= "businessLogin" onclick="setType(2)">
						Business
					</button>
				</div>
				<script type="text/javascript">
					function setType(f) {
						const frm = document.forms[1]
						frm.type.value = f
						console.log(frm.type.value)
						frm.submit()
					}
				</script>
			</form>
		</div>
		
		<div class="form-container business-container" id = "business-container">
			<form name="frm3" action="join" method="post">
				<h1>Create Account</h1>		
				<input type="hidden" name="type" value="2">		
				<input type="text" placeholder="Id" name="id"/>								 
				<input type="password" placeholder="Password" name="pw"/>
				<input type="text" placeholder="Name" name="name"/> 								 
				<input id="phone" type="text" size="11" maxlength="13" oninput="formatPhone()"
       			   placeholder="Phone" name="tel">     			
				<input type="text" placeholder="Email" name="email"/>
				<button type="submit">Sign Up</button>
			</form>
		</div>
	
	
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your personal
						info</p>
					<button class="ghost" id="signIn">LogIn</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Sign Up!</h1>
					<p>Enter your personal details and start join with us</p>
					<button class="ghost" id="signUp">Customer</button>
					<br>
					<button class="ghost" id="b_signUp">Business</button>
				</div>
			</div>
			
		</div>
		</div>
	
	
<script src="https://kit.fontawesome.com/252e7f2829.js"></script>
<script type="text/javascript" src="../../js/login.js"></script>
</body>
</html>