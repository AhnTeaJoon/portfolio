<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login.jsp</title>
<style type="text/css">
.ggiriPage {
	width: 1200px;
}
.ggiriPage login {
	text-align: left;	
	font-family: 'IBM Plex Sans KR', sans-serif;
}
.ggiriLoginTxt {
	text-align: center;
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
}
.ggiriLogin {
	border-radius: 40px;
	background-color: #EBF7FF;
	height: 270px;
}

.ggiriLogin submit {
	background-color: #FA8072;
    color: white;
    border:none; 
    border-radius:15px; 
    min-height: 30px; 
    min-width: 75px;
   	font-family: 'IBM Plex Sans KR', sans-serif; 
   	cursor: pointer;
}

#signup {
    background-color: #FA8072;
    color: white;
    border:none; 
    border-radius:15px; 
    min-height: 30px; 
    min-width: 75px;
   	font-family: 'IBM Plex Sans KR', sans-serif; 
   	cursor: pointer;
}

#signup:hover {
      background-color:#FFA07A;
      transition: 0.5s;
}
#login {
	background-color: #FA8072;
    color: white;
    border:none; 
    border-radius:15px; 
    min-height: 30px; 
    min-width: 75px;
   	font-family: 'IBM Plex Sans KR', sans-serif; 
   	cursor: pointer;
}
#login:hover {
	background-color:#FFA07A;
    transition: 0.5s;
}
#findIdPwd {
	background-color:#FFA07A;
	color: white;
    border:none; 
    border-radius:15px; 
    min-height: 30px; 
    min-width: 163px;
   	font-family: 'IBM Plex Sans KR', sans-serif; 
   	cursor: pointer;
}
#findIdPwd:hover {
	background-color: #FA8072;
	transition: 0.5s;
}

.button-login {
	cursor: pointer;
	margin-top: 20px;
}

.loginPageSize {
	width: 1250px;
	height: 530px;
	margin: 0 auto;
}

#snsLogin > a > img {
	margin: 0;
	padding: 2px;
}
a {
	text-decoration: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>

</script>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="loginPageSize">
		<div class="ggiriPage">
			<br>
			<h1 id="loginTitle">Login</h1>
			<br>
			<div class="ggiriLoginTxt"><br>
				함께 나눌수록 더욱 커지는 가치,<br>
				IT 전문가 세상 '끼리'에 오신것을 환영합니다.
				<br><br>
				'끼리'는 스펙업을 필요로 하는<br>
				 개발자분들을<br>
				연결합니다
				<br><br>
				<div class="ggiriLogin">
					<br>
					<form action="${contextPath }/ggiriMember/login_check" method="post">
						<label style="padding-right: 20px;"> 아이디 </label>
						<input type="text" name="id" placeholder="ID" style="border: 1px solid #EBF7FF; border-radius: 40px; width:300px; height: 40px; text-indent: 13px;"><br>
						<br>
						<label style="padding-right: 10px;"> 비밀번호 </label>
						<input type="password" name="pwd" placeholder="PASSWORD" style="border: 1px solid #EBF7FF; border-radius: 40px; width:300px; height: 40px; text-indent: 13px;"><br>
						<br>
						<input type="submit" id="login" value="로그인"> &nbsp;
						<button class="signup" id="signup" type="button" onclick="location.href='${contextPath}/ggiriMember/signup_free'">회원가입</button>
						<br><br>
						<button class="findIdPwd" id="findIdPwd" type="button" onclick="location.href='${contextPath }/ggiriMember/findIdPwd'">아이디/비밀번호 찾기</button>
					</form>
					<br>
				</div>
				<br>
				<div id="snsLogin" align ="center" >
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=0bc794d215c15ba457b2eb709fecd070&redirect_uri=http://localhost:8080/root/ggiriMember/kakao_callback&response_type=code">
			    		<img src="https://play-lh.googleusercontent.com/Ob9Ys8yKMeyKzZvl3cB9JNSTui1lJwjSKD60IVYnlvU2DsahysGENJE-txiRIW9_72Vd" class="button-login" width="50px" height ="50px" style="border-radius: 10px;" />
			    	</a> &nbsp;
			    	<a href="${contextPath }/ggiriMember/naver_login">
			    		<img src="https://play-lh.googleusercontent.com/jYtnK__ibJh9emODIgTyjZdbKym1iAj4RfoVhQZcfbG-DuTSHR5moHVx9CQnqg1yoco9" class="button-login" width="50px" height ="50px" style="border-radius: 10px;" />
			    	</a> &nbsp;
			    	<a href="https://accounts.google.com/o/oauth2/v2/auth?client_id=15714476982-d6tnk6tv8f7hptqjh6qrhqsm42aglq72.apps.googleusercontent.com&redirect_uri=http://localhost:8080/root/ggiriMember/google_callback&response_type=code&scope=email%20profile%20openid&access_type=offline">
			    		<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/800px-Google_%22G%22_Logo.svg.png" class="button-login" width= "50px" height= "50px">
			    	</a>
	   			</div>
			</div>
		</div>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>

