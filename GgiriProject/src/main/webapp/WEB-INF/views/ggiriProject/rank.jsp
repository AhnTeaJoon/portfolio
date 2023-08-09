<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0 auto;
}

#bestProject {
   text-align: center;
}
#bPro {
   font-weight: bold;
   padding-top: 25px;
   font-size: 32px;
   background-clip: text;
   -webkit-background-clip: text;
   color: transparent;
   background-image: linear-gradient(
     180deg,
     #79ABFF,			
     #000075 10%,		
     #1F51B7 33%,		
     #A0BAED 45%,
     #6799FF 50%,
     #A0BAED 66%,
     #000075			
   );
   background-size: 100% 300%;
   background-position-y: 0%;
   animation: gradient 2s 1s infinite alternate;
}

@keyframes gradient {
  from {
    background-position-y: 0%;
  }
  to {
    background-position-y: 100%;
  }
}
#all{
	border-radius: 40px;
	background-color: #ebe8e3;
	width: 1600px;
}
.id{
	text-align: center;
	margin: 50px;
	float:left;
	border: 1px solid black;
	background-color: white;
	border-radius: 30px;
	cursor: pointer;
	box-shadow: 5px 5px 10px;
	width: 180px;
	height: 250px;
	word-break: keep-all;
}
.center-parent {
    display: flex;
    justify-content: center;
}
</style>
</head>
<body>
	<div id="all">
	<div id="bestProject">
	<br>
		<b id="bPro">좋아요 HOT</b> <b style="font-size: 32px">🔥</b> <b id="bPro">게시물</b>
   		<p style="color: gray;'">GGIRI 에서 가장 많은 좋아요를 받은 게시물이 되어보세요-!</p>
    </div>
	<h1 style="text-align: center"></h1>
	<div class="center-parent">
		<c:if test="${list.size() == 0 }">
			<h1>좋아요 수 집계중입니다</h1>
		</c:if>
		<div>
			<c:forEach var="list" items="${rank }">
			<c:set var="i" value="${i+1}"></c:set>
				<div class="id">
					<img style="width: 140px; height: 140px; "onclick="location.href='${contextPath }/ggiriProject/projectView?projectNum=${list.projectNum}'" src="${contextPath }/resources/image/${i }.png">
<%-- 					<div style="font-size: 15px;"><a href="${contextPath}/ggiriProject/projectView?projectNum=${list.projectNum}">글 번호 : ${list.projectNum }</a></div>
 --%>					<div style="font-size: 15px;"><a href="${contextPath}/ggiriProject/projectView?projectNum=${list.projectNum}">${list.title }</a></div>
				</div>
			</c:forEach>
		</div>
	</div>
	</div>
</body>
</html>