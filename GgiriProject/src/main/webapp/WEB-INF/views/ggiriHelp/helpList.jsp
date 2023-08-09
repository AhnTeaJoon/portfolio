<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<style type="text/css">
* {
	font-family: 'IBM Plex Sans KR', sans-serif;

}
#freeInput {
 	border-radius: 15px;
	font-size: 15px;
	padding-top: 5px;
	padding-bottom: 5px;
	float: right;
    min-height: 50px; 
    min-width: 170px;
	cursor: pointer;
}
#freeInput:hover {
	background-color: white;
	transition: 0.5s;
}
a{
	text-decoration: none;
	color: black;
	text-align: left;
	font-weight: bold;
}

span{
	text-color: black;
	text-align: right;
}
.title {
	width: 1400px;
	text-align: left;
	margin: auto;
}
#date {
	float: right;
}
.ask {
	margin: auto;
}
#h {
	font-size: 24px;
	font-weight: bolder;
}
table {
	margin: 0 auto;
}
table th {
	text-align: center;
	font-size: 18px;
}
table th,td {
	border-bottom: 2px solid gray;
	padding: 20px 0 20px 0;
}

table td {
	padding: 5px 0 7px 8px;
	text-align: center;
	width: 100px;
}
#button1 {
	width: 60px;
	height: 28px;
	border: none; 
	border-radius: 9999px;
	font-size: 14px;
	background: #B2CCFF;
	font-family: 'IBM Plex Sans KR', sans-serif;
	cursor: pointer;
}
#button1:hover {
	background-color:#EBF7FF;
    transition: 0.5s;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<br>
	<div class="title">
		<div>
			<button id="freeInput" type="button"onclick="location.href='${contextPath}/ggiriHelp/helpWrite'"> 요청사항 등록하기 </button>
		</div>
		<div class="ask">
			<p>끼리가 보증하는 IT파트너</p>
			<p id="h">문의사항이 있으시면<br>
			자유롭게 남겨주세요 :D</p>
		<br>
		</div>
		<hr>
		<table style="border:1px solid white;">
		<tr>
	      <th width="185px"> 글번호 </th>
	      <th width="830px"> 제 목 </th>
	      <th width="185px"> 날 짜 </th>
	    </tr>
	    <c:if test="${helpList.size()==0 }">
	      <tr>
	        <th colspan="6"> 등록된 글이 없습니다 </th>
	      </tr>
	    </c:if>
	    <c:forEach var="list" items="${helpList }">
	      <tr>
	      <td style="text-align: center">${list.helpNo }</td>
	      <td style="text-align: left"><a href="../ggiriHelp/helpView?helpNo=${list.helpNo }">${list.title }</a></td>
	      <td style="text-align: center">${list.helpDate }</td>
	      </tr>
	    </c:forEach>
	</table>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>