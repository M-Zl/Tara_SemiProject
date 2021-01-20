<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

    <div class="uploadPageArea">
        <div class="titleArea">
            <select id="localTitleSel" name="boardCode" required>
                <option value="">지역 선택</option>
                <option value="Seoul">서울</option>
                <option value="Gyeonggi">경기도</option>
                <option value="Gangwon">강원도</option>
                <option value="Chungcheongbuk">충청북도</option>
                <option value="Chungcheongnam">충청남도</option>
                <option value="Jeollabuk">전라북도</option>
                <option value="Jeollanam">전라남도</option>
                <option value="Gyeongsangbuk">경상북도</option>
                <option value="delGyeongsangnamFood">경상남도</option>
                <option value="jeju">제주도</option>
                <option value="Ulleungdo">을릉도</option>
                <option value="Dokdo">독도</option>
            </select>
            <select id="titleSel" name="boardCode" required>
                <option value="">게시판 선택</option>
                <option value="sleeping">숙박</option>
                <option value="photo">포토존</option>
                <option value="delFood">맛집</option>
            </select>
            <input type="text" placeholder="제목을 입력해주세요." size="66" required>
        </div>
        <br>
        <div class="locationArea">
            <input type="text" placeholder="해당 위치 찾기" size="95" required>
        </div>
        <br>
        <div class="textArea">
            <textarea cols="100" rows="12" placeholder="내용을 입력해주세요." style="resize: none;" required></textarea>
        </div>
        <br>
        <div class="hashText">
            <input type="text" placeholder="#해쉬태그를 입력하세요." size="95">
        </div>
        <br>
        <div class="fileUpload">
            <input type="file" placeholder="파일추가">
        </div>
        <br>
        <div class="row_btn">
            <div id="row_1">
                <span><input id="row_btn1" type="reset" value="취소"></span> 
                <span id="spanBtn"></span>
                <span><input id="row_btn2" type="submit" value="다음" onclick="<%= request.getContextPath() %>/board/nextUpload"></span>
            </div>
        </div>
        <div id="row_2">
            <span><input id="row_btn3" type="submit" value="&lt; 이전페이지" onclick="javascript:history.back();"></span>
        </div>
    </div>

<%@ include file="/views/common/footer.jsp" %> 