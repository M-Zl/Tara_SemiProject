<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/views/common/header.jsp" %>
    <script src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
    <style>
    
        .joinfrm {
          	margin: auto;
        	
        }
        
        .agree-container {
        	
        }
        .agree{
         border:1px lightgray solid;
           width: 390px;
           height: 250px;
            overflow: scroll;
            font-size: 10pt;
        	
        }
      
        .left{
           float:left;
          
           margin-left: 80px;
          
        
        }
       

        .right{
       		display: inline-block;
           
           margin-left: 20px;
           overflow: scroll;
        }
        
        
        
        .join-container {
        	text-align: center;
        	margin: 0 auto;
        	   width: 863px;
        	height: 460px;       	
        	border: 1px solid lightgray;
        	
        }
        
 .join-container input {
	 margin:3px;
}

 .join-container table {
	margin:0 auto;
 }

.join-container table th {
	padding:0 100px; 
	text-align:right;
}

.join-container table td {
	padding-right: 10px;
	padding:0 0px; 
	text-align:left;
	}

.join-container table tr {	
		
	}
#joininfo {
	margin-right: 40px;
	font-family: Arial;
}

h1 {
	color: royalblue;
}

#joinSubmit {
	text-align: center;
}

#joinbtn {
	border: 0;
	background-color: lightgray;
	color: rgb(80, 52, 52);
	font-family: Arial;
	font-weight: 500;
	font-size: 12pt
	
}

th {
	font-family: Arial;
	font-size: 9pt;
	font-weight: lighter;
}

#idCheck {
	background-color: lightgray;
	color: rgb(80, 52, 52);
	border: 0;
	height: 23px;
	width: 70px;
	
}

#check {
	font-weight: lighter;
	font-size: 10pt;
}


#p-check {
	font-family: Arial;
}

#a-check {
	font-family: Arial;
}
   
#travel {
	font-size: 9pt;
} 

#id {
	font-size: 9pt;
}       
    </style>
  
<section>
	<hr>
         <div class="join-container">
         
            <form action="" method="POST" name="memberjoinfrm" id="joinArea">
                    <table >
                     <h3></h3><br>
             <tr>
             <th>회원구분</th>
             				<td> <input id="member_type" type="radio" checked="checked"/><label  style="font-weight: lighter; font-size: 10pt;"> 일반 회원</label> </td> 
             
             </tr> 
             <tr></tr>         
             <tr></tr>         
             <tr></tr>         
             <tr></tr>         
            <tr>
            <th>아이디  </th>
                            <td><input id="newId" name="userId"  type="text" required>
                            	<input type="button" id="idCheck" value="check" ><label id="id">(영문소문자/숫자, 4~10자)</label>
                            </td>
                        </tr>
            <tr></tr>         
             <tr></tr> 
             <tr></tr> 
             <tr></tr> 
            <th >비밀번호  </th>
                            <td><input id="pass1" name="pass1"  maxlength="10"  value="" type="password" required> 
                            <label id="id">(영문소문자/숫자, 4~10자)</label>
                            </td>
                        </tr>
             <tr></tr> 
            <tr></tr>         
            <tr></tr>         
            <tr></tr>         
            <th >비밀번호 확인 </th>
                            <td><input id="pass2" name="pass2" maxlength="10"  value="" type="password"  required/></td>
                        </tr>
            <tr></tr>         
             <tr></tr> 
             <tr></tr> 
             <tr></tr> 
           
           <tr> <th>이름 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/> </th>
             <td>
                 <input id="userName" name="userName" placeholder="" maxlength="10" value="" type="text" required >
                            
                            </td>
                        </tr>
              <tr></tr>         
             <tr></tr>  
             <tr></tr>  
             <tr></tr>  
                <tr>
                	<th>거주지 </th>
                	<td> 
                		<select id="location1" name="location1" style="height: 22px;">
                			<option value="">--------</option>
                			<option value="서울시">수도권</option>
                			<option value="충청권">충청권</option>
                			<option value="호남권">호남권</option>
                			<option value="경북권">경북권</option>
                			<option value="경남권">경남권</option>
                			<option value="강원">강원</option>
                			<option value="제주">제주</option>
                		</select>
                	</td>
                </tr>                   
               <tr></tr>         
             <tr></tr> 
             <tr></tr> 
             <tr></tr> 
             	<tr><th> 여행 가고 싶은 곳  <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/> 
             	 <br> (여행 갈 곳)&nbsp;&nbsp;  </th>
             	<td>
             		<label id="travel"><input type="checkbox" name="travel" id="travel0" value="서울시">서울시</label>
             		<label id="travel"><input type="checkbox" name="travel" id="travel1" value="경기도">경기도</label>
             		<label id="travel"><input type="checkbox" name="travel" id="travel2" value="인천시">인천시</label>
             		<label id="travel"><input type="checkbox" name="travel" id="travel3" value="경상북도">경상북도</label>
             		<label id="travel"><input type="checkbox" name="travel" id="travel4" value="경상남도">경남남도</label><br>
             		<label id="travel"><input type="checkbox" name="travel" id="travel5" value="충청북도">충청북도</label>
             		<label id="travel"><input type="checkbox" name="travel" id="travel6" value="충청남도">충청남도</label>
             		<label id="travel"><input type="checkbox" name="travel" id="travel7" value="전라북도">전라북도</label>
             		<label id="travel"><input type="checkbox" name="travel" id="travel8" value="전라남도">전라남도</label>
             		<label id="travel"><input type="checkbox" name="travel" id="travel9" value="강원도">강원도</label><br>
             		<label id="travel"><input type="checkbox" name="travel" id="travel10" value="제주도">제주도</label>
             		<label id="travel"><input type="checkbox" name="travel" id="travel11" value="독도">독도</label>
             		<label id="travel"><input type="checkbox" name="travel" id="travel12" value="울릉도">울릉도</label>
             	
                			 				
             	</td>
             	
                </tr>
              <tr></tr>         
             <tr></tr>             
             <tr></tr>             
             <tr></tr>             
                   <tr>  <th >휴대전화 </th>
                <td><select id="mobile1" name="mobile1"  style="height: 22px;">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
