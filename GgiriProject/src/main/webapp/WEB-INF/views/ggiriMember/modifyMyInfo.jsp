<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyMyInfo</title>
<style>
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
	margin: 0 auto;
}
.sub {
	width: 1000px;
	margin: 0 auto;
}
#button1{
	background-color: #B2CCFF;
    color: black;
    border: none;
    width: 145px;
    height: 50px;
    font-size: 18px;     
    border-radius: 9999px;
    cursor: pointer;
    text-align: center;
}
#button1:hover{
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
<script>

$(function(){

	$("#id").blur(function(){
		if($("#id").val() == "") { 
			$(".successIdChk").text("아이디를 입력해주세요.");
			$(".successIdChk").css("color", "red");
			$("#idDoubleChk").val("false");
			return;
		}
	});
	
	$("#id").keyup(function(){
		var contextPath = "${pageContext.request.contextPath}";
		var id = $("#id").val();
		if(id == "" || id.length < 2) {
			$(".successIdChk").text("아이디는 2자 이상 8자 이하로 설정해주세요");
			$(".successIdChk").css("color", "red");
			$("#idDoubleChk").val("false");
		} else {
			$.ajax({
				url : contextPath + '/ggiriMember/IdCheck?id=' + id,
				type : 'post',
				cache : false,
				success : function(data) {
					if(data == 0){
						$(".successIdChk").text("사용가능한 아이디 입니다.");
						$(".successIdChk").css("color", "blue");
						$("#idDoubleChk").val("true");
					} else {
						$(".successIdChk").text("사용중인 아이디 입니다.");
						$(".successIdChk").css("color", "red");
						$("#idDoubleChk").val("false");
					}
				},
				error : function(){
					console.log("실패");
				}
			});
		}
	
	});
	
	$("#pwd").blur(function(){
		if($("#pwd").val() == "") { 
			$(".successPwd").text("비밀번호를 입력해주세요.");
			$(".successPwd").css("color", "red");
			return;
		} else {
			$(".successPwd").text("");
			return;
		}
	});
	
	$("#tel").blur(function(){
		var contextPath = "${pageContext.request.contextPath}";
		var tel = $("#tel").val();
			
		$.ajax({
			url : contextPath + "/ggiriMember/telCheck?tel=" + tel,
			type : "GET",
			cache : false,
			success : function(data) {
				if(data == 0){
					$(".successTelChk").text("");
					$("#telDoubleChk").val("true");
				} else {
					$(".successTelChk").text("이미 가입 되어있는 휴대폰번호 입니다.");
					$(".successTelChk").css("color", "red");
					$("#telDoubleChk").val("false");
				}
			},
			error : function(){
				console.log("실패");
			}
		});
	});
	
	$("#birth").blur(function(){
		var birth = $("#birth").val();
		if(birth.length < 8) { 
			$(".successBirthChk").text("sns 사용자는 생년월일은 8자로 입력해주세요.");
			$(".successBirthChk").css("color", "red");
			$("#birthChkResult").val("false");
			return;
		} else {
			$(".successBirthChk").text("");
			$("#birthChkResult").val("true");
			return;
		}
	});
	
	$("#addr3").blur(function(){
		if($("#addr1").val() != "" && $("#addr2").val() != "" && $("#addr3").val() != ""){
			$(".successAddrChk").text("");
			$("#addrChk").val("true");
		} else {
			$(".successAddrChk").text("주소는 필수 입력사항 입니다.");
			$(".successAddrChk").css("color", "red");
			$("#addrChk").val("false");
		}
	});
	
	$("#email").blur(function(){
		if($("#email").val() == "") { 
			$(".successEmail").text("이메일을 입력해주세요.");
			$(".successEmail").css("color", "red");
			return;
		}
	});
	
	
	$("#button1").click(function(){
		var rv = true;
		var addr = $("#addr1").val() + $("#addr2").val() + $("#addr3").val();
		
		
		if($("#addrChk").val() != "true"){
			alert("주소를 확인해주세요.");
			return rv = false;
		}
		
		$("input[name=addr]").val(addr);
		
		alert($("#id").val() + "님의 정보수정을 완료했습니다.");
		return rv;
	});
});

