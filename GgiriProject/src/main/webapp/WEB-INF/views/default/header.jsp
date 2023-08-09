<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<style type="text/css">
* {
	margin: 0;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
.wrapHead{
	width: 1820px;
	margin: auto;
	text-align: left;
	padding: 0 48px;
}
/* .header {
	width: px;
	background-color: white;
} */
.navdiv {
	margin: 0 auto;
}
nav {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 1800px;
	border-radius: 40px;
	border: 2px solid navy;
}
nav ul {
	list-style: none;
	display: flex;
	justify-content: end;
}
nav ul li {
	padding: 10px;	
}
nav ul li:last-child{
	padding-right: 30px;
}

nav ul a {
	padding: 10px;
	text-decoration: none;
	color: black;
}
nav ul li a {
	display: flex;
	text-decoration: none;
	color: black;
}
nav ul li a:hover {
	/* color: #D8D8D8; */
}
.subImg {
    /* max-width: 100%; */
    width: 30px;
}
.subImg-hover {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 40px;
    display: none;
}
.subImg:hover .subImg-hover {
    display: block;
}
.subButton{
	padding: 6.5px 0 0 0;
	background-color: white;
	width: 30px;
	height: 30px;
	border: none;
    margin: 0px auto;
 	position: relative;
	display: inline-block;
	cursor: pointer;
}
.dropdown {
	width: 30px;
	height: 30px;
    margin: 0px auto;
}
#drop-content{
    position: absolute;
    z-index: 1;
    min-width: 85px;
    filter: brightness(1);
    cursor: pointer;
}
#drop-content a{
    display:block;
    font-size: 14px;
    background-color: #F6F6F6;
    color: black;
    text-decoration: none;
    padding: 10px 36px;
    margin: 5px 0 5px 10px;
}
#drop-content a:hover {
	filter: brightness(0.5);
}
#kakao {
	display:block;
    font-size: 14px;
    background-color: #FAED7D;
    color: black;
    text-decoration: none;
    padding: 10px 36px;
    margin: 5px 0 5px 10px;
}
#kakao:hover {
	filter: brightness(0.5);
}
#naver{
	display:block;
    font-size: 14px;
    background-color: #CEF279;
    color: black;
    text-decoration: none;
    padding: 10px 36px;
    margin: 5px 0 5px 10px;
}
#naver:hover {
	filter: brightness(0.5);
}
#google {
	display:block;
    font-size: 14px;
    background-color: #ffffff;
    color: black;
    text-decoration: none;
    padding: 10px 36px;
    margin: 5px 0 5px 10px;
}
#google:hover {
	filter: brightness(0.5);
}
#ggiri {
	display:block;
    font-size: 14px;
    background-color: #E8D9FF;
    color: black;
    text-decoration: none;
    padding: 10px 36px;
    margin: 5px 0 5px 10px;
}
#ggiri:hover {
	filter: brightness(0.5);
}
body {
 	background: white;
}

.nav-dots {
  width: 100%;
  bottom: 9px;
  height: 11px;
  display: block;
  position: absolute;
  text-align: center;
}

.nav-dots .nav-dot {
  top: -5px;
  width: 11px;
  height: 11px;
  margin: 0 4px;
  position: relative;
  border-radius: 100%;
  display: inline-block;
  background-color: rgba(0, 0, 0, 0.6);
}

.nav-dots .nav-dot:hover {
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.8);
}
</style>
</head>
<body style="overflow-x: hidden">
	<!-- // wrap -->
	<div class="navdiv">
		<div class="wrapHead">
			<a href="/root/index"><img width="300px" height="90px" src="/root/resources/image/logo6.png"></a>
			<nav>
				<ul>
					<c:if test="${loginUser == 'GGIRIADMIN'}">
						<li><a href="/root/indexAdmin"> 관리자 페이지 </a></li>
					</c:if>
					<li><a href="/root/ggiriMember/memberList"> 프리랜서 보기 </a></li>
					<li><a href="/root/ggiriProject/projectList"> 프로젝트 보기 </a></li>
					<li><a href="/root/ggiriComplete/completeList"> 완성된 프로젝트 </a></li>
					<li><a href="/root/ggiriHelp/helpList"> 고객센터 </a></li>
					
					<li>
						<div class="dropdown"> 
							<button onclick="dp_menu()" class="subButton">
								<img class="subImg" src="/root/resources/image/menu1.png">
							</button>
						        <div style="display: none;" id="drop-content">
							        <c:if test="${loginUser != null}">
										<b id="ggiri">Ggiri 접속</b>
									</c:if>
						        	<c:if test="${loginUser == 'GGIRIADMIN'}">
										<b style="text-indent: 20px; padding-left: 18px;"> 관리자 계정 접속</b><br>
							            <a href='/root/ggiriMember/myInfo'>내 정보</a>
							            <a href="/root/ggiriMember/ggiriLogout">LOGOUT</a>
							        </c:if>
							        <c:if test="${loginUser != 'GGIRIADMIN' && loginUser != null}">
							            <a href='/root/ggiriMember/myInfo'>내 정보 ✌︎</a>
							            <a href="/root/ggiriProject/heartList">찜 목록 ꯁ</a>
							            <a href="/root/ggiriMember/ggiriLogout">LOGOUT</a>
							        </c:if>   
							        <c:if test="${kakaoMember != null}">
										<b id="kakao">Kakao 접속</b>
										<a href="/root/ggiriMember/snsInfo">내 정보 ✌︎</a>
										<a href="/root/ggiriProject/heartList">찜 목록 ꯁ</a>
										<a href="/root/ggiriMember/kakaoLogout">LOGOUT</a>
									</c:if>	
									<c:if test="${naverMember != null}">
										<b id="naver">Naver 접속</b>
										<a href="/root/ggiriMember/snsInfo">내 정보 ✌︎</a>
										<a href="/root/ggiriProject/heartList">찜 목록 ꯁ</a>
										<a href="/root/ggiriMember/naverLogout">LOGOUT</a>
									</c:if>
									<c:if test="${googleMember != null}">
										<b id="google">Google 접속</b>
										<a href="/root/ggiriMember/snsInfo">내 정보 ✌︎</a>
										<a href="/root/ggiriProject/heartList">찜 목록 ꯁ</a>
										<a href="/root/ggiriMember/googleLogout">LOGOUT</a>
									</c:if>
									<c:if test="${kakaoMember == null && loginUser == null && naverMember == null && googleMember == null}">
										<a href="/root/ggiriMember/ggiriLogin"> LOGIN </a>
									</c:if>
				       			</div>
			       		</div>
		       		</li>
				</ul>
			</nav>
			<br><br>
		</div>
	</div>
	<!-- // navdiv -->
	<script>
        function dp_menu(){
            let click = document.getElementById("drop-content");
            if(click.style.display === "none"){
                click.style.display = "block";
 
            }else{
                click.style.display = "none";
 
            }
        }
    </script>
</body>
</html>