</select> - <input id="mobile2" name="mobile2" maxlength="4" size="2"  type="text"> - <input id="mobile3" name="mobile3" maxlength="4" size="2"  value="" type="text"  /></td>
            </tr>
           <tr></tr>         
             <tr></tr> 
             <tr></tr> 
             <tr></tr> 
             <tr>
            <th >이메일 </th>
                            <td><input id="email1" name="email1" size="10" value="" type="text" required > 
                                <select name="" id="email2" name="eamil2" style="width: 100px; height: 21px;">
                                    <option value="@naver.com">@naver.com</option>
                                    <option value="@gmail.com">@gmail.com</option>
                                    <option value="@daum.net">@daum.net</option>
                                    <option value="">직접 작성</option>
                                </select>
                            </td>                            
                        </tr>              

				</table>
				  </form>
				   </div>
				  <br>
				 
                      
             	
             	<div class="agree-container">
                    <div class="left">
                 	
                  <h5 id="a-check">&nbsp;&nbsp;&nbsp;AGREEMENT CHECK </h3>
                
                   <div class="agreeArea">
        			<div class="agree">			
                    <p>■ 수집하는 개인정보 항목 및 수집방법</p><p>가. 수집하는 개인정보의 항목</p><p>o 회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p><p>- 회원가입시 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보</p>
                    <p>- 서비스 신청시 : 주소, 결제 정보</p><p>o 서비스 이용 과정이나 사업 처리 과정에서 서비스이용기록, 접속로그, 쿠키, 접속 IP, 결제 기록, 불량이용 기록이 생성되어 수집될 수 있습니다.</p><p>나. 수집방법</p><p>- 홈페이지, 서면양식, 게시판, 이메일, 이벤트 응모, 배송요청, 전화, 팩스, 생성 정보 수집 툴을 통한 수집</p><p><br></p>
                    <p>■ 개인정보의 수집 및 이용목적</p><p>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p><p>o 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</p><p>콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스</p><p>o 회원 관리</p><p>회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달</p><p>o 마케팅 및 광고에 활용</p><p>이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계</p><p><br></p>
                    <p>■ 개인정보의 보유 및 이용기간</p><p>고객의 개인정보는 회원탈퇴 등 수집 및 이용목적이 달성되거나 동의철회 요청이 있는 경우 지체없이 파기됩니다.</p><p>단,「전자상거래 등에서의 소비자보호에 관한 법률」 등 관련법령의 규정에 의하여</p><p>다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 그 기간동안 보유합니다.</p><p>가. 「전자상거래 등에서의 소비자보호에 관한 법률」 제6조</p><p>- 계약 또는 청약 철회 등에 관한 기록 : 5년</p><p>- 대금결재 및 재화 등의 공급에 관한 기록 : 5년</p><p>- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</p><p>나. 「통신비밀보호법」 제15조의2</p><p>- 방문(로그)에 관한 기록: 3개월</p><p>다. 기타 관련 법령 등</p><p><br></p>
                    <p>※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.</p>						    
    				</div>
    				
                    <p id="check"><span >이용약관에 동의하십니까?</span> <input id="agreeCheck"  type="checkbox"  /><label for="agreeCheck" >동의함</label></p>
             		
               </div>
               </div>
                     
                                   
                    <div class="right">
               <h5 id="p-check">&nbsp;&nbsp;&nbsp;&nbsp;PRIVACY CHECK</h3>
                   
                    
                  
                     <div class="agreeArea">
        			<div class="agree">		
                    <p>■ 수집하는 개인정보 항목 및 수집방법</p><p>가. 수집하는 개인정보의 항목</p><p>o 회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p><p>- 회원가입시 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보</p><p>- 서비스 신청시 : 주소, 결제 정보</p>
                    <p>o 서비스 이용 과정이나 사업 처리 과정에서 서비스이용기록, 접속로그, 쿠키, 접속 IP, 결제 기록, 불량이용 기록이 생성되어 수집될 수 있습니다.</p><p>나. 수집방법</p><p>- 홈페이지, 서면양식, 게시판, 이메일, 이벤트 응모, 배송요청, 전화, 팩스, 생성 정보 수집 툴을 통한 수집</p><p><br></p><p>■ 개인정보의 수집 및 이용목적</p><p>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p><p>o 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</p>
                    <p>콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스</p><p>o 회원 관리</p><p>회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달</p><p>o 마케팅 및 광고에 활용</p><p>이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계</p><p><br></p>
                    <p>■ 개인정보의 보유 및 이용기간</p><p>고객의 개인정보는 회원탈퇴 등 수집 및 이용목적이 달성되거나 동의철회 요청이 있는 경우 지체없이 파기됩니다.</p><p>단,「전자상거래 등에서의 소비자보호에 관한 법률」 등 관련법령의 규정에 의하여</p><p>다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 그 기간동안 보유합니다.</p>
                    <p>가. 「전자상거래 등에서의 소비자보호에 관한 법률」 제6조</p><p>- 계약 또는 청약 철회 등에 관한 기록 : 5년</p><p>- 대금결재 및 재화 등의 공급에 관한 기록 : 5년</p><p>- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</p><p>나. 「통신비밀보호법」 제15조의2</p><p>- 방문(로그)에 관한 기록: 3개월</p><p>다. 기타 관련 법령 등</p><p><br></p><p>※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.</p>						      
                      </div>
               	       
               	        <p id="check"><span >개인정보 수집 및 이용에 동의하십니까?</span> <input id="privacyCheck" type="checkbox"  /><label for="privacyCheck" >동의함</label></p>    
                    </div>                 
                  
                                 
                    </div>
              </div>
           
           </div>
          
           
           <form action="" id="joinSubmit" >
           	<input id="joinbtn" type="submit"  value="REGISTER" style="width:180px; height:80px;">	
	 		
           </form>
           
           <form name="idCheckForm">
	 		<input type ="hidden" name="userId">
	 	</form>
	 	<br>
          <hr>   
          </section>
