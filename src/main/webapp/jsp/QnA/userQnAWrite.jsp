<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&amp;A 문의하기</title>
<link rel="stylesheet" type="text/css" href="../../css/user.css">
</head>
<body>	
<!-- 1:1 문의 글 작성 화면 -->
<jsp:include page="../includes/header.jsp"></jsp:include>
<section>
	<form name="frm1" method="post" action="write?type=1" >  
	<input type="hidden" name="status" value="1">    
 <table>
 	<tr>
 	<th>작성자</th>
 		<td>
 			<input type="text" name="user_id" size="78vh;" value="${user.id }" readonly>
 		</td>
 	</tr>
 	<tr>
 	<th>제목</th>
 		<td>
 			<input type="text" name="title" size="78vh;" >
 		</td>
 	</tr>
 	<tr>
 	<th>내용</th>
 		<td>
 			<textarea  rows="30" cols="80" name="content" required></textarea>
 		</td>
 	</tr>
 	<tr>
 	<td colspan="2" align="center">
	 	<button type="submit">저장</button>
	 	<button type="reset">다시쓰기</button>
	 	<button type="button" onclick="location.href='list?type=1&page=1#QnAUser'">목록</button>  
 	</td>
 	</tr>
 </table>
 </form>
</section>

<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>