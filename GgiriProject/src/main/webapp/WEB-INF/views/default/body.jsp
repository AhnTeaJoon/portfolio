<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="kr" dir="ltr">
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<title>body</title>
<style type="text/css">
body{
    margin: 0;
    padding: 0;
    background-color: #fff;
    width: 1920px;
}

div{
	font-family: 'IBM Plex Sans KR', sans-serif;
	margin-right: auto;
	margin-left: auto;
}

.search-box{
    padding: 10px;
    position: absolute;
    margin: 0 auto;
	left: 950px;
    transform: translate(-50%,-50%);
    height: 30px;
    background-color: #fff;
    border: 4px solid navy;
    border-radius: 30px;
    transition: 0.4s;
    width: 30px;
}
.search-box:hover{
    box-shadow: 0px 0px .5px 1px navy;
    width: 282px;
}
.search-btn{
    text-decoration: none;
    float: right;
    width: 30px;
    height: 30px;
    background-color: #fff;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    color: navy;
}
.search-box:hover > .search-btn{
    background-color: #fff;
}
.search-txt{
    display: flex;
    padding: 0;
    width: 0px;
    border:none;
    background: none;
    outline: none;
    float: left;
    font-size: 1rem;
    line-height: 30px;
    transition: .4s;
}
.search-box:hover > .search-txt{
    width: 240px;
    padding: 0 6px;
    cursor: pointer;
}
.background {
   	background-image: url('resources/image/mainBack.jpg');
}
.banner-txt {
	font-size: 2rem;
	line-height: 35px;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
.back button {
    background-color: #FA8072;
    color: white;
    border:none; 
    border-radius:15px; 
    min-height: 40px; 
    min-width: 150px;
   	font-family: 'IBM Plex Sans KR', sans-serif; 
   	cursor: pointer;
}

.back button:hover {
      background-color:#FFA07A;
      transition: 0.5s;
      color: white;
}

.mainBodySize {
	width: 1600px;
}
</style>
<script type="text/javascript">
   
	<!--Start of Tawk.to Script-->

	
	var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
	(function(){
		var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
		s1.async=true;
		s1.src='https://embed.tawk.to/64792a8b74285f0ec46f0cd5/1h1skscbn';
		s1.charset='UTF-8';
		s1.setAttribute('crossorigin','*');
		s0.parentNode.insertBefore(s1,s0);
	})();
	<!--End of Tawk.to Script-->
   
   function searchProject() {
	    var keyword = document.getElementById("searchTxt").value;
	    var url = "/root/ggiriProject/projectList.do?condition=titleContent&keyword=" + encodeURIComponent(keyword);
	    window.location.href = url;
	}
   
   /* function searchSkill() {
	    var keyword = document.getElementById("key").value;
	    var url = "/root/ggiriProject/projectList.do?condition=titleContent&keyword=" + encodeURIComponent(key);
	    window.location.href = url;
	} */
   
</script>
</head>
<body style="overflow-x: hidden">
	<div class="mainBodySize">
		<div class="search-box">
	    	<input type="text" id="searchTxt" name="s" placeholder="어떤 프로젝트를 찾으세요?" class="search-txt" />
		    <a class="search-btn" href="#" onclick="searchProject()">
		        <i class="fas fa-search"></i>
		    </a>
		</div>
		
	    <br><br>
	    <div class="background">
			<div class="back" style="text-align:center; padding-top:8rem; padding-bottom:2rem; font-family: 'IBM Plex Sans KR', sans-serif;">
				<p class="main-banner-text"><br>대한민국 최고<br>
				<span style="color:#f76a22">IT 프리랜서 매칭 플랫폼</span></p><br>
				<p class="banner-txt">
				다양한 동료들과 함께<br>
				새로운 팀을 만들어<br>
				우리 '끼리' 계속 성장하는</p>
	 			<img width="150px" height="45px" alt="" src="resources/image/logo6.png">
				<br>
				<c:if test="${loginUser != null || naverMember != null || kakaoMember != null }">
					<button class="findmem" type="button" onclick="location href='#'">동료 찾기 >></button>			
				</c:if>
				<c:if test="${loginUser == null && naverMember == null && kakaoMember == null }">
					<button class="signup" type="button" onclick="location.href='/root/ggiriMember/signup_free'">프리랜서 회원가입</button>
				</c:if>
				<br><br><br><br><br>
				<br>
			</div>
	    </div>
    </div>
</body>
</html>
