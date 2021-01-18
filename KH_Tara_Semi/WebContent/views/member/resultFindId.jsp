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
    .resultFindId{
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 120px;
      font-family: 'TmoneyRoundWindRegular';
    }
    .resultFindId>h1{
      font-family: 'TmoneyRoundWindExtraBold';
    }
    #find{
      height: 30px;
      width: 270px;
      background: royalblue;
      color: white;
      border: 1px solid royalblue;
    }
    
  </style>
</head>
<body>
<hr>
  <div class="wrap">
    <form action="<%=request.getContextPath() %>/views/member/login.jsp" class="resultFindId" method="POST">
      <h1>아이디 찾기 성공!</h1>
      <span>회원님의 아이디는 <b><%= FindMember.getUserId() %></b> 입니다.</span><br>
      <input id="find" type="submit" value="로그인"><br>
      <input id="find" type="button" onclick="location.href = '<%= request.getContextPath() %>/findPwd';" value="비밀번호 찾기">
    </form>
  </div>
  <hr>
<%@ include file="/views/common/footer.jsp" %> 