<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 방문</title>
<link rel="stylesheet" type="text/css" href="../../css/user.css">
</head>
<body>
<jsp:include page="../includes/header.jsp"></jsp:include>

<section>
	<h2>최근 방문</h2>
	<form action="">
		<table>
			<tr>
				<th>No</th>
				<th>가게이름</th>
				<th>방문일자</th>
				<th>예약인원</th>
				<th>예약번호</th>
				<th>리뷰등록</th>
			</tr>
			<tr>
			<td>리스트</td>
			<td>가져오기</td>
			<td>하암</td>
			<td>------</td>
			<td>------</td>
			<td><button>등록하기</button></td>
			</tr>
		</table>
		</form>
</section>

<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>