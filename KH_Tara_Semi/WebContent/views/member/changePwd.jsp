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
      <p>
	      비밀번호는 숫자+영문자+특수문자 조합으로 8자리 이상 입력해주세요.
      </p><br>
      <input type="hidden" name="userId" value="<%= FindMember.getUserId() %>">
      <input type="password" id="pass1" name="userPwd" placeholder="비밀번호 입력"><br>
      <input type="password" id="pass2" placeholder="비밀번호 확인" ><br>
      <input id="find" type="submit" value="변경">
    </form>
  </div>
<script >

$("#pass1").change(function(){
    checkPassword($('#pass1').val(),$('#userId').val());
});
function checkPassword(password,id){
    
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        $('#password').val('').focus();
        return false;
    }    
    var checkNumber = password.search(/[0-9]/g);
    var checkEnglish = password.search(/[a-z]/ig);
    if(checkNumber <0 || checkEnglish <0){
        alert("숫자와 영문자를 혼용하여야 합니다.");
        $('#password').val('').focus();
        return false;
    }
    if(/(\w)\1\1\1/.test(password)){
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        $('#password').val('').focus();
        return false;
    }
        
    if(password.search(id) > -1){
        alert("비밀번호에 아이디가 포함되었습니다.");
        $('#password').val('').focus();
        return false;
    }
    return true;
}
</script>
		
	<hr>
 <%@ include file="/views/common/footer.jsp" %> 
  
  