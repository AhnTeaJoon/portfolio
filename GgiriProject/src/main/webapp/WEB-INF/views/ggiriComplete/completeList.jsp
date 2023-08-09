
<!-- ggiriComplete/completeList.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriComplete/completeList.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<style type="text/css">
.board_table{
   width: 1200px;
   margin: auto;
   text-align: left;
}

#h3{
	font-family: 'IBM Plex Sans KR', sans-serif;
	border: hidden;
	color: white;
	background-color: #9cded5;
	margin: 10px;
	padding: 3px 7px;
	display: inline-block;
	font-size: 20px;
	float: right;
}

div {
   font-family: 'IBM Plex Sans KR', sans-serif;
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

h3{
	margin-bottom: 20px;
	font-size: 20px;
	text-align: left;
	border-color: gray;
	font-family: 'IBM Plex Sans KR', sans-serif;
}

#mem {
   padding: 30px;
   border: 2px solid #FFDB37;
   border-radius: 40px;
   background-color: #FFFAE3;
   cursor: pointer;
}

#id{
	border: 1px solid white;
	background-color: blue;
	text-weight: bold;
	width: 300px; 
	height: 300px;
	text-align: center;
	color: black;
	font-size: 30px;
}

div #h{
	font-size: 24px;
	font-weight: bolder;
}

a{
   text-decoration: none;
   color: black;
   font-weight: bold;
}

.freeTxt {
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
	float:left;
}

#button1 {
	width: 60px;
	height: 28px;
	border: none; 
	border-radius: 9999px;
	font-size: 14px;
	background: #B2CCFF;
	font-family: 'IBM Plex Sans KR', sans-serif;
	cursor: pointer;
}

#button1:hover {
	background-color:#EBF7FF;
    transition: 0.5s;
}

#skill {
    padding: 10px;
    font-size: 20px;
    width: fit-content;
    margin: auto;
    font-family: 'IBM Plex Sans KR', sans-serif;
    border-radius: 40px 80px / 80px 40px;
    background-color: #faeec7;
}

.search{
	text-align: center;
}

#comHit {
	font-family: 'IBM Plex Sans KR', sans-serif;
	padding: 5px 20px;
	border-radius: 40px;
	color: gray;
	width: 50px;
	background-color: #FAC4A4;
	font-weight: bold;
	float: right;
	text-align: center;
}

#comHit p {
	font-size: 13px;
}

#title {
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-size: 34px;
}
.completeListSize {
	width: 1400px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<br>
	<div class="completeListSize">
		<div class="freeTxt">
			<p>끼리가 보증하는 IT파트너</p>
			<p id="h">파트너들이 진행한<br>
			프로젝트를 참고해 보세요 :)</p>
		</div>
		<br><br>
		<div class="cal">
			<button id="h3" type="submit" style=" border-radius: 30px;"> 2023 </button> &nbsp;&nbsp;&nbsp;
			<button id="h3" type="submit" style=" border-radius: 30px;"> 2022  </button> &nbsp;&nbsp;&nbsp;
		 	<button id="h3" type="submit" style=" border-radius: 30px;"> 2021 </button> &nbsp;&nbsp;&nbsp;
			<button id="h3" type="submit" style=" border-radius: 30px;"> 2020 </button> &nbsp;&nbsp;
		</div>
		<br><br><hr>
		<div class="board_table">
		<h1></h1>
		<br>
			<div id="devList">
				<c:if test="${completeList.size()==0 }">	
				    <h3>등록된 글이 없습니다</h3>
				</c:if>
				<c:if test="${loginUser == null && kakaoMember == null && naverMember == null && googleMember == null}">
					<c:forEach var="dto" items="${completeList }">
						<div id="mem" onclick="location.href='../ggiriComplete/completeView?completeNum=${dto.completeNum}'">
							<h3>${dto.comdate }</h3>
							<h1>${dto.title }</h1>
							<input type="hidden" id="id" value="${dto.id }">
							<input type="hidden" id="completeNum" value="${dto.completeNum }">
							<input type="hidden" id="comdate" value="${dto.comdate }">
							<%-- <a id="title" href="../ggiriComplete/completeView?completeNum=${dto.completeNum }">${dto.title }</a> --%>
							<div class="skill">
								<br>
				                <c:forEach var="selectedSkill" items="${dto.skill}">
				                    <div style="display:inline" id="skill">${selectedSkill}</div>
				                </c:forEach>
				                <span id="comHit"><p>조회수<p> ${dto.comHit}</span>
							</div>
						</div>
						<br><br>
					</c:forEach>
				</c:if>
				<c:if test="${loginUser != null}">
					<c:forEach var="dto" items="${completeList }">
						<div id="mem" onclick="location.href='../ggiriComplete/completeView?completeNum=${dto.completeNum}'">
							<h3>${dto.comdate }</h3>
							<h1>${dto.title }</h1>
							<input type="hidden" id="id" value="${dto.id }">
							<input type="hidden" id="completeNum" value="${dto.completeNum }">
							<input type="hidden" id="comdate" value="${dto.comdate }">
							<%-- <a id="title" href="../ggiriComplete/completeView?completeNum=${dto.completeNum }">${dto.title }</a> --%>
							<div class="skill">
								<br><br>
				                <c:forEach var="selectedSkill" items="${dto.skill}">
				                    <div style="display:inline" id="skill">${selectedSkill}</div>
				                </c:forEach>
								<span id="comHit"><p>조회수<p> ${dto.comHit}</span>
							</div>
						</div>
						<br><br>
					</c:forEach>
				</c:if>
				<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
					<c:forEach var="dto" items="${completeList }">
						<div id="mem" onclick="location.href='../ggiriComplete/completeView?completeNum=${dto.completeNum}'">
							<h1>${dto.title }</h1>
							<h3>${dto.comdate }</h3>
							<input type="hidden" id="id" value="${dto.id }">
							<input type="hidden" id="completeNum" value="${dto.completeNum }">
							<input type="hidden" id="comdate" value="${dto.comdate }">
							<%-- <a id="title" href="../ggiriComplete/completeView?completeNum=${dto.completeNum }">${dto.title }</a> --%>
							<div class="skill">
								<br><br>
				                <c:forEach var="selectedSkill" items="${dto.skill}">
				                    <div style="display:inline" id="skill">${selectedSkill}</div>
				                </c:forEach>
				                <span id="comHit"><p>조회수<p> ${dto.comHit}</span>
							</div>
						</div>
						<br><br>
					</c:forEach>
				</c:if>
				<form action="projectList.do" method="get">
					<div class="search">
						<select name="condition" id="condition" style="font-family: 'IBM Plex Sans KR', sans-serif">
							<option value="titleContent" <c:if test="${condition eq 'titleContent' }">selected</c:if>>제목 + 본문</option>
							<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
							<option value="id" <c:if test="${condition eq 'id' }">selected</c:if>>작성자</option>
						</select>
						<input type="text" name="keyword" id="keyword" style="font-family: 'IBM Plex Sans KR', sans-serif"
								placeholder="검색어" value="${keyword }"/>
						<button id="button1" type="submit">검색</button>
					</div>
				</form>
			</div>
			<br>
		</div>
	</div>
	<div style="position: fixed; bottom: 30px; right:100px;">
		<a href="#"><img style="width:50px; height: 50px;"src="/root/resources/image/top1.png"></a>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>