<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<link rel="stylesheet" type="text/css" href="../../css/owner.css">
</head>
<body>

<jsp:include page="../includes/header.jsp"></jsp:include>

<section class="password-section">
	<i class="fas fa-duotone fa-lock"></i>
	<form action="userInfo?type=2" method="post">
		<h2>비밀번호를 입력해주세요</h2>
		<div class="pw-container">
			<input type="password" placeholder="Password" class="pw" name="pw"/>
		</div>
		<div class="button">
			<button>확인</button>
		</div>
	</form>
</section>

<jsp:include page="../includes/footer.jsp"></jsp:include>

<script src="https://kit.fontawesome.com/252e7f2829.js"></script>
</body>
</html>