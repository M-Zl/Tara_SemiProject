<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>   
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

    #name,#email,#id{
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
</head>
<body>
 <hr>
  <div class="wrap">
    <form action="<%=request.getContextPath() %>/findPwd" class="findPwd" method="POST">
      <h1>비밀번호 찾기</h1>
      <p>비밀번호는 이름, 가입한 아이디, 가입시 입력하신 이메일을 통해 비밀번호를 변경할 수 있습니다.</p><br>
      <input type="text" id="id" name="id" placeholder="아이디" required><br>
      <input type="text" id="name" name="name" placeholder="이름" required><br>
      <input type="email" id="email" name="email" placeholder="이메일" required><br>
      <input id="find" type="submit" value="찾기">
    </form>
  </div>
  <hr>

<%@ include file="/views/common/footer.jsp" %> 