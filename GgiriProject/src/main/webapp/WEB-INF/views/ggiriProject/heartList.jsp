<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.board_table{
   width: 900px;
   margin: auto;
   text-align: left;
}
div {
   font-family: 'IBM Plex Sans KR', sans-serif;
   margin-right: auto;
   margin-left: auto;
}

div #h{
   font-size: 24px;
   font-weight: bolder;
}
#mem {
   padding: 30px;
   border: 2px solid navy;
   border-radius: 40px;
}
#title {
   font-size: 32px;
}
a{
   text-decoration: none;
   color: black;
   font-weight: bold;
}
h3 {
	color: gray;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>

	<%-- <c:forEach var="list" items="${heartList }">
		<c:if test="${list.id == heartlist.id }">
		<p>${list.id }</p>
		<p>${list.prodate }</p>
		<p>${list.like_check }</p>
		</c:if>
	</c:forEach>  --%>
	<div class="board_table">
		<h1>[나의 찜 ꯁ 목록]</h1>
		<br>
		<c:if test="${heartlist.size() == 0 }">
			<h3>좋아요한 글이 없습니다.</h3>
		</c:if>
		<c:if test="${heartSnslist.size() == 0 }">
			<h3>좋아요한 글이 없습니다.</h3>
		</c:if>
		<c:forEach var="list" items="${heartlist }">
		<div id="mem">
			<c:if test="${list.id == loginUser }">
				<p>${list.prodate }</p>
				<a id="title" href="../ggiriProject/projectView?projectNum=${list.projectNum }">${list.title }</a>
			</c:if>
		</div>
		</c:forEach>
		<br>
		<c:forEach var="list" items="${heartSnslist }">
		<br>
		<div id="mem">
			<p>${list.prodate }</p>
			<a id="title" href="../ggiriProject/projectView?projectNum=${list.projectNum }">${list.title }</a>
		</div>
		</c:forEach>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
	
</body>
</html>