
<!-- ggiriComplete/completeModify.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriComplete/completeModify.jsp</title>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div class="wrap com_modify">
	<h1>수정</h1>
		<div class="modify">
			<form action="../ggiriComplete/modify" method="post">
				<input type="hidden" name="completeNum" value="${data.completeNum }">
				<input type="hidden" name="memberNum" value="${data.completeNum }">
				<b> 작성자 </b><br>
				<input type="text" name="id" size="50" value="${loginUser }"><br>
				<b> 제 목 </b><br>
				<input type="text" name="title" size="50" value="${data.title }"><br>
				<b> 내 용 </b><br>
				<textarea rows="20" cols="100" name="content">${data.content }</textarea><br>
				<b> 스 킬 </b><br>
				<textarea rows="20" cols="100" name="skill">${data.skill }</textarea><br>
				<b> 멤 버 </b><br>
				<input type="text" name="members" size="50" value="${data.members }"><br>
				<b> 태 그 </b><br>
				<input type="text" name="tag" size="50" value="${data.tag }"><br>
				<br>
				<input type="submit" value="등록"> &nbsp;
			</form>
		</div>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>