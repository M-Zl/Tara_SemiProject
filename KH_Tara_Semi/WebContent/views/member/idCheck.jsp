<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
border: 0;
	background-color: royalblue;
	color: white
	
	
}	

#idCheck {
	background-color:  lightgray;
	color: rgb(90, 52, 52);
	border: 0;
	height: 28px;
	width: 100px;
	
}

</style>
</head>
<body>

		<!-- 아이디 중복검사시 나오는 새장!!! -->
	<div id="idCheck-container">
		
		
		<form action="<%=request.getContextPath() %>/member/idCheck "  method="POST">
		
		<label style="font-size: 11pt;">아이디는 영문(소문자), 숫자로 4~10자 이내로 입력해 주세요.</label> <br><br>
		<input type="text" name="userId" id="newId"  style="height: 22px" required> <!-- 다시 아이디 입력창 -->
				<input type="submit" id="idCheck" onclick="return validate();" value="중복확인" > <br><br>
		
		<label style="font-weight: lighter; font-size: 10pt;">공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다. <br>
				숫자로 시작하거나, 숫자로만 이루어진 아이디는 사용할 수 없습니다.</label>
		</form>
		 <br><br>
	
		<input id="setIdbtn" type="button" onclick="setUserId()" value="사용하기" style="width: 100px; height: 30px;">		
	
		</div>
		
		<script>
		function validate(){
			let id = document.getElementById("newId").value;
			
			if(id.trim().length<4){
				alert("아이디는 4글자 이상 입력하세요!");
				document.getElementById("userId").focus();
				return false;
			}
		}
		
		// 이미 사용중인 아이디를 입력해서 다시 입력하는 input에 입력
		function setUserId() {
			// 입력 된 id를 부모창에 대입
			const id = "<%= request.getParameter("userId") %>";
			
			opener.memberjoinfrm.userId.value = id;  // 중복검사 창에 입력한 아이디를 회원가입 폼 아이디에 입력
			opener.memberjoinfrm.userPwd.focus(); // 아이디 입력했으니까 이제 패스워드 입력하는 곳으로 포커스
			
			// 팝업창 닫아주기
			close();			
		}	
	</script>	

</body>
</html>