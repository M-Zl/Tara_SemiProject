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
		 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindRegular.woff') format('woff');
		 font-weight: normal;
		 font-style: normal;
	 }
	 @font-face {
		 font-family: 'TmoneyRoundWindExtraBold';
		 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
		 font-weight: normal;
		 font-style: normal;
	 }
	 
	 h1{
	 	font-family: 'TmoneyRoundWindExtraBold';
	 	color:gray;
	 }
	 
	 #locName{
	 	margin-left:10px;
	 	padding:5px;
	 	width:1000px;
	 	height:30px
	 	border: 1px solid gray;
	 }
	 
	 #board__writer{
	 	padding:5px;
	 	width:1005px;
	 	border: none;
	 	background: lightgrey;
	 }
	 
	 #title{
	    margin-left:5px;
	 	padding:5px;
	 	width:1000px;
	 }
	 
    .board__detail{
	     width: auto;
	     min-height: 600px;
	     border: 2px solid gray;
	     border-radius: 20px;
	     padding: 30px;
	     font-family: 'TmoneyRoundWindRegular';
    }
    .board__profile{
	     margin: 5px;
	     height: 25px;
    }
    .board__title{
	     margin: 5px;
    }
    .board__contents{
	     margin: 5px;
	     border: 2px solid lightgray;
	     border-radius: 5px;
	     min-height: 400px;
    }
  
    .board__button{
		 margin: 5px;
    	 text-align:center;
    	 padding:7px 7px ;
    	 
    }
    #modify{
    	width:80px;
    	height:30px;
    	border: none;
    	font-size:15px;
	    background: royalblue;
	    color: white;
    }
    #cancel{
  		width:80px;
    	height:30px;
    	border: none;
    	font-size:15px;
	    background: lightslategray;
	    color: white;
    }
   
  </style>
  
<section>
<h1>게시판 수정</h1>
<hr>
<form action='<%=request.getContextPath() %>/board/update' method="post">
<input type="hidden" name="boardNo" value ="<%= board.getBoardNo() %>">
    <div class="board__detail">
      <div class="board__locName">
      	<input type="text" name="locName" id="locName" value="<%= board.getLocName() %>">
      </div>
      <div class="board__profile">
        <img id="board__profile_img" src="" alt="">
        <input type="text" id="board__writer" name="writer" value="<%= board.getUserId() %>" readonly>
      </div>
      <div class="board__title">
        <input type="text" name="title" id="title" value="<%= board.getBoardTitle() %>">
      </div>
      <div class="board__contents">
        <img src="" alt="">게시판 사진 업로드 해야함 <br><br>
        <div id= "여행 tip">
          <label>교통수단 : <input type="text" name="transport" value="<%= board.getTransport() %>"></label><br>
          <label>여행경비 : <input type="text" name="travelMoney" value="<%= board.getTravelMoney() %>"></label><br>
          <label>교통수단 : <input type="text" name="boardScore" value="<%= board.getBoardScore() %>"></label><br><br>
        </div>
        <div id="content">
          <textarea name="content" cols="140" rows="15"><%= board.getBoardContent() %></textarea>
        </div>
      </div>
      <hr>
      <div class="board__button">
        <button id="modify" type="submit">수정</button>
        <button id="cancel" type="button" onclick="history.back()">취소</button>
      </div>
      </div>
 </form>   
</section>