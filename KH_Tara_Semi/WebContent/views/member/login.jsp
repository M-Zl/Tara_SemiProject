<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>    
<%@page import="com.kh.mvc.member.model.vo.Member"%>

<%
	String saveId = null;

	Member loginMember = (Member)session.getAttribute("loginMember");


%>
<style>
#loginfrm input {
	margin: 2px;
}

#btn1 {
	background-color: royalblue;
	color: white;
	border: 0px;
	font-weight: bold;
	cursor: pointer;
}

#btn2 {
	background-color: lightgray;
	color: rgb(80, 52, 52);
	border: 0px;
	font-weight: bold;
	cursor: pointer;
}

#logintitle {
	color: royalblue;
}

#loginfrm {
	text-align: center;
}

#userId,#userPwd{
	height:27px;
	border: 1px solid gray;
	border-radius: 7px; 
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
			 <input name="userId" id="userId" type="text" placeholder="아이디를 입력해주세요." size="30" required>  <br>
			 <input name="userPwd" id="userPwd" type="text" placeholder="패스워드를 입력해주세요." size="30" required>  <br>
			
			<label id="checksaveId"> <input type="checkbox" name="saveId" <%=saveId == null ? "" : "checked" %>>아이디 저장</label><br><br>  <!--  saveId == null ? "" : "checked" -->
			
							
		   	<input id="btn1" type="submit"  value="로그인" style="width:230px; height:30px;"> <br>
			<input id="btn2" type="button"style="width:230px; height:30px;" value="회원가입" onclick="location.replace('<%=request.getContextPath() %>/member/join');"></input><br><br>
		
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