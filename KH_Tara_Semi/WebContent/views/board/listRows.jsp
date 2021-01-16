<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String btnfirst = null;
String btnsecond = null;
String btnThird = null;
String vacuum = "";
String title[] = {"메인", "숙박", "맛집","포토존" };
String local = request.getParameter("local"); 
String menu  = request.getParameter("menu"); 
	if(menu == null){btnfirst = title[1];btnsecond =title[2];btnThird=  title[3];
	}else if(menu.equals(title[1])){btnfirst = title[0]; btnsecond =title[2]; btnThird=  title[3];		
	}else if(menu.equals(title[2])){btnfirst = title[0];btnsecond =title[1]; btnThird=  title[3];	
	}else{btnfirst = title[0];btnsecond =title[1];btnThird=  title[2];			
	}

 %>
   
    
<%@ include file="/views/common/header.jsp" %>

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
               <button class="list_btn" onclick="menuLocationfirst();"><%=btnfirst%></button>
               <button class="list_btn" onclick="menuLocationsecond();"><%=btnsecond%></button>
               <button class="list_btn" onclick="menuLocationThird();"><%=btnThird%></button>   
           </div> 
           <br>
           <div>
            <button id="sort" onclick="listre();">ㅁ</button>
            <select name="" id="inquiry1">
                <option value="">최신순</option>
                <option value="">추천순</option>
                <option selected>정렬</option>
            </select>

            <form action="" method="POST" id="search">
             <select name=""  id="inquiry2">
                    <option value="">작성자</option>
                    <option value="">내용</option>
                    <option selected>정렬</option>
             </select> 
             <input type="text" id="searchtext" placeholder="내용을 입력하세요">
             <button type="submit">검색</button>
            </form>
           </div>
            <br>
            <br>
            <hr>
            
       
           <div class="board_div">  
              <div id="board_div_count">
               <div class="board_div_img_count"> <img src="<%=request.getContextPath() %>/logo/heart.jpg"  class="board_img_count"><p>9999</p></div>
               <div class="board_div_img_count"> <img src="<%=request.getContextPath() %>/logo/댓글1.png" class="board_img_count"><p>99999</p></div>
               <div class="board_div_img_count"> <img src="<%=request.getContextPath() %>/logo/조회수1.png"  class="board_img_count"><p>1</p></div>
             </div>
               <a href=""> <div id="board_div_text">
                <span id="board_div_text_title">  </span> <span id="board_div_text_title">강릉 안목 해변 </span> <br><br>
                
               <span id="board_div_text_content">  강릉에 갔다가, 안목해변에 갔는데 스타벅스 2층 창문에서 내려다보니까 사람들이 자꾸 닭강정 박스를 들고 왔다 갔다 하길래 보니아이아우쵸우여으어ㅏ으아드 어아양,ㅡ야으,양ㄴ;ㅣ렁ㄴㅁㄹ[ㅇ'ㅡㅁ게랴[ㅓ먀ㅔ르ㅑㅐㅇㅁ느랴ㅐ으냐ㅔ릉ㄴ먀ㅔ르엔ㅁ러야ㅔㄴㅁ러ㅑㅔㄴㅇㅁ러ㅑ엔ㅁ러야네머</span>
               <br>
               <br>
               <span >대북곤 </span> 
                </div>
                <div id="board_div_img"><img src="../image/해변.jpg" class="board_list_img"></div>  
             </a>

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
  <%  } %>	
   }
   function menuLocationsecond(){   
   location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=<%=btnsecond%>";    
   }
   function menuLocationThird(){   
   location.href="<%=request.getContextPath()%>/board/listRows?local=<%=local%>&menu=<%=btnThird%>";    
   }
   function listre() {
	    location.href="<%=request.getContextPath()%>/board/listColumns?local=<%=local%>&menu=<%=menu%>"; 
   }
   
</script>


<%@ include file="/views/common/footer.jsp" %>