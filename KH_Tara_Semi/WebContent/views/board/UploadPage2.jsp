<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
 <script src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
	<style>
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: yellow;
    }

</style>
	<div>
        <div class="Transportation_all">
            <div class="Transportation" id="border1">
                <span id="Img_span1"><img src="<%= request.getContextPath() %>/logo/carIcon.png" width="35px"></span><br>
                <span id="Tpt_span_car">자차</span><br>
                <span id="Tpt_choice"><input type="radio" name="choice_car"></span>
            </div>
            <div class="Transportation" id="border1">
                <span id="Img_span2"><img src="<%= request.getContextPath() %>/logo/trainIcon.png" width="40px"></span><br>
                <span id="Tpt_span_train">대중교통</span><br>
                <span id="Tpt_choice"><input type="radio" name="choice_train_bus"></span>
            </div>
            <div class="Transportation" id="border1">
                <span id="Img_span3"><img src="<%= request.getContextPath() %>/logo/warking.png" width="40px"></span><br>
                <span id="Tpt_span_walking">뚜벅이</span><br>
                <span id="Tpt_choice"><input type="radio" name="choice_walking"></span>
            </div>
            <div class="Transportation" id="border1">
                <span id="Img_span4"><img src="<%= request.getContextPath() %>/logo/airplane.png" width="40px"></span><br>
                <span id="Tpt_span_airplane">비행기</span><br>
                <span id="Tpt_choice"><input type="radio" name="choice_airplane"></span>
            </div>
        </div>
        
        <br>
        <form action="">
            <p align="center"><span id="money">경비를 입력해주세요.</span></p>
            <div class="inputMoney">
                <input type="range" id="moneyRange" value="50000" min="0" max="300000" step="1000" name="moneyValue" oninput="document.getElementById('moneyInfo').innerHTML=this.value;" required ><br>
            </div>
            <div class="infoMoney">
                <span id="moneyInfo">50,000</span><span>원</span>
            </div>
            <br><br>
            <div >
             <p align="center"><span>당신의 평가는?</span>	&nbsp;&nbsp;&nbsp; <span id="grade" style="font-size: 11pt;">0</span><span style="font-size: 11pt;"> / 5</span></p>
             
          
                <p align="center" id="star_grade">                         
                 <a href="#" name="starGrade" id="starGrade" value="1" style="font-size: 25pt;">★</a> 
                 <a href="#" name="starGrade" id="starGrade" value="2" style="font-size: 25pt;">★</a> 
                 <a href="#" name="starGrade" id="starGrade" value="3" style="font-size: 25pt;">★</a>
				 <a href="#" name="starGrade" id="starGrade" value="4" style="font-size: 25pt;">★</a> 
				 <a href="#" name="starGrade" id="starGrade" value="5" style="font-size: 25pt;">★</a> 
				
                </p>
             
               
            </div>
        </form>

        <br>
        <div class="row_btn">
            <div id="row_1">
                <span><input id="row_btn1" type="reset" value="취소" ></span> 
                <span id="spanBtn"></span>
                <span><input id="row_btn2" type="submit" value="다음" name="uploadNextBtn_2"></span>
            </div>
        </div>
        <div id="row_2">
            <span><input id="row_btn3" type="submit" value="&lt;&nbsp;&nbsp;이전페이지" onclick="javascript:history.back();"></span>
        </div>
    </div>
    
    <script>
    $('#star_grade a').click(function(){
        $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
        $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
        console.log($(this).attr("value"));
      $("#grade").text($(this).attr("value"));
        return false;
    });
    
    $("#row_btn2").click(function() {
    	if( $("#grade").text() == 0) {
      		alert("별점을 주세요.");
      	} 
    	return false;
    });
   
    
    
  
    </script>
  
   <%@ include file="/views/common/footer.jsp" %>
