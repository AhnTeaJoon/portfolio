<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminReplyList</title>
<style type="text/css">

table tr th, td{
	border-bottom: 1px solid gray;
	border-radius: 10px;
	line-height: 40px;
}

.wrap{
	width: 1000px;
	margin: auto;
	text-align: left;
}
.skill{
	font-family: 'IBM Plex Sans KR', sans-serif;
	display: inline-block;
}
div{
	margin-right: auto;
	margin-left: auto;
}
form{
	float:left; 
	margin-right: 15px;
}
.box_area{
	border: 1px solid white;
	width: 1000px;
	height: 200px;
}

.h3{
	padding: 10px 15px;
	font-size: 15px;
	text-align: center;
	background-color: white;
	border-color: gray;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
.h3:hover{
	background-color: #EAEAEA;
	border-color: black;
	cursor: pointer;
}
#id{
	border: 1px solid white;
	background-color: blue;
	text-weight: bold;
	width: 300px; 
	height: 300px;
	text-align: center;
	color: white;
	font-size: 30px;
}
.freeTxt {
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
	float:left;
}
div #h{
	font-size: 24px;
	font-weight: bolder;
}
a{
	text-decoration: none;
	color: white;
}
#freeInput {
 	border-radius: 15px;
	font-size: 15px;
	padding-top: 5px;
	padding-bottom: 5px;
	float: right;
    min-height: 50px; 
    min-width: 170px;
	font-family: 'IBM Plex Sans KR', sans-serif;
	cursor: pointer;
}
#freeInput:hover {
	background-color: white;
	transition: 0.5s;
}

#freeDel {
		color: white;
		font-weight: bold;
}

.delDiv {
		cursor: pointer;
}

h1 {
	border: 1px solid orange;
	border-radius: 30px;
	width: 80%;
	height: 80px;
	padding-top: 50px;
	margin: 0 auto;
	background: orange;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	
	function repDelete(no) {
		
		var result = confirm("선택한 댓글을 삭제 하시겠습니까?");
		
		if(result == true){
			
			$.ajax({
				
				url : contextPath + "/ggiriAdmin/repDelete?no=" + no,
				type : "GET",
				success : function(data){
					if(data == 'OK'){
						location.href="/root/ggiriAdmin/adminReplyList";
					} else {
						alert("프로젝트 삭제 실패");
						location.href="/root/ggiriAdmin/adminReplyList";
					}
				},
				error : function(){
					console.log("프로젝트 삭제 오류");
				}
			});
		} else {
			result = false;
		}
				
	}
		
</script>
</head>
<body>
	<c:import url="../defaultAdmin/header.jsp"/>
 		<br>
 		<div class="wrap">
			<div class="freeTxt">
				<p>끼리가 보증하는 IT파트너</p>
				<p id="h">관리자 페이지 입니다.<br>
				등록된 댓글 목록을 확인하세요.</p>
				<br>
			</div>
			<br><br><br><br><br>
			<div style="text-align: center;">
				<h1 style="margin-right: auto; padding-bottom: 30px;"> GGIRI <b style="color: red;">관리자</b> 댓글관리 페이지 </h1><br>
				<table style="margin: auto; width: 100%;">
					<tr>
						<th>회원ID</th><th>프로젝트 글 번호</th><th>댓글 번호</th><th>댓글 내용</th><th>댓글 삭제</th>
					</tr>
					<c:forEach var="list" items="${adminReplyList }">
						<tr>
							<td>${list.id }</td><td>${list.bno }</td><td>${list.no }</td><td>${list.content }</td>
							<td>
								<div class="delDiv" style="border: 1px solid red; border-radius: 12px; background: red;" onclick="repDelete('${list.no}')">
									<span id="freeDel"> 삭제 </span>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	<c:import url="../defaultAdmin/footer.jsp"/>
</body>
</html>