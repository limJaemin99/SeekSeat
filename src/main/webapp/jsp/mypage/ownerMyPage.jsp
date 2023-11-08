<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원 마이페이지</title>
<link rel="stylesheet" type="text/css" href="../../css/owner.css">
</head>
<body>
<jsp:include page="../includes/header.jsp"></jsp:include>
<section>
	<br>
	<h1 style="text-align: center; margin: 0px;">${sessionScope.user.name}님 환영합니다!</h1>
</section>

<jsp:include page="../includes/footer.jsp"></jsp:include>

<script src="https://kit.fontawesome.com/252e7f2829.js"></script>
</body>
</html>
