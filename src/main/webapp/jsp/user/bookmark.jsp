<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, width=device-width">
<link rel="stylesheet" type="text/css" href="../../css/user.css">
</head>
<body onload="populateTimeSelect('runTime1'); populateTimeSelect('runTime2');">
<jsp:include page="../includes/header.jsp"></jsp:include>
	<section>
		<h2>즐겨찾기</h2>
		<br>
		<form action="">
			<table>
			<tr>
				<th>No</th>
				<th>가게 이름</th>
				<th>방문 횟수</th>	
				<th></th>			
			</tr>
			
			<tr>
			<td>리스트</td>
			<td>가져오기</td>
			<td>하암</td>	
			<td><button>삭제</button></td>		
			</tr>
		</table>
		</form>


	</section>
	
<jsp:include page="../includes/footer.jsp"></jsp:include>
	

</body>
</html>