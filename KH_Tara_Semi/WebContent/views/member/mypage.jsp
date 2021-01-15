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
					<div></div>
					<span><i class="fas fa-camera-retro fa-lg"></i></span>
				</div>
				<div class="profile__info">
					<h3>ID : xxxxxx</h3>
					<h3>Email : xxx@gmail.com</h3>
				</div>
			</div>
			<div>
				<div class="board-write">
					<div class="board-write__title">
						<h3 class="board-write__title">작성한 글목록</h3>
						<span><a href=""><i class="fas fa-bars fa-lg"></i></a></span>
					</div>
					<div class="board-write__list">
						<div>
							<div class="listbox-left">
								<div class="board-write__list-photo">
									<div></div>
								</div>
								<div class="board-write__list-content">
									<h4>제주도 숙박 Tip</h4>
									<h5>요기 진짜 너무너무 좋아요꼭오세요</h5>
								</div>
							</div>
							<div class="listbox-right">
								<span><a href=""><i class="fas fa-pen-fancy fa-lg"></i></a></span>
								<span><a href=""><i class="fas fa-trash-alt fa-lg"></i></a></span>
							</div>
						</div>
						<div>
							<div class="listbox-left">
								<div class="board-write__list-photo">
									<div></div>
								</div>
								<div class="board-write__list-content">
									<h4>제주도 숙박 Tip</h4>
									<h5>요기 진짜 너무너무 좋아요꼭오세요</h5>
								</div>
							</div>
							<div class="listbox-right">
								<span><a href=""><i class="fas fa-pen-fancy fa-lg"></i></a></span>
								<span><a href=""><i class="fas fa-trash-alt fa-lg"></i></a></span>
							</div>
						</div>
					</div>
				</div>


				<div class="board-like">
					<div class="board-like__title">
						<h3>내가 찜한 게시물</h3>
						<span><a href=""><i class="fas fa-bars fa-lg"></i></a></span>
					</div>
					<div class="board-like__list">
						<div class="board-like__content">
							<div class="board-like__content-photo"></div>
							<div class="board-like__content-text"></div>
						</div>
						<div class="board-like__content">
							<div class="board-like__content-photo">사진</div>
							<div class="board-like__content-text">
							<h5>dddd</h5>
							<span>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</span>
							</div>
						</div>
						<div class="board-like__content">
							<div class="board-like__content-photo"></div>
							<div class="board-like__content-text"></div>
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