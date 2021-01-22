<%@page import="com.kh.mvc.board.model.vo.Board"%>
<%@page import="com.kh.mvc.common.util.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>

<%
	List<Board> list = (ArrayList) request.getAttribute("list");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
%>

<%
	int count = 0;
	String btnfirst = null;
	String btnsecond = null;
	String btnThird = null;
	String boardUserId = request.getParameter("boardUserId"); 
	String boardTitle = request.getParameter("boardTitle"); 
	String boardContent = request.getParameter("boardContent");
	String recommend = request.getParameter("recommend");
	String title[] = {"메인", "숙박", "맛집","포토존" };
	String local = request.getParameter("local"); 
	String menu  = request.getParameter("menu"); 
		if(menu == null){
        	btnfirst = title[1]; btnsecond = title[2]; btnThird= title[3];
		}else if(menu.equals(title[1])){
	 	    btnfirst = title[0]; btnsecond = title[2]; btnThird= title[3];		
		}else if(menu.equals(title[2])){
			btnfirst = title[0]; btnsecond = title[1]; btnThird= title[3];	
		}else{
			btnfirst = title[0]; btnsecond = title[1]; btnThird= title[2];			
	}
%>



	<section id="content">
		<div id="board_container">
			<h1 id="title_local"><%=local%></h1> 
             <% if(menu != null){ %>  
            <h1 id="title_menu"><%=menu%></h1>
             <%}else{ %>
            <h1 id="title_menu">지역 게시판</h1>
             <%} %>
            <br>
			<div >
				<button class="list_btn" onclick="menuLocationfirst();"> <%=btnfirst%></button>
				<button class="list_btn" onclick="menuLocationsecond();"><%=btnsecond%></button>
				<button class="list_btn" onclick="menuLocationThird();"><%=btnThird%></button>   
           </div> 
           <br>
			<div id="serchdiv">
				<div id="Sortdiv">
            		<button id="sort" onclick="listre();"><i class="fab fa-microsoft"></i></i></button>
            		<select  id="inquirySort" onclick="recommend();">
                	    <option value="">-----</option>
               			<option value="최신순">최신순</option>
                		<option value="추천순">추천순</option>
                		
            		</select>
            	</div>
            	<div id="Menudiv">	
                     <select id="serchMenu">
                    	<option value="전체">전체</option>
                    	<option value="숙박">숙박</option>
                   		<option value="맛집">맛집</option>
                   		<option value="포토존">포토존</option>
             		 </select>
          
            		 <select id="serchList">
                    	<option value="작성자">작성자</option>
                    	<option value="제목">제목</option>
                   		<option value="내용">내용</option>
             		 </select> 
             		 <input type="text" id="searchtext" placeholder="내용을 입력하세요">
            	 	 <button  onclick="serch();">검색</button>           
			   </div>
			</div>	   
		<br>
		<hr>
		    <div id="board_div">
			 <%if(list.isEmpty()) { %>	
			 <div class="board_div_list"><p id="board_div_list_p">조회된 게시글이 없습니다.</p></div> 
             <%} else { 	                                   
			  		for(Board board : list) {  %>       
					<div class="board_div_list">
						<div id="board_div_count">
               				<div class="board_div_img_count"> <img src="<%=request.getContextPath() %>/logo/heart.jpg"  class="board_img_count"><p class="board_img_count_p"><%=board.getlCount() %></p></div>
               				<div class="board_div_img_count"> <img src="<%=request.getContextPath() %>/logo/댓글1.png" class="board_img_count"><p class="board_img_count_p"><%=board.getcCount() %></p></div>
               				<div class="board_div_img_count"> <img src="<%=request.getContextPath() %>/logo/조회수1.png"  class="board_img_count"><p class="board_img_count_p"><%= board.getBoardReadCount() %></p></div>
            			</div>
					    <div id="board_div_menu"> <span id="board_div_menu_span"><%=board.getBoardName()%>게시판</span> <p id="board_div_menu_p"><%=board.getRowNum()%>  </p> </div>
              		 	<a href="<%=request.getContextPath()%>/board/detail?boardNo=<%=board.getBoardNo() %>"> 
              	 			<div id="board_div_text">
                				<span id="board_div_text_title"><%= board.getBoardTitle() %> </span> <br><br>
               					<span id="board_div_text_content"><%= board.getBoardContent()%>  </span>
              					<br>
              					<br>
              					<span id="board_div_text_id"><%= board.getUserId()%> </span> <span id="board_div_text_says">says</span>
              				</div>
               				<div id="board_div_img"><img src="../images/logo/logo3.png" class="board_list_img"></div>  
            			</a>
             	</div> 
                     <%} }%>   
           </div>      
        <hr>
        <br>
        <div id="pageBar">
			
			<!-- 맨 처음으로 -->
			<%if(menu == null ){ %> 
				    <%if(boardUserId != null) {%>    
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=1'">&lt;&lt;</button>
					<%}else if(boardTitle != null) { %>	
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=1'">&lt;&lt;</button>
					<%}else if(boardContent != null){ %>
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardContent=<%=boardContent%>&recommend=<%=recommend%>&page=1'">&lt;&lt;</button>
					<%}else{ %>   
						  <button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&recommend=<%=recommend%>&page=1'">&lt;&lt;</button>
					<%} %>
			<%}else if(boardUserId != null) {%>    
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=1'">&lt;&lt;</button>
			<%}else if(boardTitle != null) { %>	
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=1'">&lt;&lt;</button>
			<%}else{ %>
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardContent=<%=boardContent%>&recommend=<%=recommend%>&page=1'">&lt;&lt;</button>
			<%} %>	
					
			<!-- 이전 페이지로 -->
			<%if(menu == null ){ %> 
				    <%if(boardUserId != null) {%>    
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= pageInfo.getPrvePage() %>'">&lt;</button>
					<%}else if(boardTitle != null) { %>	
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= pageInfo.getPrvePage() %>'">&lt;</button>
					<%}else if(boardContent != null){ %>
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardContent=<%=boardContent%>&recommend=<%=recommend%>&page=<%= pageInfo.getPrvePage() %>'">&lt;</button>
					<%}else{ %>   
						  <button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&recommend=<%=recommend%>&page=<%= pageInfo.getPrvePage() %>'">&lt;</button>
					<%} %>
            <%}else if(boardUserId != null) {%>    
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= pageInfo.getPrvePage() %>'">&lt;</button>
			<%}else if(boardTitle != null) { %>	
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= pageInfo.getPrvePage() %>'">&lt;</button>
			<%}else{ %>
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardContent=<%=boardContent%>&recommend=<%=recommend%>&page=<%= pageInfo.getPrvePage() %>'">&lt;</button>
			<%} %>			
			
			 
			<!--  10개 페이지 목록 -->
			<% for(int p = pageInfo.getStartPage(); p <= pageInfo.getEndPage(); p++){ %>
				<% if(p == pageInfo.getCurrentPage()){ %>
					<button disabled><%= p %></button>
				<% } else { %>
				    <%if(menu == null ){ %> 
				    	<%if(boardUserId != null) {%>    
							<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= p %>'"><%= p %></button>
						<%}else if(boardTitle != null) { %>	
							<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= p %>'"><%= p %></button>	
						<%}else if(boardContent != null){ %>
							<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardContent=<%=boardContent%>&recommend=<%=recommend%>&page=<%= p %>'"><%= p %></button>
						<%}else{ %>   
						    <button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&recommend=<%=recommend%>&page=<%= p %>'"><%= p %></button>
						<%} %>
					<%}else if(boardUserId != null) {%>    
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= p %>'"><%= p %></button>
					<%}else if(boardTitle != null) { %>	
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= p %>'"><%= p %></button>	
					<%}else if(boardContent != null){ %>
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardContent=<%=boardContent%>&recommend=<%=recommend%>&page=<%= p %>'"><%= p %></button>
					<%}else{ %>	
					    <button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&recommend=<%=recommend%>&page=<%= p %>'"><%= p %></button>
					<%} %>		
				<% } %>
			<% } %>
			
			
			<!-- 다음 페이지로 -->
            <%if(menu == null ){ %> 
				    	<%if(boardUserId != null) {%>    
							<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= pageInfo.getNextPage() %>'">&gt;</button>
						<%}else if(boardTitle != null) { %>	
							<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= pageInfo.getNextPage() %>'">&gt;</button>
						<%}else if(boardContent != null){ %>
							<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardContent=<%=boardContent%>&recommend=<%=recommend%>&page=<%= pageInfo.getNextPage() %>'">&gt;</button>
						<%}else{ %>   
						    <button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&recommend=<%=recommend%>&page=<%= pageInfo.getNextPage() %>'">&gt;</button>
						<%} %> 
			<%}else if(boardUserId != null) {%>    
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= pageInfo.getNextPage() %>'">&gt;</button>
			<%}else if(boardTitle != null) { %>	
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= pageInfo.getNextPage() %>'">&gt;</button>
			<%}else{ %>
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardContent=<%=boardContent%>&recommend=<%=recommend%>&page=<%= pageInfo.getNextPage() %>'">&gt;</button>
			<%} %>			 
			<!-- 맨 끝으로 -->
			 <%if(menu == null ){ %> 
				    <%if(boardUserId != null) {%>    
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
					<%}else if(boardTitle != null) { %>	
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
					<%}else if(boardContent != null){ %>
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&boardContent=<%=boardContent%>&recommend=<%=recommend%>&page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
					<%}else{ %>   
						    <button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&recommend=<%=recommend%>&page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
					<%} %> 
            <%}else if(boardUserId != null) {%>    
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
			<%}else if(boardTitle != null) { %>	
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&recommend=<%=recommend%>&page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
			<%}else{ %>
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listRows?local=<%=local%>&menu=<%=menu%>&boardContent=<%=boardContent%>&recommend=<%=recommend%>&page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
			<%} %>			
            <%if(loginMember != null) {%>
			<button type="button" id="btn-add"
			onclick="location.href ='<%=request.getContextPath() %>/board/upload'">글쓰기</button>
	     	<%}%>
        </div>
        
        <br>
        <br>
        </div>
    </section>
