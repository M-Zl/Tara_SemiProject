<%@page import="com.kh.mvc.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>

<%
 List<Board> list = (ArrayList) request.getAttribute("list");

%>

<%
	String btnfirst = null;
	String btnsecond = null;
	String btnThird = null;
	String vacuum = "";
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
			<div class="board_div">
			 <%if(list.isEmpty()) { %>	
			 	<p>조회된 게시글이 없습니다.</p>
             <%} else { 	                                   
			  		for(Board board : list) {  %>       
						<div id="board_div_count">
               				<div class="board_div_img_count"> <img src="<%=request.getContextPath() %>/logo/heart.jpg"  class="board_img_count"><p>9999</p></div>
               				<div class="board_div_img_count"> <img src="<%=request.getContextPath() %>/logo/댓글1.png" class="board_img_count"><p>99999</p></div>
               				<div class="board_div_img_count"> <img src="<%=request.getContextPath() %>/logo/조회수1.png"  class="board_img_count"><p><%= board.getBoardReadCount() %></p></div>
            			</div>
              		 	<a href=""> 
              	 			<div id="board_div_text">
                				<span id="board_div_text_title"><%= board.getBoardTitle() %> </span> <br><br>
               					<span id="board_div_text_content"><%= board.getBoardContent()%>  </span>
              					<br>
              					<br>
              					<span ><%= board.getUserId()%> </span> 
              				</div>
               				<div id="board_div_img"><img src="../image/해변.jpg" class="board_list_img"></div>  
            				 </a>
                     <%} }%>     
             </div> 
        <hr>
        <br>
        <div id="pageBar">
           
            <button >&lt;&lt;</button>
            <button>&lt;</button>
            <button disabled>1</button>
            <button >2</button>
            <button >3</button>
            <button>4</button>
            <button>5</button>
            <button>6</button>
            <button>7</button>
            <button>8</button>
            <button>9</button>
            <button>10</button>
            <!-- 다음 페이지로 -->
            <button >&gt;</button>
            <!-- 맨 끝으로 -->
            <button>&gt;&gt;</button>
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
	 location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&menu=<%=menu%>&";
   }
 
   function serch() {
	var titlemenu = document.getElementById("title_menu").value;
	var valueMenu = document.getElementById("serchMenu").value;
	var valueList = document.getElementById("serchList").value;
	var serchValue = document.getElementById("searchtext").value;
	
		if(titlemenu === null || valueMenu === '전체'){
			if(valueMenu === '전체'){
				if(valueList === '작성자'){
					location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&boardUserId="+ serchValue;
				}else if(valueList === '제목'){
					location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&boardTitle="+ serchValue;	
				}else{
					location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&boardContent="+ serchValue;	
				}
			}else{
				if(valueList === '작성자'){
					location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=" + valueMenu + "&boardUserId="+ serchValue;
				}else if(valueList === '제목'){
					location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=" + valueMenu + "&boardTitle="+ serchValue;	
				}else{
					location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=" + valueMenu + "&boardContent="+ serchValue;	
				}	
			}	
		}else{
			if(valueList === '작성자'){
				location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=" + valueMenu + "&boardUserId="+ serchValue;
			}else if(valueList === '제목'){
				location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=" + valueMenu + "&boardTitle="+ serchValue;	
			}else{
				location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=" + valueMenu + "&boardContent="+ serchValue;        
			}			
		}	    
	}
             
</script>

<%@ include file="/views/common/footer.jsp" %>

 