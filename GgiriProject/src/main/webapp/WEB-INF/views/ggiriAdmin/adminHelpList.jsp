<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminHelpList</title>
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

#helpDel, #helpRep {
		color: white;
		font-weight: bold;
}

.delDiv, .repDiv {
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
	
	function helpDelete(no) {
		
		var result = confirm("선택한 문의사항을 삭제 하시겠습니까?");
		
		if(result == true){
			
			$.ajax({
				
				url : contextPath + "/ggiriAdmin/helpDelete?helpNo=" + no,
				type : "GET",
				success : function(data){
					if(data == 'OK'){
						location.href="/root/ggiriAdmin/adminHelpList";
					} else {
						alert("회원삭제 실패");
						location.href="/root/ggiriAdmin/adminHelpList";
					}
				},
				error : function(){
					console.log("회원 삭제 오류");
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
				등록된 고객센터문의 목록을 확인하세요.</p>
				<br>
			</div>
			<br><br><br><br><br>
			<div style="text-align: center;">
				<h1 style="margin-right: auto; padding-bottom: 30px;"> GGIRI <b style="color: red;">관리자</b> 고객센터문의 페이지 </h1><br>
				<table style="margin: auto; width: 100%;">
					<tr>
						<th> 문의 번호 </th><th> 회원ID </th><th> 문의 제목 </th><th> 문의 내용 </th><th> 등록날짜 </th><th> 답변 달기 </th><th> 문의 글 삭제</th>
					</tr>
					<c:forEach var="list" items="${adminHelpList }">
						<tr>
							<td>${list.helpNo }</td><td>${list.id }</td><td>${list.title }</td><td>${list.content }</td><td>${list.helpDate }</td>
							<td>
								<div class="repDiv" style="border: 1px solid blue; border-radius: 12px; background: blue;">
									<span id="helpRep" onclick="location.href='/root/ggiriHelp/helpView?helpNo=${list.helpNo}'"> 답변달기 </span>
								</div>
							</td>
							<td>
								<div class="delDiv" style="border: 1px solid red; border-radius: 12px; background: red;" onclick="helpDelete('${list.helpNo}')">
									<span id="helpDel"> 삭제 </span>
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