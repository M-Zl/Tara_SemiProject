<%@page import="java.util.List"%>
<%@page import="com.kh.mvc.board.model.vo.BoardReply"%>
<%@page import="com.kh.mvc.board.model.vo.Board"%>
<%@page import="com.kh.mvc.board.model.vo.Board"%>
<%@page import="com.kh.mvc.board.model.vo.BoardComment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
	Board board = (Board)request.getAttribute("board");

	BoardComment boardcomment = (BoardComment)request.getAttribute("boardcomment");
%>

		<div class="boardDetail">
            <div class="board_top">
                <div class="top_btn">
                    <div id="top_btn_area">
                        <input id="goList" type="submit" value="목록" name="goBoardTitle" onclick="javascript:history.back();">
                        <span><input id="detail_BeforeBtn" type="submit" value="이전글" name="detail_BeforeBtn"></span>
                        <span><input id="detail_NextBtn" type="submit" value="다음글" name="detail_NextBtn"></span>
                    </div>
                </div>
                <hr>
                <div class="board_header">
                    <div>
                        <span id="LocCode"><%= board.getLocName() %></span><!-- 지역코드 -->
                        <a href="<%=request.getContextPath() %>" class="boardTitle">게시판</a><br><!-- (숙박 || 맛집 || 포토존) 게시판으로 이동 -->
                    </div>
                    <div style="margin-top: 3px;">
                        <span id="titleName"><%= board.getBoardName() %></span><!-- 글제목 -->
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
                                <span id="title_userNo"><%= board.getUserId() %></span><br>
                                <span id="title_createDate"><%= board.getBoardCreateDate() %></span><!-- 글 생성 날짜 -->
                            </div>
                        </div>
                    </div>
                    <div class="viewInfo">
                        <img class="viewInfo_img heartImg" src="<%= request.getContextPath() %>/logo/heart.jpg">
                        <span class="boardInfo commentCount">9999</span><!-- 좋아요 카운팅 -->

                        <span>&nbsp;&nbsp;&nbsp;</span>

                        <img class="viewInfo_img commentImg" src="<%= request.getContextPath() %>/logo/댓글1.png">
                        <span class="boardInfo commentCount">9999</span><!-- 댓글 수 카운팅 -->

                        <span>&nbsp;&nbsp;&nbsp;</span>

                        <img class="viewInfo_img BrcImg" src="<%= request.getContextPath() %>/logo/조회수1.png">
                        <span class="boardInfo boardReadCount"><%= board.getBoardReadCount() %></span><!-- 조회수 카운팅 -->
                    </div>
                </div>

                <hr>
                
                <div>
                    <p id="boardConent">
                        <%= board.getBoardContent() %>
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
                            <span id="co_userNo"><%= board.getUserId() %></span><br>
                            <span id="co_createDate"><%= board.getBoardCreateDate() %></span>
                        </div>
                    </div>
                    <div id="comment_area">
                        <span name="commentContent"><%= boardcomment.getCommentContent() %></span>
                    </div>
                    <hr>
                </div>
            </div>
        </div>

<%@ include file="/views/common/footer.jsp" %> 