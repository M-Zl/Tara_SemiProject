<%@page import="com.kh.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveId = null;
	Member loginMember = (Member)session.getAttribute("loginMember");
	Cookie[] cookies = request.getCookies();
	
	// 쿠키값 받아오기
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId = c.getValue();
				
				break;
			}
		}
	}

%>
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
	<% if(loginMember == null){ %>
		<form >
			<ul>
				<li><a href="<%= request.getContextPath()%>">Home</a></li>
				<li><a href="<%= request.getContextPath()%>/login">Login</a></li>
				<li><a href="#">Join Us</a></li>
				<li><input id="search_input" type="text" placeholder="Search"></li>
			</ul>
		</form>
	<% } else{ %>
		<form >
			<ul>
				<li><a href="<%= request.getContextPath()%>">Home</a></li>
				<li><a href="<%= request.getContextPath()%>/logout">Logout</a></li>
				<li><a href="#">MyPage</a></li>
				<li><input id="search_input" type="text" placeholder="Search"></li>
			</ul>
		</form>
	<% } %>	
	</div>
	<div class= "main_logo">
		<a href="<%= request.getContextPath()%>"><img src="<%= request.getContextPath()%>/images/logo/logo3.png"/></a>
	</div>
	<div class="main_visit">
		<span>총 방문자 수 : <%=session.getAttribute("totalCount") %>명</span> &nbsp;
		<span>오늘 방문자 수 : <%=session.getAttribute("todayCount") %>명  </span>
	</div>
</header>