function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
			var addr="";
			// R : 도로명, J : 지번
			if(data.userSelectedType=='R'){
				addr = data.roadAddress
			}
			else{
				addr = data.jibunAddress
			}
			$("#addr1").val(data.zonecode)
			$("#addr2").val(addr)
			$("#addr3").focus()
        }
    }).open();
}

</script>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
		<br>
		<h1 id="title">내 정보 수정</h1>
			<c:if test="${ggiriMemberInfo != null }">
				<form id="modify_my_info" action="modifyResult" method="post">
				<table>
					<tr>
						<th> 이름 </th>
						<td>
							<input type="text" name="name" id="name" placeholder="이름" maxlength="10" autocomplete="none" value="${ggiriMemberInfo.name}">
						</td>
					</tr>
					<tr>
						<th> 아이디 </th>
						<td>
							<input type="text" name="id" id="id" placeholder="아이디" maxlength="10" autocomplete="none" value="${ggiriMemberInfo.id}"><br>
							<span class="point successIdChk"></span>
							<input type="hidden" id="idDoubleChk" value="false">
						</td>
					</tr>
					<tr>
						<th> 비밀번호 </th>
						<td>
							<input type="password" name="pwd" id="pwd" placeholder="비밀번호" value="${ggiriMemberInfo.pwd}"><br>
						</td>
					</tr>
					<tr>
						<th> 생년월일 </th>
						<td>
							<input type="text" name="birth" id="birth" maxlength="8" placeholder="ex)19901231" value="${ggiriMemberInfo.birth}"><br>
								<span class="point successBirthChk"></span>
							<input type="hidden" id="birthChkResult" value="false">
						</td>
					</tr>
					<tr>
						<th> 성별 </th>
						<td>
							<c:if test="${ggiriMemberInfo.gender == 'M'}">
								<label for="man"> 남자 </label>
								<input type="radio" class="hidden" name="gender" id="man" value="M" checked>
								<label for="woman"> 여자 </label>
								<input type="radio" class="hidden" name="gender" id="woman" value="F">
							</c:if>
							<c:if test="${ggiriMemberInfo.gender == 'F'}">
								<label for="man"> 남자 </label>
								<input type="radio" class="hidden" name="gender" id="man" value="M">
								<label for="woman"> 여자 </label>
								<input type="radio" class="hidden" name="gender" id="woman" value="F" checked>
							</c:if>
						</td>
					</tr>
					<tr>
						<th> E-mail </th>
						<td>
							<input type="text" name="email" id="email1" placeholder="E-mail 입력" value="${ggiriMemberInfo.email}" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th> Tel </th>
						<td>
							<input type="text" name="tel" id="tel" size="10" maxlength="13" value="${ggiriMemberInfo.tel}">
							<span class="point successTelChk"></span>
							<input type="hidden" id="telDoubleChk" value="false">
						</td>
					</tr>
					<!-- 
					<tr>
						<th> 핸드폰 인증확인 </th>
						<td>
							<input type="text" name="userTelChk" id="userTelChk"><br>
							<span class="point successTelChk">※ 핸드폰 번호 입력 후 인증번호 클릭 </span>
							<input type="hidden" id="telDoubleChk">
						</td>
					</tr>
					 -->
					<tr>
						<th> 주소 </th>
						<td>
							<input type="text" id="addr1" name="addr" placeholder="우편번호" readonly>
							<input type="button" id="daumAddr" size="20" class="btn btn-info" value="우편번호 찾기" onclick="daumPost()"><br>
							<input type="text" id="addr2" placeholder="주소" size="33" readonly><br>
							<input type="text" id="addr3" placeholder="상세주소"size="33" ><br>
							<span class="point successAddrChk"></span><br>
							<input type="hidden" id="addrChk" value="false">
						</td>
					</tr>
				</table>
				<div class="sub">
					<span class="point">※ sns 사용자는 비어있는 칸들을 채워주세요.</span><br><br>
					<div class="but">
						<input type="submit" id="button1" value="내 정보 수정">
					</div>
				</div>
			</form>
		</c:if>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>