<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projectList.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<style type="text/css">
.board_table{
   width: 1200px;
   margin: auto;
   text-align: left;
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
   font-size: 20px;
   text-align: left;
   border-color: gray;
   font-family: 'IBM Plex Sans KR', sans-serif;
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

.freeTxt {
   font-family: 'IBM Plex Sans KR', sans-serif;
   font-weight: bold;
   float:left;
}

div {
   font-family: 'IBM Plex Sans KR', sans-serif;
   margin-right: auto;
   margin-left: auto;
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

#title {
   font-size: 23px;
}

#mem {
   height: 230px;
   padding: 30px;
   border: 2px solid navy;
   background-color: #EBF7FF;
   border-radius: 50px;
   cursor: pointer;
}

#project_1 {
	font-family: 'IBM Plex Sans KR', sans-serif;
	padding: 5px 20px;
	margin: auto;
	border-radius: 40px;
	color: white;
	width: 55px;
	background-color: blue;
	font-weight: bold;
	float: right; 
	text-align: center;
}

#project_2 {
	font-family: 'IBM Plex Sans KR', sans-serif;
	padding: 5px 20px;
	margin: auto;
	border-radius: 40px;
	color: white;
	width: 55px;
	background-color: red;
	font-weight: bold;
	float: right;
	text-align: center;
}

#skill {
    padding: 10px;
    font-size: 20px;
    width: fit-content;
    float: left;
    margin: auto;
    font-family: 'IBM Plex Sans KR', sans-serif;
    border-radius: 40px 80px / 80px 40px;
    background-color: #b6d0e1;
}

#job {
     padding: 5px;
     font-size: 14px;
     width: fit-content;
     border-radius: 40px;
     border: 1px solid #4374D9;
     float: left;
     margin: 5px 0 -5px 0;
}

#projectViewID {
	font-size: 20px;
	font-weight: bold;
	color: navy;
}

.projectListSize {
	width: 1400px;
	margin: 0 auto;
}
#search {
 	float: left;
    position: relative;
    left: 800px;
}

#proHit {
	margin-top: 10px;
	margin-right: 10px;
	font-family: 'IBM Plex Sans KR', sans-serif;
	padding: 5px 20px;
	border-radius: 40px;
	color: gray;
	width: 40px;
	background-color: #FAC4A4;
	font-weight: bold;
	float: right;
	text-align: center;
}

#proHit p {
	font-size: 12px;
}