<script>
   function menuLocationfirst(){
 	 <% if(btnfirst.equals("메인")){ %>
   			location.href="<%=request.getContextPath()%>/index.jsp";    
	 <%}else {%>
   			location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=<%=btnfirst%>";           
  	 <%}%>	
   }
   function menuLocationsecond(){   
  	 location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=<%=btnsecond%>";    
   }
   function menuLocationThird(){   
  	 location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=<%=btnThird%>";    
   }
   function listre() {
		<%if(menu == null){%>
  			<%if(boardUserId != null) {%>    
				location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&boardTitle=<%=boardTitle%>';
			<%}else if(boardTitle != null) { %>	
   				location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&boardTitle=<%=boardTitle%>';	
			<%}else if(boardContent != null){ %>
				location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&boardContent=<%=boardContent%>';
			<%}else{ %>   
 				location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>';
			<%} %>
  		<%}else if(boardUserId != null) {%>    
				location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>';
  		<%}else if(boardTitle != null) { %>	
				location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>';	
  		<%}else if(boardContent != null){ %>
				location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardContent=<%=boardContent%>';
		<%}else{ %>	
 	 			location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>';
 	 <%}%>
   }
 
   function serch() {
		var titlemenu = document.getElementById("title_menu").value;
		var valueMenu = document.getElementById("serchMenu").value;
		var valueList = document.getElementById("serchList").value;
		var page = document.getElementById("btnPage").value;
		var serchValue = document.getElementById("searchtext").value;
	
		if(titlemenu === null || valueMenu === '전체'){
			if(valueMenu === '전체'){
				if(valueList === '작성자'){
					location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&boardUserId="+ serchValue + "&page=" + page ;
				}else if(valueList === '제목'){
					location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&boardTitle="+ serchValue + "&page=" + page ;
				}else{
					location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&boardContent="+ serchValue + "&page=" + page ;	
				}
			}else{
				if(valueList === '작성자'){
					location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=" + valueMenu + "&boardUserId="+ serchValue + "&page=" + page ;
				}else if(valueList === '제목'){
					location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=" + valueMenu + "&boardTitle="+ serchValue + "&page=" + page ;	
				}else{
					location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=" + valueMenu + "&boardContent="+ serchValue + "&page=" + page ;
				}	
			}	
		}else{
			if(valueList === '작성자'){
				location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=" + valueMenu + "&boardUserId="+ serchValue + "&page=" + page ;
			}else if(valueList === '제목'){
				location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=" + valueMenu + "&boardTitle="+ serchValue + "&page=" + page ;	
			}else{
				location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=" + valueMenu + "&boardContent="+ serchValue + "&page=" + page ;       
			}			
		}	    
	}

   function recommend() {
  		var recm = document.getElementById("inquirySort").value;
  		var titlemenu = document.getElementById("title_menu").value;
		var page = document.getElementById("btnPage").value;
	    if(recm === '추천순'){
	    	<%if( menu == null ){ %>
				 location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&page=" + page + "&recommend=추천수";	
	
		   <%}else{%>
		     	location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=<%=menu%>&page=" + page + "&recommend=추천수";
		
		   <%}%>
  		}else if(recm === '최신순'){
  			<%if( menu == null ){ %>
				location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&page=" + page;	
	
		   <%}else{%>
		   	  	location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=<%=menu%>&page=" + page;
		
		   <%}%>
  			
  		}else{
  			
  		} 
  }
</script>

<%@ include file="/views/common/footer.jsp" %>

 
 