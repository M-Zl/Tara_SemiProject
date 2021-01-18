<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

		<div class="boardDetail">
            <div class="board_top">
                <div class="top_btn">
                    <div id="top_btn_area">
                        <input id="goList" type="submit" value="목록" name="goBoardTitle">
                        <span><input id="detail_BeforeBtn" type="submit" value="이전글" name="detail_BeforeBtn"></span>
                        <span><input id="detail_NextBtn" type="submit" value="다음글" name="detail_NextBtn"></span>
                    </div>
                </div>
                <hr>
                <div class="board_header">
                    <div>
                        <span id="LocCode">지역코드</span>
                        <a href="<%=request.getContextPath() %>" class="boardTitle">게시판(goTo게시판페이지)</a><br>
                    </div>
                    <div style="margin-top: 3px;">
                        <span id="titleName">글제목</span>
                    </div>
                    <!-- 프사 + 아이디 + 글 등록날짜 -->
                    <div class="userInfo">
                        <div class="title_Info">
                            <div>
                                <div class="userProfileBox">
                                    <img class="UserImg" src="img/airplane.png" name="userImg">
                                </div>
                            </div>
                            <div class="title_userInfo">
                                <span id="title_userNo" name="userNo">아이디</span><br>
                                <span id="title_createDate" name="commentCreateDate">yyyy.mm.dd</span>
                            </div>
                        </div>
                    </div>
                    <div class="viewInfo">
                        <img class="viewInfo_img BrcImg" src="img/조회수1.png">
                        <span class="boardInfo boardReadCount" name="boardReadCount">5</span>

                        <span>&nbsp;&nbsp;&nbsp;</span>

                        <img class="viewInfo_img commentImg" src="img/댓글1.png">
                        <span class="boardInfo commentCount" name="commentCount">1</span>

                        <span>&nbsp;&nbsp;&nbsp;</span>

                        <img class="viewInfo_img heartImg" src="img/heart.jpg">
                        <span class="boardInfo commentCount" name="commentCount">2</span>
                    </div>
                </div>

                <hr>
                
                <div>
                    <p id="boardConent" name="boardConent">
                        boardConent 게시글 내용<br>
                        상호명 : KH정보교육원<br>
                        주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F
                    </p>
                </div>             
                
                <hr>

                <!-- 하단 댓글 div 일렬정렬 -->
                <div class="commentAreaAll">
                    <div class="comment_Info">
                        <div>
                            <div class="userProfileBox">
                                <img class="UserImg" src="img/airplane.png" name="userImg">
                            </div>
                        </div>
                        <div class="comment_userInfo">
                            <span id="co_userNo" name="userNo">아이디</span><br>
                            <span id="co_createDate" name="commentCreateDate">yyyy.mm.dd</span>
                        </div>
                    </div>
                    <div id="comment_area">
                        <span name="commentContent">댓글내용</span>
                    </div>
                    <hr>
                </div>
            </div>
        </div>

<%@ include file="/views/common/footer.jsp" %> 