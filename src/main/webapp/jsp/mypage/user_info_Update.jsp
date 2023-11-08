<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, width=device-width">
<link rel="stylesheet" type="text/css" href="../../css/user.css">
</head>
<body>
<!-- 회원 정보 수정 화면 -->
	<jsp:include page="../includes/header.jsp"></jsp:include>

	<section>
		<h2>내 정보</h2>
		<br>
		<form action="userUpdate?type=1" method="Post">
			<table>
				<tr>
					<th><label for="id">ID</label></th>
					<td><input type="text" id="id" name="id" readonly="readonly" value="${sessionScope.user.id}"></td>
				</tr>
				<tr>
					<th><label for="pw">PASSWORD</label></th>
					<td><input type="password" id="pw" name="pw" value="${sessionScope.user.pw }" readonly="readonly"></td>
				</tr>
				<tr>
					<th><label for="name">이름</label></th>
					<td><input type="text" id="name" name="name" readonly="readonly" value="${sessionScope.user.name}"></td>
				</tr>
				<tr>
					<th><label for="tel">전화번호</label></th>
					<td><input type="text" id="tel" name="tel" size="11" value="${sessionScope.user.tel }" maxlength="13" oninput="formatPhone()"></td>
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td><input type="text" id="email" name="email" value="${sessionScope.user.email }"></td>
				</tr>
				<tr>
					<th><label for="address">주소</label></th>
					<td><input type="text" id="address" name="address" value="${sessionScope.user.address }"></td>
				</tr>

			</table>

		<br>
		<div class="button">
			<button type="submit">저장</button>
		</div>

		</form>
	</section>
		
<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>