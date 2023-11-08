<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 관리</title>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, width=device-width">
<link rel="stylesheet" type="text/css" href="../../css/owner.css">
</head>
<body onload="populateTimeSelect('runTime1'); populateTimeSelect('runTime2');">
<!-- 사장님 정보 수정 후 화면 -->
<jsp:include page="../includes/header.jsp"></jsp:include>

	<section>
		<h2>내 정보</h2>	
		<br>	
		<form action="userRead?type=2" method="post">
		<input type="hidden" name="type" value="2">
			<table>
				<tr>
					<th><label for="id">ID</label></th>
					<td><input type="text" id="id" name="id" readonly="readonly" value="${user.id}"></td>
				</tr>
				<tr>
					<th><label for="pw">PASSWORD</label></th>
					<td><input type="password" id="pw" name="pw" value="${user.pw }" readonly="readonly"></td>
				</tr>
				<tr>
					<th><label for="name">이름</label></th>
					<td><input type="text" id="name" name="name" readonly="readonly" value="${user.name}"></td>
				</tr>
				<tr>
					<th><label for="tel">전화번호</label></th>
					<td><input type="text" id="tel" name="tel" size="11" readonly="readonly" value="${user.tel }" maxlength="13" oninput="formatPhone()"></td>
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td><input type="text" id="email" name="email" readonly="readonly" value="${user.email }"></td>
				</tr>
			</table>
		<div class="button">
			<button type="button" onclick="location.href='userUpdate?type=2'">수정</button>
			<button type="button" onclick="location.href='main?type=2'">확인</button>
		</div>
		</form>
		


	</section>
	
<jsp:include page="../includes/footer.jsp"></jsp:include>
	
<script type="text/javascript" src="../js/owner_Info.js"></script>
</body>
</html>


