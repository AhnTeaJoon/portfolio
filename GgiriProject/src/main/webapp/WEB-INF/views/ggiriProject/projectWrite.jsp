
<!-- ggiriProject/projectWrite.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriProject/projectWrite.jsp</title>
<script>
function count_check(obj){
	var chkBox = document.getElementsByName("skill");
	var chkCnt = 0;
	for(var i = 0; i < chkBox.length ; i++){
		if(chkBox[i].checked){
			chkCnt++;
		}
	}
	if(chkCnt > 10){
		alert("요구 스킬은 10개까지 선택할 수 있습니다.");
		obj.checked = false;
		return false;
	}
}
</script>
<style type="text/css">
*{
	margin: 0;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
textarea {
	width: 800px;
	hegith: 300px;
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
h1{
	text-align: center;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
table {
	width: 1000px;
	margin: auto;
	text-align: left;
	margin: 0 auto;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
table th {
	font-weight: border;
	text-align: center;
	width: 200px;
	
}
table th,td {
	border-bottom: 2px solid gray;
	padding: 20px 0 20px 0;
}

table td {
	padding: 5px 0 7px 8px;
	text-align: left;
}
#submit{
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
#submit:hover{
    background-color: #EBF7FF;
    transition: 0.5s;
}
 #select {
    display: flex;
    justify-content: center;
}
.check input[type="checkbox"] {
    -webkit-appearance: none;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    position: relative;
    width: 20px;
    height: 20px;
    cursor: pointer;
    outline: none !important;
    border: 1px solid #9999;
    vertical-align: middle;
}
.check input[type="checkbox"]::before {
    content: "\2713";
    position: absolute;
    top: 50%;
    left: 50%;
    overflow: hidden;
    transform: scale(0) translate(-50%, -50%);
    line-height: 1;
}
.check input[type="checkbox"]:checked {
    background-color: #63aeff;
    border-color: rgba(255, 255, 255, 0.3);
    color: white;
}
.check input[type="checkbox"]:checked::before {
    border-radius: 4px;
    transform: scale(1) translate(-50%, -50%)
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<h1>프로젝트 등록하기</h1>
	<form action="../ggiriProject/projectSave" method="post">
		<table>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="title" size="50" maxlength= "50"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<c:if test="${loginUser != null}">
						<input type="text" name="id" id="id" value="${loginUser }" readonly>
						<input type="hidden" name="memberNum" id="memberNum" value="${ggiriMemberInfo.memberNum }">
					</c:if>
					<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
						<input type="text" name="id" id="id" value="${ggiriSnsInfo.id }" readonly>
						<input type="hidden" name="memberNum" id="memberNum" value="${ggiriSnsInfo.memberNum }">
					</c:if>
				</td>
			</tr>
			<tr>
				<th>프로젝트 상태</th>
				<td>
		            <label for="proceeding"> 진행중 </label>
		            <input type="radio" name="project" id="proceeding" value="진행중" checked>
		            <label for="complete"> 완료 </label>
		            <input type="radio" name="project" id="complete" value="완료">
	            </td>
			</tr>
			<tr>
				<th>스 킬</th>
			<td><br>
			<div class="check">
					<input type="checkbox" class="hidden" name="skill" id="available_0" value="frontEnd" onclick="count_check(this)">
					<label for="available_0">Front-End</label>
					<input type="checkbox" class="hidden" name="skill" id="available_1" value="backEnd" onclick="count_check(this)">
					<label for="available_1">Back-End</label>
					<input type="checkbox" class="hidden" name="skill" id="available_2" value="java" onclick="count_check(this)">
					<label for="available_2">Java</label>
					<input type="checkbox" class="hidden" name="skill" id="available_3" value="spring" onclick="count_check(this)">
					<label for="available_3">Spring</label>
					<input type="checkbox" class="hidden" name="skill" id="available_4" value="maven" onclick="count_check(this)">
					<label for="available_4">Maven</label>
					<input type="checkbox" class="hidden" name="skill" id="available_5" value="jenkins" onclick="count_check(this)">
					<label for="available_5">Jenkins</label>
					<input type="checkbox" class="hidden" name="skill" id="available_6" value="webView" onclick="count_check(this)">
					<label for="available_6">WebView</label><br>
					<input type="checkbox" class="hidden" name="skill" id="available_7" value="nodeJs" onclick="count_check(this)">
					<label for="available_7">node-js</label>
					<input type="checkbox" class="hidden" name="skill" id="available_8" value="reactJs" onclick="count_check(this)">
					<label for="available_8">React-js</label>
					<input type="checkbox" class="hidden" name="skill" id="available_9" value="react-native" onclick="count_check(this)">
					<label for="available_9">react-native</label>
					<input type="checkbox" class="hidden" name="skill" id="available_10" value="VueJs" onclick="count_check(this)">
					<label for="available_10">Vue-js</label>
					<input type="checkbox" class="hidden" name="skill" id="available_11" value="javaScript" onclick="count_check(this)">
					<label for="available_11">JavaScript</label><br>
					<input type="checkbox" class="hidden" name="skill" id="available_12" value="oracle" onclick="count_check(this)">
					<label for="available_12">Oracle</label>
					<input type="checkbox" class="hidden" name="skill" id="available_13" value="msSql" onclick="count_check(this)">
					<label for="available_13">MSSQL</label>
					<input type="checkbox" class="hidden" name="skill" id="available_14" value="mySql" onclick="count_check(this)">
					<label for="available_14">MySQL</label>
					<input type="checkbox" class="hidden" name="skill" id="available_15" value="mariaDB" onclick="count_check(this)">
					<label for="available_15">MariaDB</label>
					<input type="checkbox" class="hidden" name="skill" id="available_16" value="mongoDB" onclick="count_check(this)">
					<label for="available_16">MongoDB</label><br>
					<input type="checkbox" class="hidden" name="skill" id="available_17" value="android" onclick="count_check(this)">
					<label for="available_17">Android</label>
					<input type="checkbox" class="hidden" name="skill" id="available_18" value="lot" onclick="count_check(this)">
					<label for="available_18">loT</label>
					<input type="checkbox" class="hidden" name="skill" id="available_19" value="php" onclick="count_check(this)">
					<label for="available_19">PHP</label>
					<input type="checkbox" class="hidden" name="skill" id="available_20" value="jquery" onclick="count_check(this)">
					<label for="available_20">jQuery</label>
					<input type="checkbox" class="hidden" name="skill" id="available_21" value="aduino" onclick="count_check(this)">
					<label for="available_21">Aduino</label>
					<input type="checkbox" class="hidden" name="skill" id="available_22" value="hybrid" onclick="count_check(this)">
					<label for="available_22">Hybrid</label>
					<input type="checkbox" class="hidden" name="skill" id="available_23" value="unix" onclick="count_check(this)">
					<label for="available_23">UNIX</label><br>
					<input type="checkbox" class="hidden" name="skill" id="available_24" value="c#" onclick="count_check(this)">
					<label for="available_24">C#</label>
					<input type="checkbox" class="hidden" name="skill" id="available_25" value="c" onclick="count_check(this)">
					<label for="available_25">C</label>
					<input type="checkbox" class="hidden" name="skill" id="available_26" value="c++" onclick="count_check(this)">
					<label for="available_26">C++</label>
					<input type="checkbox" class="hidden" name="skill" id="available_27" value="qt" onclick="count_check(this)">
					<label for="available_27">Qt</label>
					<input type="checkbox" class="hidden" name="skill" id="available_28" value="server" onclick="count_check(this)">
					<label for="available_28">Server</label>
					<input type="checkbox" class="hidden" name="skill" id="available_29" value="miplatform" onclick="count_check(this)">
					<label for="available_29">Miplatform</label>
					<input type="checkbox" class="hidden" name="skill" id="available_30" value="thymeleaf" onclick="count_check(this)">
					<label for="available_30">Thymeleaf</label>
					<input type="checkbox" class="hidden" name="skill" id="available_31" value="flutter" onclick="count_check(this)">
					<label for="available_31">flutter</label>
					<input type="checkbox" class="hidden" name="skill" id="available_32" value="ios" onclick="count_check(this)">
					<label for="available_32">ios</label>
					</div>
					<br>
				</td>
			</tr>
			<tr>
			<th>내 용</th>
			<td><textarea rows="20" cols="100" name="content"></textarea></td>
			</tr>
		</table>
		<br>
		<div id="select">
			<input type="submit" id="submit" value="등록하기"> &nbsp;
			<input type="button" value="프로젝트 목록" onclick="location.href='../ggiriProject/projectList'">
		</div>
	</form>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>