<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<section>
	<div class="map_info">
		<img src="<%= request.getContextPath()%>/images/logo/map3.png"/>
		<div id="map_board">
			<ul id="Gyeonggi">
				<li><a href="#">경기도</a>
					<ol>
						<li><a href="#">숙박</a></li>
						<li><a href="#">맛집</a></li>
						<li><a href="#">포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="seoul">
				<li><a href="#">서울</a>
					<ol>
						<li><a href="#">숙박</a></li>
						<li><a href="#">맛집</a></li>
						<li><a href="#">포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Gangwon">
				<li><a href="#">강원도</a>
					<ol>
						<li><a href="#">숙박</a></li>
						<li><a href="#">맛집</a></li>
						<li><a href="#">포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Chungcheongnam">
				<li><a href="#">충청남도</a>
					<ol>
						<li><a href="#">숙박</a></li>
						<li><a href="#">맛집</a></li>
						<li><a href="#">포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Chungcheongbuk">
				<li><a href="#">충청북도</a>
					<ol>
						<li><a href="#">숙박</a></li>
						<li><a href="#">맛집</a></li>
						<li><a href="#">포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Gyeongsangbuk">
				<li><a href="#">경상북도</a>
					<ol>
						<li><a href="#">숙박</a></li>
						<li><a href="#">맛집</a></li>
						<li><a href="#">포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Gyeongsangnam">
				<li><a href="#">경상남도</a>
					<ol>
						<li><a href="#">숙박</a></li>
						<li><a href="#">맛집</a></li>
						<li><a href="#">포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Jeollabuk">
				<li><a href="#">전라북도</a>
					<ol>
						<li><a href="#">숙박</a></li>
						<li><a href="#">맛집</a></li>
						<li><a href="#">포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Jeollanam">
				<li><a href="#">전라남도</a>
					<ol>
						<li><a href="#">숙박</a></li>
						<li><a href="#">맛집</a></li>
						<li><a href="#">포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="jeju">
				<li><a href="#">제주도</a>
					<ol>
						<li><a href="#">숙박</a></li>
						<li><a href="#">맛집</a></li>
						<li><a href="#">포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Dokdo">
				<li><a href="#">독도</a>
					<ol>
						<li><a href="#">숙박</a></li>
						<li><a href="#">맛집</a></li>
						<li><a href="#">포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Ulleungdo">
				<li><a href="#">울릉도</a>
					<ol>
						<li><a href="#">숙박</a></li>
						<li><a href="#">맛집</a></li>
						<li><a href="#">포토존</a></li>
					</ol>
				</li>
			</ul>
		</div>
	</div>
</section>

<%@ include file="/views/common/footer.jsp" %>