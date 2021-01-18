<%@page import="com.kh.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
<%
	boolean valid = (boolean)request.getAttribute("valid");
    
    Member memberStatus = (Member)request.getAttribute("status");
 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<style type="text/css">

#idCheck-container {
		text-align:center;
		padding-top:50px;
		
	}
	
#setIdbtn {
	border: 0px;
	background-color: royalblue;
	color: white;
	cursor: pointer;
	
	
}	

#idCheck {
	background-color:  lightgray;
	color: rgb(90, 52, 52);
	border: 0;
	height: 28px;
	width: 100px;
	cursor: pointer;
	
}

#duplicated {
	font-size: 10pt;
	
}

.close {
	
}

#list {
	list-style: none;
	 font-weight: lighter; 
	 font-size: 10pt;
}

#idTitle {
	
	background: gray; 
	color: white; 
	padding-left: 10px;
	padding-top: 7px;
	height: 30px;
	font-size: 11pt;
	font-weight: bold;
	font-family: Arial;
}

#close {
	align: right;
	width: 100px;
}


</style>
</head>
<body>

		<!-- 아이디 중복검사시 나오는 새장!!! -->
		<div >
		<div id="idTitle">
			아이디 중복확인 </div>
			<div id="close">
			<a  onclick="self.close();"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/common/btn_close.png" alt="닫기"/></a>
			</div>
			</div>
			
		
	<div id="idCheck-container">
		<% if(valid) { %> 
			<%if (memberStatus.getStatus().equals("N")) { %>
				<span id="duplicated"><%= request.getParameter("userId") %></span>는 이미 탈퇴한 아이디입니다. <br>
				<br><br> 
		<form action="<%=request.getContextPath() %>/member/idCheck "  method="POST">		
		<label style="font-size: 11pt;">아이디는 영문(소문자), 숫자로 4~10자 이내로 입력해 주세요.</label> <br><br>
		<input type="text" name="userId" id="newId"  style="height: 22px" required> <!-- 다시 아이디 입력창 -->
				<input type="submit" id="idCheck" onclick="return validate();" value="중복확인" > <br><br>
		
			<label class="">공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.</label> <br>
            <label class="">숫자로 시작하거나, 숫자로만 이루어진 아이디는 사용할 수 없습니다.</label> <br>      
        </form>
				<% } else { %>
		<span id="duplicated"><%= request.getParameter("userId") %></span>는 이미 사용중인 아이디입니다. <br>
		<br><br> 
		<form action="<%=request.getContextPath() %>/member/idCheck "  method="POST">		
		<label style="font-size: 11pt;">아이디는 영문(소문자), 숫자로 4~10자 이내로 입력해 주세요.</label> <br><br>
		<input type="text" name="userId" id="newId"  style="height: 22px" required> <!-- 다시 아이디 입력창 -->
				<input type="submit" id="idCheck" onclick="return validate();" value="중복확인" > <br><br>
		
			<label class="">공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.</label> <br>
            <label class="">숫자로 시작하거나, 숫자로만 이루어진 아이디는 사용할 수 없습니다.</label> <br>      
        </form>
       			<%} %>		
		  <%}else { %>
		   <label><span id="duplicated"><%= request.getParameter("userId") %></span>는 사용 가능한 아이디입니다. </label> <br>
			<br><br>
		<hr>
		<input id="setIdbtn" type="button" onclick="setUserId();" value="사용하기" style="width: 100px; height: 30px;">		
	    
        <% } %>	
  		 <br><br>
			
		
		</div>
		<script>
		function validate(){
			let id = document.getElementById("newId").value;
			var chknum = id.search(/[0-9]/g);
        	var chkeng = id.search(/[a-z]/ig);
			
			
			   var idReg = /^[a-z]+[a-z0-9]{3,9}$/g;
		        if( !idReg.test( $("input[name=userId]").val() ) ) {
		            alert("아이디는 영문자로 시작하는 4~10자 영문자와 숫자를 포함해야합니다.");
		            $("#newId").focus();
		            return false;
		           
		        }		        			             
		         if(chknum < 0 || chkeng < 0) {
		        	   alert('아이디는 숫자와 영문자를 혼용해야 합니다.');
		        	   $("#newId").focus();
		        	    return false;
		      }		
		}
		
		// 이미 사용중인 아이디를 입력해서 다시 입력하는 input에 입력
		function setUserId() {
			// 입력 된 id를 부모창에 대입
			const id = "<%=request.getParameter("userId") %>";
			
			opener.memberJoinfrm.userId.value = id;  // 중복검사 창에 입력한 아이디를 회원가입 폼 아이디에 입력
			opener.memberJoinfrm.userPwd.focus(); // 아이디 입력했으니까 이제 패스워드 입력하는 곳으로 포커스
			
			// 팝업창 닫아주기
			close();			
		}	
	</script>	

</body>
</html>