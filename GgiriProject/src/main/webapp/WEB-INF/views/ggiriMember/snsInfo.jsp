<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myInfo</title>
<style type="text/css">
table {
	width: 1000px;
	margin: 0 auto;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
table th {
	text-align: center;
}
table th,td {
	border-bottom: 2px solid gray;
	padding: 20px 0 20px 0;
}

table td {
	padding: 5px 0 7px 8px;
	text-align: center;
	width: 700px;
}
.wrap {
	width: 1200px;
	margin: auto;
}
input[type=button] {
	background-color: #B2CCFF;
    color: black;
    border: none;
    width: 145px;
    height: 50px;
    font-size: 18px;     
    border-radius: 9999px;
    font-family: 'IBM Plex Sans KR', sans-serif;
    cursor: pointer;
}
input[type=button]:hover {
    background-color: #EBF7FF;
    transition: 0.5s;
}
button[type=button] {
	background-color: #B2CCFF;
    color: black;
    border: none;
    width: 145px;
    height: 50px;
    font-size: 18px;     
    border-radius: 9999px;
    font-family: 'IBM Plex Sans KR', sans-serif;
    cursor: pointer;
}

button[type=button]:hover {
    background-color: #EBF7FF;
    transition: 0.5s;
}

.but {
    display: flex;
    justify-content: center;
}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
	
	function withdrawal() {
		
		var contextPath = "${pageContext.request.contextPath}";
		var id = $("#memberId").val();
		var result = confirm("회원탈퇴를 하시겠습니까?");
		
		if(result == true){
			
			$.ajax({
				
				url : contextPath + "/ggiriMember/memberWithdraw?withdrawId=" + id,
				type : "GET",
				success : function(data){
					if(data == 'OK'){
						alert("회원탈퇴 성공!");
						location.href="/root/index";
					} else {
						alert("회원삭제 실패");
						location.href="/root/index";
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
<meta charset="UTF-8">
<title>snsInfo</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
	<br>
		<h1 id="title">내정보</h1>
		<table>
			<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
				<tr>
					<th> 이름 </th>
					<td>
						${ggiriSnsInfo.name }
					</td>
				</tr>
				<tr>
					<th> 아이디 </th>
					<td>
						<input type="hidden" id="memberId" name="memberId" value="${ggiriSnsInfo.id }">
						${ggiriSnsInfo.id }
					</td>
				</tr>
				<tr>
					<th> 생년월일 </th>
					<td>
						${ggiriSnsInfo.birth }
					</td>
				</tr>
				<tr>
					<th> 성별 </th>
					<td>
						${ggiriSnsInfo.gender }
					</td>
				</tr>
				<tr>
					<th> E-mail </th>
					<td>
						${ggiriSnsInfo.email }
					</td>
				</tr>
				<tr>
					<th> Tel </th>
					<td>
						${ggiriSnsInfo.tel }
					</td>
				</tr>
				<tr>
					<th> 주소 </th>
					<td>
						${ggiriSnsInfo.addr }
					</td>
				</tr>
			</c:if>
		</table><br>
		<div class="but">
			<input type="button" value="정보 수정" onclick="location.href='../ggiriMember/modifySnsInfo'"> &nbsp;
			<button type="button" id="withdrawal" name="withdrawal" onclick="withdrawal()"> 회원 탈퇴 </button>
		</div>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>