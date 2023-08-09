<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>failLogin</title>
</head>
<body>
	<script type="text/javascript">
		window.onload = function(){
			alert("잘못된 아이디, 비밀번호 입니다.");
			location.href="ggiriLogin";
		}
	</script>
</body>
</html>