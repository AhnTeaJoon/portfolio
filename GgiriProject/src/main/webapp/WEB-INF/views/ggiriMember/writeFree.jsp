<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
function count_check(obj){
	var chkBox = document.getElementsByName("skill");
	var chkCnt = 0;
	for(var i = 0; i < chkBox.length ; i++){
		if(chkBox[i].checked){
			chkCnt++;
		}
	}
	if(chkCnt > 5){
		alert("보유 기술은 5개까지 선택할 수 있습니다.");
		obj.checked = false;
		return false;
	}
}
function checkFormSubmit() {
	var introduceValue = document.getElementsByName("introduce")[0].value;
	var chkBox = document.getElementsByName("skill");
	var isChecked = false;
	var project_periodValue = document.getElementsByName("project_period")[0].value;
	var place_of_workValue = document.getElementsByName("place_of_work")[0].value;
	var url_nameValue = document.getElementsByName("url_name")[0].value;
	for(var i = 0; i < chkBox.length; i++){
		if(chkBox[i].checked){
			isChecked = true;
			break;
		}
	}
	
	if (introduceValue.trim() === "") {
		alert("자기소개를 입력해주세요.");
		return false;
	}else if (!isChecked) {
		alert("활용가능 기술 5개까지 선택가능합니다.");
		return false;
	}else if (project_periodValue.trim() === "") {
		alert("근무가능기간를 입력해주세요.");
		return false;
	}else if (place_of_workValue.trim() === "") {
		alert("선호하는 근무장소를 입력해주세요.");
		return false;
	}else if(url_nameValue.trim() === "") {
		alert("나를 소개할 URL를 입력해주세요.");
		return false;
	}
	return true;
}


</script>
<style type="text/css">
*{
	margin: 0;
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
div.button {
	border-radius: 15px;
	font-size: 15px;
	padding-top: 5px;
	padding-bottom: 5px;
    min-height: 50px; 
    min-width: 170px;
	font-family: 'IBM Plex Sans KR', sans-serif;
	cursor: pointer;
	display: flex;
    justify-content: center;
}
div.button:hover {
	background-color: white;
	transition: 0.5s;
}
input.insert {
	border-radius: 15px;
	font-size: 15px;
	padding-top: 5px;
	padding-bottom: 5px;
    min-height: 50px; 
    min-width: 170px;
	font-family: 'IBM Plex Sans KR', sans-serif;
	cursor: pointer;
	display: flex;
    justify-content: center;
}
input.insert:hover {
	background-color: white;
	transition: 0.5s;
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
	<c:import url="../default/header.jsp"/>
	<h1>프리랜서 등록하기</h1>
	<form action="${contextPath }/ggiriMember/writeSave" method="post" onsubmit="return checkFormSubmit();">
		<table>
			<tr>
				<c:if test="${loginUser != null}">
					<input type="hidden" name="name" id="name" value="${ggiriMemberInfo.name }">
					<input type="hidden" name="memberNum" id="memberNum" value="${ggiriMemberInfo.memberNum }">
				</c:if>
				<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
					<input type="hidden" name="name" id="name" value="${ggiriSnsInfo.name }">
					<input type="hidden" name="memberNum" id="memberNum" value="${ggiriSnsInfo.memberNum }">
				</c:if>
			</tr>
			<tr> 
				<c:if test="${loginUser != null}">
					<th>작성자 </th><td><input type="text" name="id" id="id" value="${loginUser }" readonly></td>
				</c:if>
				<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
					<th>작성자 </th><td><input type="text" name="id" id="id" value="${ggiriSnsInfo.id }" readonly></td>
				</c:if>
			</tr>
			<tr>
				<th>자기소개  </th><td><input type="text" name="introduce" id="introduce" placeholder="한줄로 자기소개 해주세요!" maxlength="20"></td>
			</tr>
			<tr>
				<th> 구인직종 </th>
				<td><br>
					<input type="radio" class="hidden" name="job" id="occupation_01" value="developer" checked>
					<label for="occupation_01"> 개발자 </label>
					<input type="radio" class="hidden" name="job" id="occupation_02" value="publisher">
					<label for="occupation_02"> 퍼블리셔 </label>
					<input type="radio" class="hidden" name="job" id="occupation_03" value="designer">
					<label for="occupation_03"> 디자이너 </label>
					<input type="radio" class="hidden" name="job" id="occupation_04" value="planner">
					<label for="occupation_04"> 기획자 </label>
				</td>
			</tr>
			<tr>
			<th> 활용가능<br>기술 </th>
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
					<input type="checkbox" class="hidden" name="skill" id="available_7" value="node.js" onclick="count_check(this)">
					<label for="available_7">node.js</label>
					<input type="checkbox" class="hidden" name="skill" id="available_8" value="react.js" onclick="count_check(this)">
					<label for="available_8">React.js</label>
					<input type="checkbox" class="hidden" name="skill" id="available_9" value="react-native" onclick="count_check(this)">
					<label for="available_9">react-native</label>
					<input type="checkbox" class="hidden" name="skill" id="available_10" value="Vue.js" onclick="count_check(this)">
					<label for="available_10">Vue.js</label>
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
				<th>근무 가능기간  </th><td><br><input type="text" name="project_period" id="project_period" placeholder="20230101"></td>
			</tr>
			<tr>
				<th>선호하는 근무장소  </th><td><br><input type="text" name="place_of_work" id="place_of_work" size="35" placeholder="도시입력 예)서울:인천:대전"></td>
			</tr>
			<tr>
				<th>나를 소개할 URL  </th><td><br><input type="text" name="url_name" id="url_name" size="40"  placeholder="https://깃주소를 입력해주세요" ></td>
			</tr>
		</table>
		<br>
	<div class="button">
		<input type="submit" class="insert" value="등록하기" >
	</div>
	</form >
	<c:import url="../default/footer.jsp"/>
</body>
</html>