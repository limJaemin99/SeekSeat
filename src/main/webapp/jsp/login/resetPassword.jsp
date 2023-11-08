<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" type="text/css" href="../../css/resetPassword.css">
</head>
<body>
<!-- 이메일 인증 후 비밀번호 변경 화면 -->
	<div class="container" id="container">

		<div class="form-container change-pw-container">
			<form action="resetPassword" method="post">
				<h1>Change Password</h1>
				<br> 
				<input type="hidden" name="id" value="${id}">
				<input type="password" placeholder="Password" name="pw" id="pw">
				<input type="password" placeholder="Check Password" name="checkpw" id="checkpw"> 
				<br>
				<button type="button" onclick="change()">비밀번호 변경</button>
				<script type="text/javascript">
					function change() {
						const frm = document.forms[0]
						let pw = frm.pw.value
						let checkpw = frm.checkpw.value
						
						if(pw == ""){
							pwInput.style.border = '2px solid red';
							checkPwInput.style.border = '2px solid red';
							alert('비밀번호는 공백이 될 수 없습니다.')
						} else {
							if(pw == checkpw){
								checkPwInput.style.border = '2px solid blue';
								frm.submit()
							} else {
								checkPwInput.style.border = '2px solid red';
								alert('비밀번호가 일치하지 않습니다.')
							}
						}
					}
				</script>
			</form>
		</div>

		<div class="form-container find-pw-container">

			<form action="forgotPassword" method="post">
				<button type="button" id="homeButton" onclick="location.href='../../home'">
               		<i class="fas fa-regular fa-house"></i>
            	</button>
				<h1>Find Password</h1>
				<c:if test="${returnType != 1}">
					<a id="buttonMessage" style="color: red;">
						CUSTOMER/BUSINESS 선택은<br>필수 사항입니다.
					</a>
				</c:if>
				<br>
				<div class="button-container">
					<c:if test="${returnType != 1}">
						<button type="button" onclick="setType(1)" class="customerFind">Customer</button>
						<button type="button" onclick="setType(2)" class="businessFind">Business</button>
					</c:if>
					<c:if test="${returnType == 1}">
						<button type="button" onclick="setType(1)" class="customerFind" disabled>Customer</button>
						<button type="button" onclick="setType(2)" class="businessFind" disabled>Business</button>
					</c:if>
				</div>
				<br>
				<c:if test="${returnType != 1}">
					<input type="text" placeholder="Id" name="id" value="" > 
					<input type="text" placeholder="Email" name="email" value="" >
				</c:if>
				<c:if test="${returnType == 1}">
					<input type="text" placeholder="Id" name="id" value="${id}" readonly> 
					<input type="text" placeholder="Email" name="email" value="${email}" readonly>
				</c:if>
				<br>
				<c:if test="${returnType != 1}">
					<button class="submit" type="submit">인증번호 전송</button>
				</c:if>
				<c:if test="${returnType == 1}">
					<button class="submit" type="submit" disabled>인증번호 전송</button>
				</c:if>
				<input type="text" placeholder="Authentication Code" name="insertCode" />
				<input type="hidden" name="code" value="${code}">
				<input type="hidden" name="type" value="1">
				<br>
				<script type="text/javascript">
					function setType(t) {
						const frm = document.forms[1];
						frm.type.value = t;
						
						document.getElementById('buttonMessage').style.display = 'none';
					}
				</script>
			</form>
		</div>

		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					
				</div>				
				<div class="overlay-panel overlay-right">
					<h1>Change Password</h1>
					<p>Check the certification and change your password</p>
					<button class="ghost" type="button" id="checkButton" onclick="check()">인증 확인</button>
					<input type="hidden" id="id">
					<input type="hidden" id="type">
					<script type="text/javascript">
   						function check() {
							const frm1 = document.forms[1];
   							const frm2 = document.forms[2];
							const code = frm1.code.value;
							let insertCode = frm1.insertCode.value;
							const id = frm1.id.value;
							const type = frm1.type.value;
							
							if(insertCode === code) {	/* 코드 일치 */
								alert('인증번호가 일치합니다.');
							
								frm2.id.value = id
								frm2.type.value = type
								
								frm2.action = "resetPassword";
								frm2.method = "get";
								frm2.submit();
				
							} else {	/* 코드 불일치 */
								alert('인증번호가 일치하지 않습니다.');
							}
						}
   					</script>  
				</div>
			</div>

		</div>
	</div>
	
<script src="https://kit.fontawesome.com/252e7f2829.js"></script>
<script type="text/javascript" src="../../js/findPassword.js"></script>
</body>
</html>