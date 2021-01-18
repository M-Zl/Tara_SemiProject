<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>

<section>
	<div class="boardDetail">
            <div class="board_top">
                <div class="top_btn">
                    <div id="top_btn_area">
                        <input id="goList" type="submit" value="목록" onclick="location.href = '<%= request.getContextPath() %>/board/listColumns.jsp';">
                        <input id="detail_BeforeBtn" type="submit" value="이전글" onclick="location.href = '<%= request.getContextPath() %>/board/#';">
                        <input id="detail_NextBtn" type="submit" value="다음글" onclick="location.href = '<%= request.getContextPath() %>/board/#';">
                    </div>
                </div>
                
                <hr>
                
                <div class="board_header">
                    <div>
                        <span id="LocCode"><%= %></span><!-- 지역 게시판 -->
                        <a href="<%=request.getContextPath() %>/views/listColumns.jsp" class="boardTitle"></a><%=  %><br><!-- 게시판(goTo게시판페이지)  -->
                    </div>
                    <div style="margin-top: 3px;">
                        <span id="titleName">글제목</span>
                    </div>
                    <!-- 프사 + 아이디 + 글 등록날짜 -->
                    <div class="userInfo">
                        <div class="title_Info">
                            <div>
                                <div class="userProfileBox">
                                    <img class="UserImg" src="<%= request.getContextPath()%>" name="userImg"><!-- 유저 프로필 사진  -->
                                </div>
                            </div>
                            <div class="title_userInfo">
                                <span id="title_userNo" name="userNo"><%=  %></span><br><!-- 유저 아이디  -->
                                <span id="title_createDate" name="commentCreateDate"><%=  %></span><!-- 글 등록날짜  -->
                            </div>
                        </div>
                    </div>
                    <div class="viewInfo">
                        <img class="viewInfo_img BrcImg" src="<%= request.getContextPath()%>img/조회수1.png">
                        <span class="boardInfo boardReadCount" name="boardReadCount"><%=   %></span><!-- 조회수  -->

                        <span>&nbsp;&nbsp;&nbsp;</span>

                        <img class="viewInfo_img commentImg" src="<%= request.getContextPath()%>img/댓글1.png">
                        <span class="boardInfo commentCount" name="commentCount"><%=  %></span><!-- 댓글 수  -->

                        <span>&nbsp;&nbsp;&nbsp;</span>

                        <img class="viewInfo_img heartImg" src="<%= request.getContextPath()%>img/heart.jpg">
                        <span class="boardInfo commentCount" name="commentCount"><%=  %></span><!-- 좋아요 수  -->
                    </div>
                </div>

                <hr>
                
                <!-- 글 내용 -->
                <div>
                    <p id="boardConent" name="boardConent">
                    	<%=  %>
                    </p>
                </div>             
                
                <hr>

                <!-- 하단 댓글 div 일렬정렬 -->
                <div class="commentAreaAll">
                    <div class="comment_Info">
                        <div>
                            <div class="userProfileBox">
                                <img class="UserImg" src="img/airplane.png" name="userImg"><!-- 댓글 유저 프로필 -->
                            </div>
                        </div>
                        <div class="comment_userInfo">
                            <span id="co_userNo" name="userNo"><%= %></span><br><!-- 댓글 아이디 -->
                            <span id="co_createDate" name="commentCreateDate"><%= %></span><!-- 댓글 등록날짜 -->
                        </div>
                    </div>
                    <div id="comment_area">
                        <span name="commentContent"><%= %></span><!-- 댓글 내용 -->
                    </div>
                    
                    <hr>
                    
                </div>
            </div>
        </div>
</section>

<%@ include file="/views/common/footer.jsp" %> 
    