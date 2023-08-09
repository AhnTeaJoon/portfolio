<!-- default/main.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
   
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>default/main.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">

var contextPath = "${pageContext.request.contextPath}";
var job;

function developer(){
	$("#devList").empty();
	job = $("#jobDev").val();
	
	var contextPath = "${pageContext.request.contextPath}";
	
	$.ajax({
		url : contextPath + '/ggiriMember/selectJob?job=' + job,
		type : 'get',
		success : function(list){
			let html = ""
			$(list).each(function(){
				html += "<div id='mem'>";
			    html += "<a href='Info?id=" + this.id + "'><p id='id'>" + this.id + "</p></a>";
			    html += "<div id='hi'>";
			    html += "<div><h2>" + this.introduce + "</h2></div>";
			    html += "<div id='job'>" + this.job + "</div><br><br>";
			    html += "<div id='skillCheck' style='display:inline;'>" + this.skill + "</div><br><br>";
			    html += "</div><hr>"
			    html += "</div>"
			});
			
			$("#devList").html(html);
			
			$("#devList p#id").each(function() {
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
		             }
		         });
		         
		      },
		      error : function(xhr, status, errorThrown){
		         alert(xhr);
		         alert(status);
		         alert(errorThrown);
		      }
		   });
}

function publisher(){
	$("#devList").empty();
	job = $("#jobPub").val();
	
	var contextPath = "${pageContext.request.contextPath}";
	
	$.ajax({
		url : contextPath + '/ggiriMember/selectJob?job=' + job,
		type : 'get',
		success : function(list){
			let html = ""
			$(list).each(function(){
				html += "<div id='mem'>";
			    html += "<a href='Info?id=" + this.id + "'><p id='id'>" + this.id + "</p></a>";
			    html += "<div id='hi'>";
			    html += "<div><h2>" + this.introduce + "</h2></div>";
			    html += "<div id='job'>" + this.job + "</div><br><br>";
			    html += "<div id='skillCheck' style='display:inline'>" + this.skill + "</div><br><br>";
			    html += "</div><hr>"
			    html += "</div>"
			});
			
			$("#devList").html(html);
			
			$("#devList p#id").each(function() {
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
		             }
		         });
		         
		      },
		      error : function(xhr, status, errorThrown){
		         alert(xhr);
		         alert(status);
		         alert(errorThrown);
		      }
		      
		   });
}

function designer(){
	$("#devList").empty();
	job = $("#jobDes").val();
	
	var contextPath = "${pageContext.request.contextPath}";
	
	$.ajax({
		url : contextPath + '/ggiriMember/selectJob?job=' + job,
		type : 'get',
		success : function(list){
			let html = ""
			$(list).each(function(){
				html += "<div id='mem'>";
			    html += "<a href='Info?id=" + this.id + "'><p id='id'>" + this.id + "</p></a>";
			    html += "<div id='hi'>";
			    html += "<div><h2>" + this.introduce + "</h2></div>";
			    html += "<div id='job'>" + this.job + "</div><br><br>";
			    html += "<div id='skillCheck' style='display:inline'>" + this.skill + "</div><br><br>";
			    html += "</div><hr>"
			    html += "</div>"
			});
			
			$("#devList").html(html);
			
			$("#devList p#id").each(function() {
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
		             }
		         });
		      },
		      error : function(xhr, status, errorThrown){
		         alert(xhr);
		         alert(status);
		         alert(errorThrown);
		      }
		      
		   });
}

function planner(){
	
	$("#devList").empty();
	job = $("#jobPla").val();
	
	var contextPath = "${pageContext.request.contextPath}";
	
	$.ajax({
		url : contextPath + '/ggiriMember/selectJob?job=' + job,
		type : 'get',
		success : function(list){
			let html = ""
			$(list).each(function(){
				html += "<div id='mem'>";
			    html += "<a href='Info?id=" + this.id + "'><p id='id'>" + this.id + "</p></a>";
			    html += "<div id='hi'>";
			    html += "<div><h2>" + this.introduce + "</h2></div>";
			    html += "<div id='job'>" + this.job + "</div><br><br>";
			    html += "<div id='skillCheck' style='display:inline'>" + this.skill + "</div><br><br>";
			    html += "</div><hr>"
			    html += "</div>"
			});
			
			$("#devList").html(html);
			
			$("#devList p#id").each(function() {
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
		             }
		         });
		      },
		      error : function(xhr, status, errorThrown){
		         alert(xhr);
		         alert(status);
		         alert(errorThrown);
		      }
		      
		   });
}

