<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>helpView</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	
	$(function(){
		adminRepList();
	});
	
	function adminRepResult() {
		
		let helpNo = $("#adminHelpNo").val();
		let helpMember = $("#helpMember").val();
		let adminRep = $("#adminRep").val();
		let adminid = $("#loginId").val();
		
		console.log(helpNo);
		console.log(helpMember);
		console.log(adminRep);
		console.log(adminid);
		
		let form = { helpNo:helpNo, adminid:adminid, helpMember:helpMember, adminRep:adminRep}	
		
		$.ajax({
		      url: contextPath + "/ggiriAdmin/adminHelpReply", 
		      type: "post",
		      data: JSON.stringify(form),
		      contentType: "application/json; charset=UTF-8",
		      success: function(data) {
		         if(data == 1){
		        	 adminRepList();
		            $("#adminRep").val("");
		         } else {
		            alert("답변달기 실패");
		         }
		      },
		      error: function() {
		         alert("관리자 답변 등록 오류")
		      }
		   });
		
	}
	
	function adminRepList() {
		   
	   let helpNo = $("#helpNo").val();
	   console.log(helpNo);
	   
	   $.ajax({
	      url: contextPath + "/ggiriAdmin/adminRepData?helpNo=" + helpNo,
	      type: "get",
	      success: function(rep) {
	         let html = "";
			 let id = $("#loginId").val();
			 console.log(rep);
	         
             if(rep[0] != null && id != 'GGIRIADMIN' ){
		         let date = new Date(rep[0].adminRepDate);
	             let adminRepDate = date.getFullYear()+"년 "+(date.getMonth()+1)+"월 ";
	             adminRepDate += date.getDate()+"일 "+date.getHours()+"시 ";
	             adminRepDate += date.getMinutes()+"분 "+date.getSeconds()+"초";
	             html += "      <br><br><br><br><br><br><br>";
	             html += "      <div id='adminReply'>";
	             html += "         <div style='padding: 12px; border: 4px solid silver; margin-bottom: 10px; border-radius: 30px 0 30px 0;'>";
	             html += "            <b style='width:400px; height:40px; text-align:center'>작성자 )</b> &nbsp; Ggiri 관리자<p style='float:right'>"+ rep[0].adminRepDate + "</p><br>";
	             html += "         </div>";
	             html += "         <div style='padding: 12px; background-color: #f0f0f0; border-radius: 30px;'>";
	             html += "            <b width='600px'>문의 답변 A )</b><br><pre>"+rep[0].adminRep +"</pre></td>";
	             html += "         </div>";
	             html += "      </div>";
	             
	        	 $("#adminRepDiv").html(html);
	        	 
             } else if(rep[0] != null && id == 'GGIRIADMIN' ){
            	 let date = new Date(rep[0].adminRepDate);
	             let adminRepDate = date.getFullYear()+"년 "+(date.getMonth()+1)+"월 ";
	             adminRepDate += date.getDate()+"일 "+date.getHours()+"시 ";
	             adminRepDate += date.getMinutes()+"분 "+date.getSeconds()+"초";
	             html += "		<br><div id='adminReply'>";
	             html += "      	    <div style='padding: 12px; border: 4px solid silver; margin-bottom: 10px; border-radius: 30px 0 30px 0;'>";
	             html += "      	       <b style='width:400px; height:40px; text-align:center'>Ggiri 관리자의 답변</b><p style='float:right'>"+ rep[0].adminRepDate + "</p><br>";
	             html += "      	    </div>";
	             html += "      	    <div style='padding: 12px; background-color: #f0f0f0; border-radius: 30px;'>";
	             html += "        	        <input type='hidden' name='adminRepNo' id='adminRepNo' value='" + rep[0].adminRepNo + "'>";
	             html += "        	        <input type='hidden' name='contentList' id='contentList" + rep[0].adminRepNo + "' value='" + rep[0].adminRep + "'>";
	             html += "					<b width='850px'>문의 답변 A )</b><br><pre id='adminMainRep'>"+ rep[0].adminRep +"</pre><div id='modifyAdminRep' name='modifyAdminRep' style='display: none;'></div></b>";
	             html += "      	    </div>";
	             html += "      	    <br>";
	             html += "      	    <div style='display: flex; justify-content: center;'>";
            	 html += "					<b><button type='button' id='deleteRep' name='deleteRep' style='width:50px; height:30px; background-color: #E2EAE9; border-radius: 40px 80px / 80px 40px;' onclick='deleteAdminRep()'> 삭제 </button>";
                 html += "					<button type='button' id='modifyRep' name='modifyRep' style='width:50px; height:30px; background-color: #E2EAE9; border-radius: 40px 80px / 80px 40px;' onclick='modifyAdminRep(" + rep[0].adminRepNo + ")'> 수정 </button></b>";
	             html += "				</div>";
	             html += "      </div>";
	             
	        	 $("#adminRepDiv").html(html);
	      	 } else {
            	 html += "<br><hr><br><div> 해당 문의사항은 빠른시간내에 답변 드리겠습니다. </div>";
	        	 $("#adminRepDiv").html(html);
             } 
	      },
	      error : function(){
	    	  alret("에러 운영자 답변 불러오기 실패");
	   	  }
	  });
	}
	
	function deleteAdminRep(){
	   var adminRepNo = $("#adminRepNo").val();
	   
	   var result = confirm("답변을 삭제 하시겠습니까?");
	   
	   if(result == true){
	      
	      $.ajax({
	         
	         url : contextPath + "/ggiriAdmin/deleteAdminRep?adminRepNo=" + adminRepNo,
	         type : "GET",
	         /* dataType : "json",
	         data : JSON.stringify(form),
	         contentType : "application/json; charset=utf-8", */
	         success : function(data){
	            if(data == 'OK'){
	               adminRepList();
	            } else {
	               alert("success 안에서 답변 삭제 실패");
	               adminRepList();
	            }
	         },
	         error : function(){
	            console.log("error 답변 삭제 오류");
	         }
	      });
	   } else {
	      result = false;
	   }
	}
	
	function modifyAdminRep(no) {
		   let adminRepNo = no;
		   let contentList = $("#contentList" + adminRepNo).val();
		   
		   $("#modifyAdminRep").css("display", "flex");
		   $("#adminMainRep").css("display", "none");
		   $("#deleteRep").css("display", "none");
		   $("#modifyRep").css("display", "none");
		   
		   let html = "";
		   html += "<div class='title'><h4>답변 수정 ) </h4></div><br>";
		   html += "<input type='hidden' id='modifyNo' name='modifyNo' value='" + no + "'>";
		   html += "<div class='adminContent' id='adminContent' name='adminContent'><br>";
		   html += "<textarea id='adminTextArea' rows='10' cols='60' style='border-radius: 30px; resize: none; padding:10px;'>" + contentList + "</textarea>";
		   html += "<input type='button' id='modifyButton' name='modifyButton' onclick='modifyAdminRepResult(" + adminRepNo + ")' style='width:50px; height:30px; background-color: #E2EAE9; border: 2px solid black; border-radius: 40px 80px / 80px 40px;' value='수정'>&nbsp;";
		   html += "<input type='button' id='modifyCancelButton' name='modifyCancelButton' onclick='modifyAdminRepCancel()' style='width:50px; height:30px; background-color: #E2EAE9; border: 2px solid black; border-radius: 40px 80px / 80px 40px;' value='취소'>";
		   html += "</div>";
		   
		   $("#modifyAdminRep").html(html);
		   
	}
	
	function modifyAdminRepCancel() {
		$("#modifyAdminRep").css("display", "none");
		adminRepList();
    }
	
	function modifyAdminRepResult(repNo) {
		
	   let adminTextArea = $("#adminTextArea").val();
	   let enContent = encodeURI(adminTextArea);
	   let adminRep = decodeURI(enContent);
	   let adminRepNo = repNo;
	   console.log(adminRep);
	   
	   let form = { adminRepNo:adminRepNo, adminRep:adminRep};
	   
	   console.log(form);
	   
	   $.ajax({
	      
	      url : contextPath + "/ggiriAdmin/modifyAdminRep",
	      type : "post",
	      data : JSON.stringify(form),
	      contentType : "application/json",
	      success : function(data){
	         if(data == 'OK'){
	            $("#modifyAdminRep").css("display","none");
	            adminRepList();
	         } else {
	            alert("success 안에서 댓글 수정 실패");
	            adminRepList();
	         }
	      },
	      error : function(){
	         console.log("error 댓글 수정 오류");
	      }
	   });
		
	}
	
