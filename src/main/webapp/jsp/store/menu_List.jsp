<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 관리</title>
<link rel="stylesheet" type="text/css" href="../../css/owner.css">
</head>
<body>	<!-- 메뉴 출력 화면 -->
<jsp:include page="../includes/header.jsp"></jsp:include>
	<section>
		<br>
		<h2 style="margin: 0px; text-align: center;">메뉴 목록</h2>
		<h3 style="text-align: center; margin-top: 10px;">상호명 : ${name}</h3>
		<br>
		<hr style="width: 1000px;">
		<table>
			<tr>
				<th>메뉴 이름</th>
				<th>가격</th>
				<th>설명</th>
				<th>추천메뉴</th>
				<th>사진</th>
				<th>메뉴 삭제</th>
			</tr>
			<c:forEach items="${list}" var="vo" varStatus="status">
				<tr>
					<td id="menu_name"><c:out value="${vo.menu_name}"/></td>
					<td id="price"><c:out value="${vo.price}"/></td>
					<td id="content"><c:out value="${vo.content}"/></td>
					<td id="best">
						<c:if test="${vo.best == 'on'}">
							<a style="color: red;">추천</a>
						</c:if>
						<c:if test="${vo.best == null}">
							<a>━</a>
						</c:if>
					</td>
					<td id="menuPictureUrl"><c:out value="${vo.menuPictureUrl}"/></td>
					<!-- ▲ 위 아래 전부 수정해야함 ▼ -->
					<td><a href = "deleteMenuInfo?store_id=${store_id}&menu_name=${vo.menu_name }"><img src="../../image/휴지통.png"  style="width: 50px; height: 50px;"></a></td>
				</tr>
			</c:forEach>
		</table>
		<div id="menidiv" style="text-align: center;">
         <button style="display :inline-block;" onclick="location.href='storeList'">이전으로</button>	
         <button style="display :inline-block;" onclick="location.href='storeMenu?store_id=${store_id}'">메뉴 추가</button>	
					<button onclick="location.href ='updateMenuInfo?store_id=${store_id}'">메뉴 수정</button>
         </div>
	</section>
	
<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>