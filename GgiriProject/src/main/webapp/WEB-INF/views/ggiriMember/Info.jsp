<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
	   $("p#id").each(function() {
	      var randomColor;
	      var iterations = 0;

	       do {
	         randomColor = getRandomColor(); // 랜덤 색상 생성

	         iterations++;
	         if (iterations > 100) {
	           // 100번 시도해도 유효한 색상을 찾지 못한 경우
	           randomColor = null;
	           break;
	         }
	       } while (!randomColor || randomColor === "#ffffff" || isColorUsed(randomColor));

	       if (randomColor) {
	         $(this).css("background-color", randomColor); // 배경 색상 적용
	         $(this).attr("data-color", randomColor); // 배경 색상 속성 설정
	         var textColor = getTextColorByBackgroundColor(randomColor);
	         $(this).css("color", textColor); // 글자 색상 설정
	         var randomColor = getRandomColor();
	       }
	     });
	});

	function getRandomColor() {
	  var letters = "0123456789ABCDEF";
	  var color = "#";

	  for (var i = 0; i < 6; i++) {
	    color += letters[Math.floor(Math.random() * 16)];
	  }

	  return color;
	}

	function isColorUsed(color) {
	  var used = false;
	  $("#devList p#id").each(function() {
	    if ($(this).attr("data-color") === color) {
	      used = true;
	      return false; // 반복문 종료
	    }
	  });
	  return used;
	}
	//랜덤 컬러 가져오기
	function getStoredColor() {
	  var storedColor = localStorage.getItem("randomColor");
	  if (storedColor) {
	    return storedColor;
	  } else {
	    return getRandomColor();
	  }
	}

	// 랜덤 컬러 저장하기
	function storeColor(color) {
	  localStorage.setItem("randomColor", color);
	}

	// 페이지 로드 시 실행
	window.onload = function() {
	  var color = getStoredColor();
	  document.querySelector("#id").style.color = color;
	};

	// 사용자가 새로운 랜덤 컬러를 생성할 경우
	function generateNewColor() {
	  var color = getRandomColor();
	  document.querySelector("#id").style.color = color;
	  storeColor(color);
	}

	function getTextColorByBackgroundColor(hexColor) {
	     const c = hexColor.substring(1); // 색상 앞의 # 제거
	     const rgb = parseInt(c, 16); // rrggbb를 10진수로 변환
	     const r = (rgb >> 16) & 0xff; // red 추출
	     const g = (rgb >> 8) & 0xff; // green 추출
	     const b = (rgb >> 0) & 0xff; // blue 추출
	     const luma = 0.2126 * r + 0.7152 * g + 0.0722 * b; // per ITU-R BT.709
	     // 색상 선택
	     return luma < 135 ? "white" : "black"; 
	}

</script>
<style type="text/css">
*{
	margin: 0;
}

#modal_wrap{
	position: fixed;
	z-index: 9;
	margin: 0 auto;
	top: 0; left: 0; right: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
}
#first{
	position: fixed;
	z-index: 10;
	margin: 0 auto;
	top: 30px; left: 0; right: 0;
	width: 300px;
	height: 350px;
	background: rgba(210, 240, 250, 0.9);
}
.all{
	margin: auto;
	width: 900px;
}
p#id {   
    line-height: 300px;
    border-radius: 40px;
    text-align: center;
    vertical-align: middle;
    text-weight: bold;
    width: 300px;
    height: 300px;
    color: white;
    font-size: 30px;
    display: inline-block;
    overflow: hidden;
}
table {
	margin-right: auto;
	margin-left: auto;
	
	border-radious: 30px;
}

#id p{
	color: green;
  	font-size:25px;
  	line-height:300px;
}

#skill {
	padding: 10px;
    font-size: 20px;
    width: fit-content;
    margin: auto;
    border-radius: 40px;
    background-color: #BAE3F9;
}

a {
	text-decoration: none;
	font-weight: bold;
}
#but {
	float: right;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
		<div class="all">
			<div class="intro">
			<br>
			<div><p id="id" style="font-weight: bold;">"${info.id }"</p></div>
			<br>
				<h1>${info.introduce }</h1><br>
				<h2> 보유 기술 </h2><br>
				<c:forEach var="selectedSkill" items="${info.skill}">
			        <div style="display:inline; margin: 20px 0;" id="skill">${selectedSkill}</div>
			    </c:forEach>
				<input type="hidden" id="freeNum" name="freeNum" value="${info.memberNum }">
				<br><br><h2>Git URL </h2><br>
				<b><a href="${info.url_name }" target="_blank">${info.url_name }</a></b>
				<c:set var="id" value="${info.id }"/>
				<div id="but">
				<c:if test="${info.id == loginUser }">
					<b><input type="submit" value="수정" onclick="location.href='${contextPath}/ggiriMember/writeFreeModifyForm?id=${info.id }'">
					&nbsp; <input type="submit" value="삭제" onclick="location.href='${contextPath}/ggiriMember/writeFreeDelete?id=${info.id }'"></b>
				</c:if>
				<c:if test="${info.id == kakaoMember.id || info.id == googleMember.id || info.id == naverMember.id }">
					<b><input type="submit" value="수정" onclick="location.href='${contextPath}/ggiriMember/writeFreeModifyForm?id=${info.id }'">
					&nbsp; <input type="submit" value="삭제" onclick="location.href='${contextPath}/ggiriMember/writeFreeDelete?id=${info.id }'"></b>
				</c:if>
				</div>
			<br><br>
			</div>
			<hr>
			<br>
			<div class="proCon">
			<h1> 참여한 프로젝트 </h1><br>
				<c:forEach var="list" items="${list }">
					<h2><a href="${contextPath }/ggiriComplete/completeView?completeNum=${list.completeNum }">${list.title }</a></h2>
						 <br>
						 <c:forEach var="selectedSkill" items="${list.skill}">
					     	<div style="display:inline" id="skill">${selectedSkill}</div>
					     </c:forEach>
						<br><br>
						<b>함께 진행한 팀원</b>
						<br><b>${list.members }</b><br><br><br>
				</c:forEach>
			</div>
		</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>