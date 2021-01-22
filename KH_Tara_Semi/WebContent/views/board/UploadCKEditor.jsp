<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
    
<script type="text/javascript" src="<%= request.getContextPath() %>/ckeditor/ckeditor.js"></script>    
<style>
	.ckedit{
		width: 50%;
   		margin: auto;
	}
	#star_grade a{
        text-decoration: none;
        color: #afafaf;
    }
    #star_grade a.on{
        color: #4169E1;
    }
</style>

<div class="uploadPageArea">
	<form id="uploadPage" action="<%= request.getContextPath() %>/board/upload" method="post" enctype="multipart/form-data">
		<div class="titleArea_sel">
			<select id="localTitleSel" name="boardCode" required>
                <option value="">지역 선택</option>
                <option value="서울">서울</option>
                <option value="경기도">경기도</option>
                <option value="강원도">강원도</option>
                <option value="충청북도">충청북도</option>
                <option value="충청남도">충청남도</option>
                <option value="전라북도">전라북도</option>
                <option value="전라남도">전라남도</option>
                <option value="경상북도">경상북도</option>
                <option value="경상남도">경상남도</option>
                <option value="제주도">제주도</option>
                <option value="을릉도">을릉도</option>
                <option value="독도">독도</option>
            </select>
            <select id="titleSel" name="boardCode" required>
                <option value="">게시판 선택</option>
                <option value="숙박">숙박</option>
                <option value="포토존">포토존</option>
                <option value="맛집">맛집</option>
            </select>
            <input id="titleName" type="text" placeholder="제목을 입력해주세요." size="66" required>
		</div>
		
		<br>
		
		<div class="ckedit">
			<textarea class="form-control" id="ck_content"></textarea>
		</div>
	</form>
		<br><br><br>
        <p align="center" id="questions">여행지까지 이동할때 이용했던 교통수단을 체크해주세요.</p><br>
<form>
	<div>
        <div class="Transportation_all">
            <div class="Transportation" id="border1">
                <span id="Img_span1"><img src="<%= request.getContextPath() %>/logo/carIcon.png" width="35px"></span><br>
                <span id="Tpt_span_car">자차</span><br>
                <span id="Tpt_choice"><input type="radio" name="choice"></span>
            </div>
            <div class="Transportation" id="border1">
                <span id="Img_span2"><img src="<%= request.getContextPath() %>/logo/trainIcon.png" width="40px"></span><br>
                <span id="Tpt_span_train">대중교통</span><br>
                <span id="Tpt_choice"><input type="radio" name="choice"></span>
            </div>
            <div class="Transportation" id="border1">
                <span id="Img_span3"><img src="<%= request.getContextPath() %>/logo/warking.png" width="40px"></span><br>
                <span id="Tpt_span_walking">뚜벅이</span><br>
                <span id="Tpt_choice"><input type="radio" name="choice"></span>
            </div>
            <div class="Transportation" id="border1">
                <span id="Img_span4"><img src="<%= request.getContextPath() %>/logo/airplane.png" width="40px"></span><br>
                <span id="Tpt_span_airplane">비행기</span><br>
                <span id="Tpt_choice"><input type="radio" name="choice"></span>
            </div>
        </div>
        
        <br><br><br>
        
            <p align="center" id="questions"><span id="money">경비를 입력해주세요.</span></p>
            <div class="inputMoney">
                <input type="range" id="moneyRange" value="50000" min="0" max="300000" step="1000" name="moneyValue" oninput="document.getElementById('moneyInfo').innerHTML=this.value;" required ><br>
            </div>
		<div class="infoMoney">
			<span id="moneyInfo">50,000</span><span>원</span>
		</div>
		
		<br><br><br>
		
		<div>
		<p align="center" id="questions"><span>당신의 평가는?</span>	&nbsp;&nbsp;&nbsp; <span id="grade" style="font-size: 18pt;">0</span><span style="font-size: 18pt;"> / 5</span></p>
	
		<p align="center" id="star_grade">                         
			<a href="#" name="starGrade" id="starGrade" value="1" style="font-size: 25pt;">★</a> 
			<a href="#" name="starGrade" id="starGrade" value="2" style="font-size: 25pt;">★</a> 
			<a href="#" name="starGrade" id="starGrade" value="3" style="font-size: 25pt;">★</a>
			<a href="#" name="starGrade" id="starGrade" value="4" style="font-size: 25pt;">★</a> 
			<a href="#" name="starGrade" id="starGrade" value="5" style="font-size: 25pt;">★</a> 
		</p>
             
		</div>
	</div>
</form>

        <br>		
		
		<div class="row_btn">
            <div id="row_1">
                <input id="row_btn1" type="reset" value="취소">
                <span id="spanBtn"></span>
                <input id="row_btn2" type="submit" value="다음">
            </div>
        </div>
        
        <div id="row_2">
            <span><input id="row_btn3" type="submit" value="&lt; 이전페이지" onclick="javascript:history.back();"></span>
        </div>
</div>
<br>
	
<script>
		$(document).ready(function () {
			CKEDITOR.replace('ck_content', {
				filebrowserUploadUrl:'<%=request.getContextPath() %>/imageUpload',
				height:500
			});
		});
		
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
    