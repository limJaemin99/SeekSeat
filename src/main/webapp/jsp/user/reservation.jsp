<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
<link rel="stylesheet" type="text/css" href="../../css/user.css">
</head>
<body>
<jsp:include page="../includes/header.jsp"></jsp:include>

<section>
	<h2>예약 내역</h2>
	<form action="">
		<table>
			<tr>
				<th>No</th>
				<th>가게이름</th>
				<th>예약시간</th>
				<th>예약인원</th>
				<th>예약번호</th>
				<th>예약현황</th>
			</tr>
			<tr>
			<td>리스트</td>
			<td>가져오기</td>
			<td>하암</td>
			<td>------</td>
			<td>------</td>
			<td>대기</td>
			</tr>
		</table>
		</form>
</section>

<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>