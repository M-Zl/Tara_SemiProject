<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>


<section>
	<div class="map_info">
		<img src="<%= request.getContextPath()%>/images/logo/map3.png"/>
		<div id="map_board">
			<ul id="Gyeonggi">
				<li><a href="<%=request.getContextPath()%>/board/listColumns?local=경기도">경기도</a>
					<ol>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=경기도&menu=숙박" >숙박</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=경기도&menu=맛집">맛집</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=경기도&menu=포토존" >포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="seoul">
				<li><a href="<%=request.getContextPath()%>/board/listColumns?local=서울">서울</a>
					<ol>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=서울&menu=숙박" >숙박</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=서울&menu=맛집">맛집</a></li>
						<li><a href="<%=request.getContextPath()%>//board/listColumns?local=서울&menu=포토존" >포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Gangwon">
				<li><a href="<%=request.getContextPath()%>/board/listColumns?local=강원도">강원도</a>
					<ol>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=강원도&menu=숙박" >숙박</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=강원도&menu=맛집">맛집</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=강원도&menu=포토존" >포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Chungcheongnam">
				<li><a href="<%=request.getContextPath()%>/board/listColumns?local=충청남도">충청남도</a>
					<ol>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=충청남도&menu=숙박" >숙박</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=충청남도&menu=맛집">맛집</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=충청남도&menu=포토존" >포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Chungcheongbuk">
				<li><a href="<%=request.getContextPath()%>/board/listColumns?local=충청북도">충청북도</a>
					<ol>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=충청북도&menu=숙박" >숙박</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=충청북도&menu=맛집">맛집</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=충청북도&menu=포토존" >포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Gyeongsangbuk">
				<li><a href="<%=request.getContextPath()%>/board/listColumns?local=경상북도">경상북도</a>
					<ol>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=경상북도&menu=숙박" >숙박</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=경상북도&menu=맛집">맛집</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=경상북도&menu=포토존" >포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Gyeongsangnam">
				<li><a href="<%=request.getContextPath()%>/board/listColumns?local=경상남도">경상남도</a>
					<ol>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=경상남도&menu=숙박" >숙박</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=경상남도&menu=맛집">맛집</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=경상남도&menu=포토존" >포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Jeollabuk">
				<li><a href="<%=request.getContextPath()%>/board/listColumns?local=전라북도">전라북도</a>
					<ol>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=전라북도&menu=숙박" >숙박</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=전라북도&menu=맛집">맛집</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=전라북도&menu=포토존" >포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Jeollanam">
				<li><a href="<%=request.getContextPath()%>/board/listColumns?local=전라남도">전라남도</a>
					<ol>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=전라남도&menu=숙박" >숙박</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=전라남도&menu=맛집">맛집</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=전라남도&menu=포토존" >포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="jeju">
				<li><a href="<%=request.getContextPath()%>/board/listColumns?local=제주도">제주도</a>
					<ol>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=제주도&menu=숙박" >숙박</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=제주도&menu=맛집">맛집</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=제주도&menu=포토존" >포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Dokdo">
				<li><a href="<%=request.getContextPath()%>/board/listColumns?local=독도">독도</a>
					<ol>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=독도&menu=숙박" >숙박</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=독도&menu=맛집">맛집</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=독도&menu=포토존" >포토존</a></li>
					</ol>
				</li>
			</ul>
			<ul id="Ulleungdo">
				<li><a href="<%=request.getContextPath()%>/board/listColumns?local=울릉도">울릉도</a>
					<ol>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=울릉도&menu=숙박" >숙박</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=울릉도&menu=맛집">맛집</a></li>
						<li><a href="<%=request.getContextPath()%>/board/listColumns?local=울릉도&menu=포토존" >포토존</a></li>
					</ol>
				</li>
			</ul>
		</div>
	</div>
</section>

<%@ include file="/views/common/footer.jsp" %>