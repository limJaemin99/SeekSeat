<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, width=device-width">
<link rel="stylesheet" type="text/css" href="../../css/user.css">
</head>
<body>

<jsp:include page="../includes/header.jsp"/>

	<section>
		<h2>즐겨찾기 목록</h2>
		<br>
			<input type="hidden" id="member_type" name="member_type" value="${sessionScope.user.member_type}">
			<table>
				<tr>
					<th>매장 이름</th>
					<th>바로가기</th>
					<th>삭제</th>
				</tr>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.store_name}</td>
						<td><a href="javascript:newWindow('${list.store_id}')">바로가기</a></td>
						<td><a href="deleteFavorite?store_id=${list.store_id}">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<div>
			
			</div>
	</section>

<jsp:include page="../includes/footer.jsp"/>
<script type="text/javascript">
	function newWindow(id) {
		let member_type = document.getElementById('member_type').value
		
    	let options = "toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1200, height=1000, top=0,left=0";

    	window.open("../search/searchStoreInfo?store_id="+id+"&member_type="+member_type,"_blank", options);
	}
</script>

</body>
</html>