<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.mvc.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<Board> createdList = (ArrayList) request.getAttribute("createdList");
	List<Board> likeList = (ArrayList) request.getAttribute("likeList");
%>
<section>
	<link rel="stylesheet" property="stylesheet"
		href="/KH_Tara_Semi/css/mypage.css">
	<div class="main">
		<div class="mypage-header">
			<h1 class="mypage-header__title">MyPage</h1>
		</div>
		<div class="mypage-main">
			<div>
				<h1 class="profile__title">Profile</h2>
				<div class="profile__photo">
					<div><!-- loginMember.getUserimg() --></div>
					<span><a href="<%=request.getContextPath()%>">
					<i class="fas fa-camera-retro fa-3x"></i></a></span>
				</div>
				<div class="profile__info">
<<<<<<< HEAD
					<h3>ID :  <!-- loginMember.getUserId() --></h3>
					<h3>Email : <!-- loginMember.getEmail() --></h3>
=======
					<div style="margin-bottom:50px;">
						<h2>ID :  <%=loginMember.getUserId()%></h3>
						<h2>Email : <%=loginMember.getEmail()%></h3>
					</div>
					<div class="member-delete_btn">
						<a href="<%=request.getContextPath()%>/member/delete?userId=<%= loginMember.getUserId() %>"><i class="fas fa-user-alt-slash fa-5x"></i></a>
						<span>회원탈퇴</span>
					</div>
>>>>>>> e2fdbab241b0397cbb526e3e6fb461a2f05c2aea
				</div>
			</div>
			<div>
				<div class="board-write">
					<div class="board-write__title">
						<h3 class="board-write__title-text">작성한 글목록</h3>
						<span><a href=""><i class="fas fa-bars fa-2x"></i></a></span>
					</div>
					<div class="board-write__list">
						
						<%if(createdList.isEmpty()) {%>
						<div>조회된 게시글이 없습니다.</div>
						<%} else{
							int i=0;
							for(Board board:createdList){
								i++;
						%><div>
							<div class="listbox-left">
								<div class="board-write__list-photo">
									사진
								</div>
								<div class="board-write__list-content">
									<h3><%=board.getBoardTitle()%></h1>
									<div><%=board.getBoardContent()%></div>
								</div>
							</div>
							<div class="listbox-right">
								<span><a href=""><i class="fas fa-pen-fancy fa-2x"></i></a></span>
								<span><a href=""><i class="fas fa-trash-alt fa-2x"></i></a></span>
							</div>
						</div>
						<%	if(i==2)break;} 
						}%>
					</div>
				</div>


				<div class="board-like">
					<div class="board-like__title">
						<h3 class="board-like__title-text">내가 찜한 게시물</h3>
						<span><a href=""><i class="fas fa-bars fa-2x"></i></a></span>
					</div>
					<div class="board-like__list">
						<%if(likeList.isEmpty()) {%>
							<div>조회된 게시글이 없습니다.</div>
							<%} else{
								for(Board board:likeList){
							%>
						<div class="board-like__content">
							<div class="board-like__content-photo">
								사진
							</div>
							<div class="board-like__content-text">
								<h3>
									<%=board.getBoardTitle()%>
								</h3>
								<span>
									<%=board.getBoardContent()%>
								</span>
							</div>
						</div><%}
						} %>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://kit.fontawesome.com/0fe4d45686.js"
		crossorigin="anonymous"></script>
</section>
<%@ include file="/views/common/footer.jsp"%>