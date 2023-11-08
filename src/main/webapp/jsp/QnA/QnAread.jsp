<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/QnAread.css">
</head>
<body>   
<!-- 1:1 문의 선택한 문의 글 확인 및 관리자 답변 화면 -->
   <main id="QnAread">
   <h3>1:1 문의</h3>
   <hr style="color:white;">
   <div style="width: 80%; margin: auto;max-width: 760px;">
      <ul id="table">
         <li>
            <ul class="row">
               <li>제목</li>
               <li><c:out value="${vo.title}"/></li>
            </ul>
         </li>
         <li>
            <ul class="row">
               <li>작성자</li>
                <li>
                  <c:choose>
                      <c:when test="${not empty vo.user_id}">
                          <c:out value="${vo.user_id}"/>
                      </c:when>
                      <c:when test="${not empty vo.owner_id}">
                          <c:out value="${vo.owner_id}"/>
                      </c:when>
                      <c:otherwise>
                          작성자 정보 없음
                      </c:otherwise>
                  </c:choose>
                 </li>
               <li>작성날짜</li>
               <li><fmt:formatDate value="${vo.createdDate }" type="both"/></li>
               <!-- pattern="yyyy-MM-dd HH:mm:ss , type= date,time,both -->
            </ul>
         </li>
         <li id="content">
            <ul>
               <li>문의내용</li>         
               <!-- textarea에 입력한 엔터는 \n db에도 \n으로 저장됩니다.
                    브라우저 출력은 줄바꿈은 <br> 태그 해결1) pre 태그, 해결  2) \n을 <br>로 대치-->   
               <li>
                  <pre><c:out value="${vo.content}"/></pre>
               </li>            
            </ul>
         </li>
      </ul>
   <div style="text-align: center;margin-bottom: 10px;">
   <form action="list" method="GET">
   <input type="hidden" name="type" value="1">
      <input type="hidden" name="page" value="${page }">
      <c:if test="${sessionScope.user.member_type == 1 }">
      <a class="button" href="list?type=1&page=${page}">목록</a>   <!-- 1번째 페이지로 이동-->
      </c:if>
      <c:if test="${sessionScope.user.member_type == 2 }">
      <a class="button" href="list?type=2&page=${page}">목록</a>   <!-- 1번째 페이지로 이동-->
      </c:if>
      <c:if test="${sessionScope.user.member_type == 3 }">
      <a class="button" href="list?type=3&page=${page}&mType=${mType}">목록</a>   <!-- 1번째 페이지로 이동-->
      </c:if>
      </form>
   </div>
   <!-- 1:1 문의 글 출력 끝 -->
   <form action="update" method="post">
   <!-- 필요한 파라미터.화면에는 표시안함. -->
   <input type="hidden" name="writeNo" value="${vo.writeNo}">
   <input type="hidden" name="f" value="0">
   <input type="hidden" name="page" value="${page}">  <!-- 현재페이지 번호 전달 - 순서8) -->
      <ul>
         <li>
            <ul class="row">
            <c:if test="${sessionScope.user.member_type != 1 && sessionScope.user.member_type != 2}">  
               <li>관리자</li>   <!-- 구현 보류 : 로그인한 사용자가 작성할때는 로그인 이메일,닉네임 가져와서 표시 -->         
            </c:if>
            </ul>
         </li>
         <li>
            <ul style="display: flex;">
                  <li style="align-self: center; margin-bottom: 20px;">
                     <c:if test="${sessionScope.user.member_type == 3}">
                     <c:if test="${vo.status == 1}">
						<textarea rows="5" cols="80" name="answer" 
                   		style="resize:none;margin-right:20px;" 
                   		placeholder="답변을 작성해주세요." class="input"
               			></textarea>
                        	<button type="button" onclick="executeCmt('1')">처리</button>  
                     </c:if>
                     </c:if>   
               </li>
            </ul>
         </li>
         <li>
               <span>처리내용</span>
            <hr>
         </li>
         
         <!-- 댓글 목록 -->
         <li>
            <ul class="crow">
               <li><c:out value="${vo.admin_id }" /></li>         
               <li><fmt:formatDate value="${vo.answerDate }" type="both"/></li>   
            </ul>
         </li>
         <li>
            <pre class="cmtreply"><c:out value="${vo.answer }" /></pre>
         </li>
      </ul>   
   </form>
   </div>
   </main>
   <script type="text/javascript">
   function executeCmt(fval){ 
		const frm = document.forms[1]
      	frm.f.value = fval
		let text = frm.answer.value
		
		var message = confirm("[주의]\n답변 등록시 수정/삭제가 불가능합니다.\n답변을 등록하시겠습니까?");
		if(message){
			if(fval==='1'){
				if(text != ''){
					document.forms[1].submit()       
		    		alert("답변이 등록되었습니다.");
				} else {
					alert('답변이 입력되지 않았습니다.')
				}
			} else {
				alert('처리 실패')
			}
		}
   }
   
   function reset_content() {
      document.forms[0].answer.value=''
   }
</script>
</body>
</html>