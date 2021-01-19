<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>    

<style>
#loginfrm input {
	margin: 2px;
}

#btn1 {
	background-color: royalblue;
	color: white;
	border: 0px;
	font-weight: bold;
}

#btn2 {
	background-color: lightgray;
	color: rgb(80, 52, 52);
	border: 0px;
	font-weight: bold;
}

#logintitle {
	color: royalblue;
}

#loginfrm {
	text-align: center;
}

.titleArea {
	text-align: center;
}

#findId {
	text-decoration: none;
	font-size: 9pt;
	color: black;
}

#findPwd {
	text-decoration: none;
	font-size: 9pt;
	color: black;
}
#checksaveId {
	font-size: 9pt;
	margin-right: 160px;
}

</style>
</head>
<body>
			
				
				<div class="loginArea">
				
			<div class="titleArea">
			<hr>
    			<h1 id="logintitle">Tara</h1>
			</div>

			<div class="login">
			<form action="<%=request.getContextPath() %>/login" id="loginfrm" method="POST">
			<label> <input type="text" placeholder="아이디를 입력해주세요." size="30"> </label> <br>
			<label> <input type="text" placeholder="패스워드를 입력해주세요." size="30"> </label> <br>
			
			<label id="checksaveId"> <input type="checkbox" name="saveId">아이디 저장</label><br><br>  <!--  saveId == null ? "" : "checked" -->
			
							
		   	<label> <input id="btn1" type="submit"  value="로그인" style="width:230px; height:30px;"></label> <br>
			<a href="<%=request.getContextPath() %>/views/member/join.jsp"><input id="btn2" type="button"style="width:230px; height:30px;" value="회원가입"></input></a> <br><br>
		
			<a href="https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com#"><img alt="" width="200px" height="30px" src="<%=request.getContextPath()%>/images/네이버 로그인.png" > </a> <br>
			<a href="https://accounts.kakao.com/login?continue=https%3A%2F%2Fcs.kakao.com%2Fhelps%3Fcategory%3D25%26service%3D8"> <img alt="" width="202px" height="27px" src="<%=request.getContextPath()%>/images/카카오계정로그인.png" ></a> <br>
					<span id="find">
			<a href="" id="findId">아이디 찾기 |</a>  
							<a href="" id="findPwd">비밀번호 찾기</a></span>											
			</form>
			<br><br>			
			
			</div>
			</div>
			
			<hr>
<%@ include file="/views/common/footer.jsp" %> 