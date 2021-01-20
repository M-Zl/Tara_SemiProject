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
            		<button id="sort" onclick="listre();">=</button>
            		<select name="" id="inquirySort">
               			<option value="">최신순</option>
                		<option value="">추천순</option>

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

			<table id="board_table">                
				<tr >  
                <%if(list.isEmpty()) { %>		
				<tr > 
					<td >
						조회된 게시글이 없습니다.
				   </td>
			    </tr>	
				<%} else { 	                                   
						for(Board board : list) {  %> 
							<% if (count < 4){ %>                                                         	               
								<td>
									<a href=""> 
										<div class="board_list_div">
										
										    <div class="board_list_div_img">
												<a href="<%=request.getContextPath() %>/board/detail"><img src="../" class="board_list_image"></a>
                          					</div>  
                          					         
                          					<div class="board_list_count">
												<img src="<%=request.getContextPath() %>/logo/heart.jpg" class="board_list_count_img"> <span>1111111</span>
                         					</div>
                         					 
                          					<div class="board_list_count">
												<img src="<%=request.getContextPath() %>/logo/댓글1.png" class="board_list_count_img"><span>1111</span>
                         					</div>
                         					
                         					<div class="board_list_count" id="board_list_count3">
												<img src="<%=request.getContextPath() %>/logo/조회수1.png" class="board_list_count_img" ><span><%= board.getBoardReadCount() %></span>
											</div>
											
                            				<span class="board_list_div_span"><%= board.getBoardTitle() %></span>
                        				</div>
                        			</a>
								</td> 
				            <%}else if(count == 4 ){ %>
				</tr> 
				            <tr>   
                    	     	<td>
                      	 			<a href=""> 
                      		 			<div class="board_list_div">
                      		 			
                       	   			 		<div class="board_list_div_img">
                           	   					 <img src="../" class="board_list_image">
                         					</div> 
                         					         
                           					<div class="board_list_count">
                             		 			 <img src="<%=request.getContextPath() %>/logo/heart.jpg" class="board_list_count_img"> <span>1111111</span>
                           					</div>
                           					
                          					<div class="board_list_count">
                            					 <img src="<%=request.getContextPath() %>/logo/댓글1.png" class="board_list_count_img"><span>1111</span>
                          					</div>
                          					
                          					<div class="board_list_count" id="board_list_count3">
                            					 <img src="<%=request.getContextPath() %>/logo/조회수1.png" class="board_list_count_img" ><span><%= board.getBoardReadCount() %></span>
                           					</div>
                           					
                           	    			<span class="board_list_div_span"><%= board.getBoardTitle() %></span>
                          				</div>
                        			</a>
                      			</td>    
                              <%}else{  %> 	
                    	
                    	     	<td>
                      	 			<a href=""> 
                      		 			<div class="board_list_div">
                      		 			
                       	   			 		<div class="board_list_div_img">
                           	   					 <img src="../" class="board_list_image">
                         					</div> 
                         					         
                           					<div class="board_list_count">
                             		 			 <img src="<%=request.getContextPath() %>/logo/heart.jpg" class="board_list_count_img"> <span>1111111</span>
                           					</div>
                           					
                          					<div class="board_list_count">
                            					 <img src="<%=request.getContextPath() %>/logo/댓글1.png" class="board_list_count_img"><span>1111</span>
                          					</div>
                          					
                          					<div class="board_list_count" id="board_list_count3">
                            					 <img src="<%=request.getContextPath() %>/logo/조회수1.png" class="board_list_count_img" ><span><%= board.getBoardReadCount() %></span>
                           					</div>
                           					
                           	    			<span class="board_list_div_span"><%= board.getBoardTitle() %></span>
                          				</div>
                        			</a>
                      			</td> 
				               <% } %>
					<% count++;}%> 
				<% } %>
                  </tr>                  
 		</table>
        <hr>
        <br>
        <br>
        <div id="pageBar">
			
			<!-- 맨 처음으로 -->
			<%if(boardUserId != null) {%>    
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&page=1'">&lt;&lt;</button>
			<%}else if(boardTitle != null) { %>	
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&page=1'">&lt;&lt;</button>
			<%}else{ %>
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardContent=<%=boardContent%>&page=1'">&lt;&lt;</button>
			<%} %>	
					
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&page=<%= pageInfo.getPrvePage() %>'">&lt;</button>
            <%if(boardUserId != null) {%>    
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&page=<%= pageInfo.getPrvePage() %>'">&lt;</button>
			<%}else if(boardTitle != null) { %>	
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&page=<%= pageInfo.getPrvePage() %>'">&lt;</button>
			<%}else{ %>
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardContent=<%=boardContent%>&page=<%= pageInfo.getPrvePage() %>'">&lt;</button>
			<%} %>			
			
			 
			<!--  10개 페이지 목록 -->
			<% for(int p = pageInfo.getStartPage(); p <= pageInfo.getEndPage(); p++){ %>
				<% if(p == pageInfo.getCurrentPage()){ %>
					<button disabled><%= p %></button>
				<% } else { %>
				    <%if(menu == null ){ %> 
				    	<%if(boardUserId != null) {%>    
							<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&boardTitle=<%=boardTitle%>&page=<%= p %>'"><%= p %></button>
						<%}else if(boardTitle != null) { %>	
							<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&boardTitle=<%=boardTitle%>&page=<%= p %>'"><%= p %></button>	
						<%}else if(boardContent != null){ %>
							<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&boardContent=<%=boardContent%>&page=<%= p %>'"><%= p %></button>
						<%}else{ %>   
						    <button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&page=<%= p %>'"><%= p %></button>
						<%} %>
					<%}else if(boardUserId != null) {%>    
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&page=<%= p %>'"><%= p %></button>
					<%}else if(boardTitle != null) { %>	
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&page=<%= p %>'"><%= p %></button>	
					<%}else if(boardContent != null){ %>
						<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardContent=<%=boardContent%>&page=<%= p %>'"><%= p %></button>
					<%}else{ %>	
					    <button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&page=<%= p %>'"><%= p %></button>
					<%} %>		
				<% } %>
			<% } %>
			
			
			<!-- 다음 페이지로 -->

			<%if(boardUserId != null) {%>    
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&page=<%= pageInfo.getNextPage() %>'">&gt;</button>
			<%}else if(boardTitle != null) { %>	
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&page=<%= pageInfo.getNextPage() %>'">&gt;</button>
			<%}else{ %>
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardContent=<%=boardContent%>&page=<%= pageInfo.getNextPage() %>'">&gt;</button>
			<%} %>			 
			<!-- 맨 끝으로 -->
            <%if(boardUserId != null) {%>    
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
			<%}else if(boardTitle != null) { %>	
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardTitle=<%=boardTitle%>&page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
			<%}else{ %>
				<button id="btnPage" onclick="location.href='<%= request.getContextPath() %>/board/listColumns?local=<%=local%>&menu=<%=menu%>&boardContent=<%=boardContent%>&page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
			<%} %>			
            <%if(loginMember != null) {%>
			<button type="button" id="btn-add"
			onclick="location.href ='<%=request.getContextPath() %>/board/write'">글쓰기</button>
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
   			location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&menu=<%=btnfirst%>";           
  	 <%}%>	
   }
   function menuLocationsecond(){   
  	 location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&menu=<%=btnsecond%>";    
   }
   function menuLocationThird(){   
  	 location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&menu=<%=btnThird%>";    
   }
   function listre() {
	   location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=<%=menu%>";
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
					location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&boardUserId="+ serchValue + "&page=" + page ;
				}else if(valueList === '제목'){
					location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&boardTitle="+ serchValue + "&page=" + page;	
				}else{
					location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&boardContent="+ serchValue + "&page=" + page;	
				}
			}else{
				if(valueList === '작성자'){
					location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&menu=" + valueMenu + "&boardUserId="+ serchValue + "&page=" + page;
				}else if(valueList === '제목'){
					location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&menu=" + valueMenu + "&boardTitle="+ serchValue + "&page=" + page;	
				}else{
					location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&menu=" + valueMenu + "&boardContent="+ serchValue + "&page=" + page;	
				}	
			}	
		}else{
			if(valueList === '작성자'){
				location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&menu=" + valueMenu + "&boardUserId="+ serchValue + "&page=" + page;
			}else if(valueList === '제목'){
				location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&menu=" + valueMenu + "&boardTitle="+ serchValue + "&page=" + page;	
			}else{
				location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&menu=" + valueMenu + "&boardContent="+ serchValue + "&page=" + page;	
			}			
		}	    
	}
    
</script>

<%@ include file="/views/common/footer.jsp" %>

 