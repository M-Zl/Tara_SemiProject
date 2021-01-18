<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>   
<%
	Member FindMember = (Member)session.getAttribute("FindMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    @font-face {
    font-family: 'TmoneyRoundWindRegular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindRegular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }
    @font-face {
    font-family: 'TmoneyRoundWindExtraBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }

    .wrap{
      width: auto;
      height: 450px;
    }
    .findPwd{
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 20px;
      font-family: 'TmoneyRoundWindRegular';
    }
    .findPwd>h1{
      font-family: 'TmoneyRoundWindExtraBold';
    }

    #pass1, #pass2{
      height: 25px;
      width: 270px;
      border: 2px solid lightgray;
      border-radius: 5px;
    }
    
    #find{
      height: 30px;
      width: 270px;
      background: royalblue;
      color: white;
      border: 1px solid royalblue;
    }
    
</style>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
</head>
<body>
  <hr>
  <div class="wrap">
    <form action="<%=request.getContextPath()%>/changePwd" class="findPwd" method="POST">
      <h1>비밀번호 변경</h1>
      <p>비밀번호를 입력해주세요. 비밀번호는 4~10자 영문자 또는 숫자이어야 합니다.</p><br>
      <input type="hidden" name="userId" value="<%= FindMember.getUserId() %>">
      <input type="password" id="pass1" name="userPwd" placeholder="비밀번호 입력"><br>
      <input type="password" id="pass2" placeholder="비밀번호 확인"><br>
      <input id="find" type="submit" value="변경">
    </form>
  </div>

	<hr>
 <%@ include file="/views/common/footer.jsp" %> 
  
  