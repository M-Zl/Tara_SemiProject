<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/KH_Tara_Semi/css/style.css" type="text/css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Yusei+Magic&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@700&display=swap" rel="stylesheet">
</head>
<body>
<header>
	<div class="main_option">
		<form >
			<ul>
				<li><a href="<%= request.getContextPath()%>">Home</a></li>
				<li><a href="#">Login</a></li>
				<li><a href="#">Join Us</a></li>
				<li><input id="search_input" type="text" placeholder="Search"></li>
			</ul>
		</form>
	</div>
	<div class= "main_logo">
		<img src="<%= request.getContextPath()%>/logo/logo3.png"/>
	</div>
	
</header>
<section>
	<div class="map_info">
		<img src="<%= request.getContextPath()%>/logo/map3.png"/>
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
<footer>
	<p>COPYRIGHTⓒ 2020 KHeducenter_Tara. ALL RIGHTS RESERVED</p>
</footer>
</body>
</html>