<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 현황</title>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, width=device-width">
<link rel="stylesheet" type="text/css" href="../../css/owner.css">
</head>
<body onload="populateTimeSelect('runTime1'); populateTimeSelect('runTime2');">
<jsp:include page="../includes/header.jsp"></jsp:include>

	<section>
		<h2>예약 현황</h2>
		<br>
		<form action="">
			<table>
			<tr>
				<th>No</th>
				<th>ID</th>
				<th>예약자명</th>
				<th>날짜</th>
				<th>시간</th>
				<th>인원</th>
				<th>선택한 테이블</th>
				<th>예약 상태</th>
				<th>예약 번호</th>
			</tr>
			
			<tr>
			<td>------</td>
			<td>------</td>
			<td>------</td>
			<td>------</td>
			<td>------</td>
			<td>------</td>
			<td>------</td>
			<td>------</td>
			<td>------</td>
			</tr>
		</table>
		</form>


	</section>
	
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	
</body>
</html>


