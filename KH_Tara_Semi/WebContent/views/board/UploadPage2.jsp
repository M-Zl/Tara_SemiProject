<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

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
                <input type="range" id="moneyRange" value="50" min="0" max="100" step="5" name="moneyValue" required><br>
            </div>
            <div class="infoMoney">
                <span>00,000 원</span>
            </div>
            <br><br>
            <div class="yourEval">
                <label id="yourEval_ment">당신의 평가는?</label>&nbsp;&nbsp;&nbsp;
                <label class="starPoint">
                    <input type="radio" name="star">
                    <input type="radio" name="star">
                    <input type="radio" name="star">
                    <input type="radio" name="star">
                    <input type="radio" name="star">
                </label>&nbsp;&nbsp;&nbsp;
                <span id="star_counter">0</span>/<span id="max_counter">5</span>
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
            <span><input id="row_btn3" type="submit" value="&lt;&nbsp;&nbsp;이전페이지"  onclick="javascript:history.back();"></span>
        </div>
    </div>

<%@ include file="/views/common/footer.jsp" %> 