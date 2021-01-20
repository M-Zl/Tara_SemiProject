<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section>
	<link rel="stylesheet" property="stylesheet"
		href="/KH_Tara_Semi/css/mypage.css">
	<div class="main">
		<div class="mypage-header">
			<h1 class="mypage-header__title">MyPage</h1>
		</div>
		<div class="mypage-main">
			<div>
				<h2 class="profile__title">Profile</h2>
				<div class="profile__photo">
					<div><!-- loginMember.getUserimg() --></div>
					<span><i class="fas fa-camera-retro fa-3x"></i></span>
				</div>
				<div class="profile__info">
					<div style="margin-bottom:50px;">
						<h3>ID :  <%=loginMember.getUserId()%></h3>
						<h3>Email : <%=loginMember.getEmail()%></h3>
					</div>
					<div class="member-delete_btn">
						<a href="#"><i class="fas fa-user-alt-slash fa-5x"></i></a>
						<span>회원탈퇴</span>
					</div>
				</div>
			</div>
			<div>
				<div class="board-write">
					<div class="board-write__title">
						<h3 class="board-write__title">작성한 글목록</h3>
						<span><a href=""><i class="fas fa-bars fa-2x"></i></a></span>
					</div>
					<div class="board-write__list">
						<div>
							<div class="listbox-left">
								<div class="board-write__list-photo">
									<div>사진</div>
								</div>
								<div class="board-write__list-content">
									<h4><!-- board.getBoardTitle() --></h4>
									<h5><!-- board.getBoardContent() --></h5>
								</div>
							</div>
							<div class="listbox-right">
								<span><a href=""><i class="fas fa-pen-fancy fa-2x"></i></a></span>
								<span><a href=""><i class="fas fa-trash-alt fa-2x"></i></a></span>
							</div>
						</div>
						<div>
							<div class="listbox-left">
								<div class="board-write__list-photo">
									<div>사진</div>
								</div>
								<div class="board-write__list-content">
									<h4><!-- board.getBoardTitle() --></h4>
									<h5><!-- board.getBoardContent() --></h5>
								</div>
							</div>
							<div class="listbox-right">
								<span><a href=""><i class="fas fa-pen-fancy fa-2x"></i></a></span>
								<span><a href=""><i class="fas fa-trash-alt fa-2x"></i></a></span>
							</div>
						</div>
					</div>
				</div>


				<div class="board-like">
					<div class="board-like__title">
						<h3>내가 찜한 게시물</h3>
						<span><a href=""><i class="fas fa-bars fa-2x"></i></a></span>
					</div>
					<div class="board-like__list">
						<div class="board-like__content">
							<div class="board-like__content-photo">
							사진</div>
							<div class="board-like__content-text">
							<!-- board.getBoardContent() -->
							</div>
						</div>
						<div class="board-like__content">
							<div class="board-like__content-photo">
								사진
							</div>
							<div class="board-like__content-text">
								<h5>
									<!-- board.getBoardTitle() -->
								</h5>
								<span>
									<!-- board.getBoardContent() -->
								</span>
							</div>
						</div>
						<div class="board-like__content">
							<div class="board-like__content-photo">
								사진
							</div>
							<div class="board-like__content-text">
								<h5>
									<!-- board.getBoardTitle() -->
								</h5>
								<span>
									<!-- board.getBoardContent() -->
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://kit.fontawesome.com/0fe4d45686.js"
		crossorigin="anonymous"></script>
</section>
<%@ include file="/views/common/footer.jsp"%>