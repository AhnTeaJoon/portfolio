
<!-- ggiriComplete/completeView.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriComplete/completeView.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
* {
    font-family: 'IBM Plex Sans KR', sans-serif;
	margin: 0 auto;
}
h1 {
	color: black;
}
b {
	color: #000000;
	font-size: 20px;
}
.head {
	margin: auto;
	margin-top: 30px;
	padding: 20px;
	border-radius: 30px 0 30px 0;
	border: 5px solid brown;
	width: 1000px;
}
.content {
	margin: auto;
	margin-top: 10px;
	padding: 0 30px 30px 30px;
	background-color: #FFFAE3;
	border-radius: 30px;
	width: 1000px;
}
.body {
	margin: auto;
	margin-top: 10px;
	padding: 0 30px 30px 30px;
	border-radius: 30px 0 30px 0;
	background-color: #FFFAE3;
	width: 1000px;
}
#com {
	color: black;
    float: right;
    font-size: 16px;
}
#select {
    display: flex;
    justify-content: center;
}
input[type=button] {
    background-color: #faeec7;
    border-radius: 40px 80px / 80px 40px;
    color: #3b3b3b;
    border: none;
    width: 120px;
    height: 50px;
    font-size: 18px;
    cursor: pointer;
}
input[type=button]:hover {
    background-color: #EBF7FF;
    transition: 0.5s;
}
hr {
    background: #688f4e;
    height: 1px;
    border: 0;
}
#skill {
    padding: 10px;
    font-size: 20px;
    width: fit-content;
    margin: auto;
    border-radius: 40px 80px / 80px 40px;
    background-color: #faeec7;
}
#mb {
	color: black;
}
#container_1 {
   display: inline-block;
}

textarea {
	resize: none;
}

a {
	font-weight: bold;
}

</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<form id="view">
		<div class="wrap">
	        <div class="head">
		        <b style='font-size: 16px;'>작성자:</b><b style='font-size: 16px;'>${data.id }</b><b id="com">${data.comdate }</b><br>
		        <h1>${data.title }</h1>
			</div>
	        <div class="content">
	        	<b>프로젝트를 소개할게요.</b>
	            <pre><c:out value="${data.content }"/></pre>
	        </div>
	        <div class="body">
	        	<b>이런 스킬들을 사용했어요.</b><br><br>
	        <c:forEach var="selectedSkill" items="${data.skill}">
	            <div style="display:inline" id="skill">${selectedSkill}</div>
	        </c:forEach>
	        <br><br><br>
	        <b>함께 진행한 팀원들을 소개할게요.</b>
	        <p id="mb">${data.members }</p>
	        <br><br>
	        <b>Tag</b>
	        <p>${data.tag }</p>
	        </div>
	        <br>
	        <div id="select">
				<input type="button" value="목록" onclick="location.href='../ggiriComplete/completeList'"> &nbsp;
			</div>
	    </div>
	</form>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>