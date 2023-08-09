<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<style type="text/css">
a{
   text-decoration: none;
   color: black;
   font-weight: bold;
}

div{
	font-family: 'IBM Plex Sans KR', sans-serif;
	margin-right: auto;
	margin-left: auto;
}

</style>
</head>
<body>
	<div class="wrap">
		<c:import url="default/banner.jsp"/>
		<c:import url="default/header.jsp"/>
		<c:import url="default/body.jsp"/>
		<c:import url="/ggiriProject/rank"/>
		<c:import url="default/footer.jsp"/>
	</div>
</body>
</html>