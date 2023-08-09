<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>allMember</title>
<style type="text/css">

	table tr th, td{
		border-bottom: 1px solid gray;
		border-radius: 10px;
		line-height: 40px;
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
	
	.delDiv {
		cursor: pointer;
	}
	
	#memberDel {
		color: white;
		font-weight: bold;
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
	
	.wrap {
		width: 1100px;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	
	function memberDelete(id) {
		
		var result = confirm("선택한 회원을 삭제 하시겠습니까?");
		var deleteId = id;
		
		if(result == true){
			
			$.ajax({
				
				url : contextPath + "/ggiriAdmin/memberDelete?deleteId=" + deleteId,
				type : "GET",
				success : function(data){
					if(data == 'OK'){
						location.href="/root/ggiriAdmin/allMember";
					} else {
						alert("회원삭제 실패");
						location.href="/root/ggiriAdmin/allMember";
					}
				},
				error : function(){
					console.log("회원 삭제 실패");
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
				가입된 유저 정보를 확인하세요.</p>
				<br>
			</div>
			<br><br><br><br><br><br><br><br>
			<div style="text-align: center;">
				<h1 style="margin-right: auto; padding-bottom: 30px;"> GGIRI <b style="color: red;">관리자</b> 회원관리 페이지 </h1><br>
				<table style="margin: auto; width: 100%;">
					<tr>
						<th>회원이름</th><th>회원ID</th><th>비밀번호</th><th>생년월일</th><th>성별</th><th>이메일</th><th>전화번호</th><th>주소</th><th>회원삭제</th>
					</tr>
					<c:forEach var="list" items="${allMember }">
						<tr>
							<td>${list.name }</td><td>${list.id }</td><td>${list.pwd }</td><td>${list.birth }</td><td>${list.gender }</td><td>${list.email }</td><td>${list.tel }</td><td>${list.addr }</td>
							<td>
								<div class="delDiv" style="border: 1px solid red; border-radius: 12px; background: red;" onclick="memberDelete('${list.id}')">
									<span id="memberDel"> 삭제 </span>
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