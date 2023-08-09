<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div class="wrap modify_form">
	<h1>문의사항 수정</h1>
		<div class="modify">
			<form action="../ggiriHelp/modify" method="post">
				<input type="hidden" name="helpNo" value="${data.helpNo }">
				<c:if test="${loginUser != null}">
				<b> 작성자 </b><br>
				<input type="text" name="id" value="${loginUser }" readonly><br>
				</c:if>
				<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
				<b> 작성자 </b><br>
				<input type="text" name="id" id="id" value="${data.id }" readonly>
				</c:if>
				<br>
				<b> 제 목 </b><br>
				<input type="text" name="title" size="50" value="${data.title }"><br>
				<b> 내 용 </b><br>
				<textarea rows="20" cols="100" name="content">${data.content }</textarea><br>
				<br><br><br>
				<input type="submit" value="수정완료"> &nbsp;
				<input type="button" value="프로젝트 목록" onclick="location.href='../ggiriHelp/helpView'">
			</form>
		</div>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>