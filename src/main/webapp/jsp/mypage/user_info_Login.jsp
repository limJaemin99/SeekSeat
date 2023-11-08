<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	<!-- ▼ 정 안되면 크기 늘리는것도 좋을듯 -->
<title>내 정보</title>	<!-- ★★★ css에 margin: auto 하면 중앙 정렬 되는데 적용이 안되는중이라 보류 09.06 ★★★ -->
<link rel="stylesheet" type="text/css" href="../../css/user.css">
</head>
<body>
<jsp:include page="../includes/header.jsp"></jsp:include>

<section class="password-section">
	<i class="fas fa-duotone fa-lock"></i>
	<form action="userInfo?type=1" method="post">
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