</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<br>
	<div class="projectListSize">
		<div class="freeTxt">
			<p>끼리가 보증하는 IT파트너</p>
			<p id="h">프로젝트를 등록하고<br>
			함께 할 팀원들을 구해보세요.</p>
			<br>
		</div> 
		<div>
			<button id="freeInput" type="button" onclick="location.href='../ggiriProject/projectWrite'">프로젝트 등록하기</button>
		</div>
		<br><br><br><br><br><hr>
		<div class="board_table">
			<br>
			<div id="devList">
				<c:if test="${list.size()==0 }">	
				    <h3>등록된 글이 없습니다</h3>
				</c:if>
				<br>
				<c:if test="${loginUser == null && kakaoMember == null && naverMember == null && googleMember == null}">
				    <c:forEach var="dto" items="${list }">
				        <div id="mem">
				        	<c:if test="${dto.project == '완료' }">
								<span id="project_1">${dto.project }</span>
							</c:if>
							<c:if test="${dto.project == '진행중' }">
								<span id="project_2">${dto.project }</span>
							</c:if>
				            <h4>${dto.prodate }</h4>
				            <a id="title" href="/root/ggiriProject/projectView?projectNum=${dto.projectNum }">${dto.title }</a>
				            <br>
				            <p id="projectViewID">프리랜서 ${dto.id }님</p>
				            <c:if test="${dto.job != null }">
								<p id="job">${dto.job }</p><br>
							</c:if>
							<c:if test="${dto.job == null }">
								<p id="job"> 아직 프리랜서 등록을 하지않은 회원입니다. </p><br>
							</c:if>
				            <div class="skill">
				            <br>
				                <c:forEach var="selectedSkill" items="${dto.skill}">
				                    <div style="display:inline-block;" id="skill">${selectedSkill}</div>
				                </c:forEach>
				            </div>
				            <span id="proHit"><p>조회수<p> ${dto.proHit}</span>
				        </div>
				  		<br>
				    </c:forEach>
			    </c:if>
	   			<c:if test="${loginUser != null || kakaoMember != null || naverMember != null || googleMember != null}">
					<c:forEach var="dto" items="${list }">
						<div id="mem" onclick="location.href='/root/ggiriProject/projectView?projectNum=${dto.projectNum }'">
							<c:if test="${dto.project == '완료' }">
								<span id="project_1">${dto.project }</span>
							</c:if>
							<c:if test="${dto.project == '진행중' }">
								<span id="project_2">${dto.project }</span>
							</c:if>
	            			<h4>${dto.prodate }</h4>
	            			<h1 id="title">${dto.title }</h1>
	            			<br>
							<p id="projectViewID">프리랜서 ${dto.id }님</p>
							<c:if test="${dto.job != null }">
								<p id="job">${dto.job }</p><br>
							</c:if>
							<c:if test="${dto.job == null }">
								<p id="job"> 아직 프리랜서 등록을 하지않은 회원입니다. </p><br>
							</c:if>
							<div class="skill">
							<br>
				                <c:forEach var="selectedSkill" items="${dto.skill}">
				                    <div style="display:inline" id="skill">${selectedSkill}</div>
				                </c:forEach>
							</div>
							<span id="proHit"><p>조회수<p> ${dto.proHit}</span>
						</div>
						<br>
					</c:forEach>
				</c:if>
				<c:if test="${projectList != null }">
					<c:forEach var="dto" items="${projectList }">
						<div id="mem">
							<c:if test="${dto.project == '완료' }">
								<span id="project_1">${dto.project }</span>
							</c:if>
							<c:if test="${dto.project == '진행중' }">
								<span id="project_2">${dto.project }</span>
							</c:if>
		            		<h4>${dto.prodate }</h4>
	            			<a id="title" href="/root/ggiriProject/projectView?projectNum=${dto.projectNum }">${dto.title }</a><br>
	            			<br>
							<p id="projectViewID">프리랜서 ${dto.id }님</p>
							<c:if test="${dto.job != null }">
								<p id="job">${dto.job }</p><br>
							</c:if>
							<c:if test="${dto.job == null }">
								<p id="job"> 아직 프리랜서 등록을 하지않은 회원입니다. </p><br>
							</c:if>
							<div class="skill">
								<br>
				                <c:forEach var="selectedSkill" items="${dto.skill}">
				                    <div style="display:inline" id="skill">${selectedSkill}</div>
				                </c:forEach>
							</div>
		                	<span id="proHit"><p>조회수<p> ${dto.proHit}</span>
						</div>
						<br>
					</c:forEach>
				</c:if>
				<br>
			</div>
		</div>
	</div>
	<div id="search">
		<form action="${contextPath }/ggiriProject/projectList.do" method="get">
			<select name="condition" id="condition" style="font-family: 'IBM Plex Sans KR', sans-serif">
				<option value="titleContent" <c:if test="${condition eq 'titleContent' }">selected</c:if>>제목 + 본문</option>
				<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
				<option value="id" <c:if test="${condition eq 'id' }">selected</c:if>>작성자</option>
			</select>
				<input type="text" name="keyword" id="keyword" style="font-family: 'IBM Plex Sans KR', sans-serif" placeholder="검색어" value="${keyword }"/>
				<button id="button1" type="submit">검색</button>
		</form>
	</div>
	<div style="position: fixed; bottom: 20px; right:20px;">
		<a href="#"><img style="width:50px; height: 50px;"src="/root/resources/image/top1.png"></a>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>