</script>
<style type="text/css">

* {
	margin: 0 auto;
}
.helpViewSize {
	width: 900px;
	margin: 0 auto;
}
input[type=button] {
    background-color: #E2EAE9 ;
    color: #333333;
    border: none;
    width: 100px;
    height: 30px;
    font-size: 14px;
	border-radius: 40px 80px / 80px 40px;
    cursor: pointer;
    
}
input[type=button]:hover {
    background-color: #EBF7FF;
    transition: 0.5s;
}
hr {
    background: gray;
    height: 1px;
    border: 0;
}
#head { 
	margin-bottom: 10px;
	border: 4px solid silver;
	border-radius: 30px 0 30px 0;
	padding: 10px;
}
#content {
	background-color: #f0f0f0 ;
	border-radius: 30px;
	padding: 10px;
}
textarea:focus {
	outline: none;
}
#select {
    display: flex;
    justify-content: center;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div class="helpViewSize">
		<input type="hidden" id="helpNo" name="helpNo" value="${data.helpNo }">
		<input type="hidden" id="loginId" name="loginId" value="${loginUser }">
		<h1 style="border-bottom: 2px solid gray;"> 문의사항 </h1><br>
		<div id="head">
			<b> 문의 번호 ) &nbsp; </b>${data.helpNo }<br>
			<b> 회원 아이디 ) &nbsp; </b> ${data.id }<br><b> 제목 ) &nbsp; </b> ${data.title }
			<p style="float: right">${data.helpDate }</p><b style="float: right"> 문의 날짜 ) &nbsp; </b>
		</div>
		<div id="content">
			<b>문의 내용 Q )</b><br>${data.content }
		</div>
		<br>
		<div id="select">
			<c:if test="${data.id==loginUser || data.id == kakaoMember.id || data.id == googleMember.id || data.id == naverMember.id }">
				<input type="button" value="수정" onclick="location.href='../ggiriHelp/helpModifyForm?helpNo=${data.helpNo }'"> &nbsp;
				<input type="button" value="삭제" onclick="location.href='../ggiriHelp/helpDelete?helpNo=${data.helpNo }'"> &nbsp;
			</c:if>
		</div>
		<c:if test="${loginUser == 'GGIRIADMIN' }">
			<div class="adminHelpReplySize">
				<div class="adminHelpRep" style="padding: 10px; border-radius: 30px; background-color: #f0f0f0">
					<input type="hidden" id="helpMember" name="helpMember" value="${data.id }">
					<input type="hidden" id="adminHelpNo" name="adminHelpNo" value="${data.helpNo }">
					<h4> 답변 내용 )</h4>
					<textarea rows="5" cols="117" id="adminRep" name="adminRep" style="border-radius: 30px; resize: none; padding:10px;"></textarea><br>
				</div>
				<br>
				<div style="text-align: center;">
					<button  style="width:50px; height:30px; background-color: #E2EAE9; border-radius: 40px 80px / 80px 40px; justify-content: center;"
					 type="button" id="adminRepResult" name="adminRepResult" onclick="adminRepResult()"> 완료 </button>
				</div>
				<br>
			</div>
		</c:if>
		<div id="adminRepDiv">
			
		</div>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>