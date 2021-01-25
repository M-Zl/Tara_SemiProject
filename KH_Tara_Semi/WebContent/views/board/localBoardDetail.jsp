<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.mvc.board.model.vo.Board"%>
<%@page import="com.kh.mvc.board.model.vo.Board"%>
<%@page import="com.kh.mvc.board.model.vo.BoardComment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
	Board board = (Board)request.getAttribute("board");
	List<BoardComment> replies = (List)request.getAttribute("replies");
%>
  <style>
@font-face {
	font-family: 'TmoneyRoundWindRegular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindRegular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'TmoneyRoundWindExtraBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.board__detail {
	width: auto;
	min-height: 600px;
	border: 2px solid gray;
	border-radius: 20px;
	padding: 30px;
	font-family: 'TmoneyRoundWindRegular';
}

.board__locName {
	height: 35px;
	margin: 5px;
	font-size: 25px;
	font-weight: 700;
}

.board__profile {
	margin: 5px;
	border: 2px solid lightgray;
	border-radius: 5px;
	height: 25px;
}

.board__title {
	margin: 5px;
	border: 2px solid lightgray;
	border-radius: 5px;
	height: 25px;
}

.board__contents {
	margin: 5px;
	border: 2px solid lightgray;
	border-radius: 5px;
	min-height: 400px;
	overflow: scroll;
}

.board__contents>img {
	width: 800px;
	hedth: 500px;
}

.board__date {
	margin: 5px;
}

.board__count {
	margin: 5px;
}

.board__count>img {
	margin-top: 5px;
	width: 20px;
	height: 20px;
}

.board__count>button {
	border: none;
	background-color: transparent;
}

.board__count>button>img {
	margin-top: 5px;
	width: 20px;
	height: 20px;
}

.board__button {
	margin: 5px;
	text-align: center;
	padding: 7px 7px;
}

.board_button__notUser {
	margin: 5px;
	text-align: center;
}

.board__button>button {
	width: 80px;
	height: 30px;
	border: none;
	font-size: 15px;
}

#modify {
	background: royalblue;
	color: white;
}

#delete {
	background: lightslategray;
	color: white;
}

#go_list {
	text-align: center;
	width: 80px;
	height: 30px;
	border: none;
	font-size: 15px;
	background: royalblue;
	color: white;
}

.board__comments {
	margin: 5px;
	border: 2px solid lightgray;
	border-radius: 5px;
}

#btn-insert {
	width: 70px;
	height: 50px;
	border: none;
	border-radius: 5px;
	background: royalblue;
	color: white;
}

#tip{
	font-weight: 600;
}

</style>
  
<section>
    <div class="board__detail">
      <div class="board__locName">
      	<%= board.getLocName() %>
      </div>
      <div class="board__profile">
        <img id="board__profile_img" src="" alt="">
        <span id="board__writer"><%= board.getUserId() %></span>
      </div>
      <div class="board__title">
        <%= board.getBoardTitle() %>
      </div>
      <div class="board__contents">
        <div id= "tip">
          교통수단 : <%= board.getTransport() %><br>
          여행경비 : <%= board.getTravelMoney() %>원<br>
          총 점수 : <%= board.getBoardScore() %>점<br><br>
        </div>
        <div id="content">
          <%= board.getBoardContent() %>
        </div>
      </div>
      <div class="board__date">
        작성일자 : <%= board.getBoardCreateDate() %>
      </div>
      <div class="board__count">
        <button onclick="likeUpdate()"><img src="<%= request.getContextPath() %>/logo/heart.jpg" alt=""></button>&nbsp; <%=board.getlCount() %> &nbsp;
        <img src="<%= request.getContextPath() %>/logo/조회수1.png" alt="">&nbsp;<%= board.getBoardReadCount() %> &nbsp;
        <img src="<%= request.getContextPath() %>/logo/댓글1.png" alt="">&nbsp; <%= board.getcCount() %> &nbsp;
      </div>
      <hr>
      <% if(loginMember != null && (loginMember.getUserId().equals(board.getUserId()) 
					|| loginMember.getUserRole() == 2)) { %>
      <div class="board__button">
        <button id="modify" type="button" onclick="updateBoard()">수정</button>
        <button id="delete" type="button" onclick="deleteBoard()">삭제</button>
        <button id="go_list" type="button" onclick="history.back()">뒤로가기</button>
      </div>
      <% } else{ %>
      <div class="board_button__notUser">
      	<button id="go_list" type="button" onclick="history.back()">뒤로가기</button>
      </div>
      <% } %>
      <div class="board__comments">
       	<div id="comment-container">
	    	<div class="comment-editor">
	    		<form action="<%=request.getContextPath() %>/board/comment" method="post">
	    			<input type="hidden" name="boardNo"  id="boardNo" value="<%=board.getBoardNo()%>">
	    			<input type="hidden" name="writerNo"  id="writerNo" value="<%=board.getBoardWriteNo()%>">
	    			<input type="hidden" name="writer" value="<%=loginMember != null ? loginMember.getUserId() : "" %>">
					<table>
						<tr>
							<td><textarea name="content" cols="130" rows="3" onfocus="checkLogin()"></textarea></td>
							<td><button type="submit" id="btn-insert">등록</button></td>	
						</tr>
	    			</table>
	    		</form>
	    	</div>
	    </div>
	    <table id="tbl-comment">
	    	<% for(BoardComment reply : replies) { %>
		    	<tr class="level1">
		    		<td>
		    			<sub class="comment-writer"><%= reply.getUserId() %></sub>
		    			<sub class="comment-date"><%= reply.getCommentCreateDate() %></sub>
		    			<br>
		    			<%= reply.getCommentContent() %>
		    		</td>
		    		<td>
	    			<% if(loginMember != null && (loginMember.getUserId().equals(reply.getUserId()) 
	    					|| loginMember.getUserRole() == 2)) { %>
	    				<input type="hidden" id="commentNo" name="commentNo" value="<%= reply.getCommentNo()%>">
	    				<button class="btn-delete" onclick="deleteComment()">삭제</button>
	    			<%} %>
		    		</td>
		    	</tr>
	    	<%} %>
	    </table>
    </div>
      </div>
</section>
<script>
	function updateBoard(){
		location.href = "<%=request.getContextPath()%>/board/update?boardNo=<%=board.getBoardNo()%>";
	}
	
	function deleteBoard(){		
		if(confirm("정말로 게시글을 삭제 하시겠습니까?")){
			location.replace('<%=request.getContextPath()%>/board/delete?boardNo=<%=board.getBoardNo()%>');
		}
	}
	
	function deleteComment(){
		var commentNo = document.getElementById("commentNo").value;
		
		if(confirm("댓글을 삭제 하시겠습니까?")){
			location.replace("<%=request.getContextPath()%>/comment/delete?boardNo=<%=board.getBoardNo()%>&commentNo=" + commentNo);
		}
	}
	
	function likeUpdate(){
		location.href = "<%=request.getContextPath()%>/board/like?boardNo=<%=board.getBoardNo()%>&userNo=<%=board.getBoardWriteNo()%>";
	}
</script>
<%@ include file="/views/common/footer.jsp" %> 