<script >
$(document).ready(() => {
	$("#pass2").blur((e) => {
		let pass1 = $("#pass1").val();
		let pass2 = $(e.target).val();
		if(pass1.trim() != pass2.trim()){
			alert("비밀번호가 일치하지 않습니다.");
			$("#pass1").val("");
			$(e.target).val("");
			$("#pass1").focus();
		}
	});		
	
	
	

//아이디 중복을 확인 처리 콜백함수
$("#idCheck").on("click", () => {
	// 중복확인 전에 아이디값이 4글자이상인지 확인
	let id = $("#newId").val().trim();
	
	if(id.length < 4) {
		alert("아이디는 최소 4글자이상 입력해주세요!");
		
		return;
	}



	
	// 중복 확인할 새창 띄우기
	const url = "<%= request.getContextPath()%>/member/idCheck";
	const title = "duplicate";
	const status = "left=500px, top=100px, width=300px, height=200px";
	
	// window.open
	open("", title, status);
	
	idCheckForm.target = title; // form 전송하는 윈도우를 설정
	idCheckForm.action = url;// checkId.jsp라는 새창에서 처리하므로 url지정
	idCheckForm.method = "POST";
	idCheckForm.userId.value = id;
    
	// form 전송하기
	idCheckForm.submit();
	
});

$("#joinbtn").on("click", () => {
	
if ($("#agreeCheck").is(":checked") == true && $("#privacyCheck").is(":checked") == true) {
	alert("가입을 축하합니다.");
	console.log("가입함");
} else {
	alert("이용약관에 동의해주세요.");
	console.log("가입안됨");
}

});


$('#joinbtn').on({
    'mouseenter': function() {
        $(this).css({"background": "royalblue", "color": "white"});
        console.log('mouseenter');
    },
'mouseleave': function() {
        $(this).css({'background': "lightgray", "color": "rgb(80, 52, 52)"});
        console.log('mouseleave');
    }
   });
   
});




</script>
    
       
<%@ include file="/views/common/footer.jsp" %>