$(document).ready(function() {
   $("#devList p#id").each(function() {
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
* {
   font-family: 'IBM Plex Sans KR', sans-serif;
}
.skill{
   display: inline-block;
}

#skillCheck {
    padding: 10px;
     font-size: 20px;
     width: fit-content;
     margin: auto;
     border-radius: 40px;
     background-color: #EBF7FF;
}

div{
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

.h3{
   padding: 10px 15px;
   font-size: 15px;
   text-align: center;
   background-color: white;
   border-color: gray;
}

.h3:hover{
   background-color: #EAEAEA;
   border-color: black;
   cursor: pointer;
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
/* #id{
    line-height: 300px;
   border-radius: 40px 80px / 80px 40px;
   border: 1px solid white;
   background-color: ;
   text-align:center;
   vertical-align: middle;
   text-weight: bold;
   width: 300px; 
   height: 300px;
   color: black;
   font-size: 30px;
   display: inline-block;
} */
.freeTxt {
   font-weight: bold;
   float:left;
}

div #h {
   font-size: 24px;
   font-weight: bolder;
}

a {
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
   cursor: pointer;
}

#freeInput:hover {
   background-color: white;
   transition: 0.5s;
}

#hi {
     vertical-align: middle;
    display: inline-block;
    margin: 20px;
}

.body {
   width: 1400px;   
}

#job {
     padding: 5px;
     font-size: 14px;
     width: fit-content;
     border-radius: 40px;
     border: 1px solid #4374D9;
     float: left;
}

.topBtn {cursor:pointer;}

</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <br>
   <div class="body">
      <div class="freeTxt">
         <p>끼리가 보증하는 IT파트너</p>
         <p id="h">프리랜서로 등록하면<br>
         더 정확한 추천을 받을 수 있어요</p>
         <br>
      </div>
      <div>
         <button class="freeInput" id="freeInput" type="button" onclick="location.href='${contextPath}/ggiriMember/writeFree'">프리랜서 등록하기</button>
      </div>
      <br><br><br><br><br><br><br>
      <div class="skill">
         <input type="hidden" name="job" id="jobDev" value="developer">
         <input type="hidden" name="job" id="jobPub" value="publisher">
         <input type="hidden" name="job" id="jobDes" value="designer">
         <input type="hidden" name="job" id="jobPla" value="planner">
         <button class="h3" type="submit" style=" border-radius: 30px;" onclick="developer()" id="dev"> ⚙️  개발자 </button>
         <button class="h3" type="submit" style=" border-radius: 30px;" onclick="publisher()" id="pub"> 🛠  퍼블리셔  </button> 
          <button class="h3" type="submit" style=" border-radius: 30px;" onclick="designer()" id="des"> 🎨  디자이너 </button> 
         <button class="h3" type="submit" style=" border-radius: 30px;" onclick="planner()" id="pla"> 📝  기획자 </button> 
      </div>
      <br><br>
      <hr>
      <div id="devList">
       <c:forEach var="list" items="${boardList}">
          <div id="mem">
            <a href="Info?id=${list.id}" ><p id="id">${list.id}</p></a>
            <div id="hi">
              <div><h2>${list.introduce}</h2></div>
               <div id="job">${list.job}</div> <br><br>
               <c:forEach var="selectedSkill" items="${list.skill}">
                <div style="display:inline" id="skillCheck">${selectedSkill}</div>
              </c:forEach>
            </div><hr>
          </div>
        </c:forEach> 
      </div>
    </div>
   	<div style="position: fixed; bottom: 20px; right:20px;">
		<a href="#"><img style="width:50px; height: 50px;"src="/root/resources/image/top1.png"></a>
	</div>
   <c:import url="../default/footer.jsp"/>
</body>
</html>