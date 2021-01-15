<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String btnfirst = null;
String btnsecond = null;
String btnThird = null;
String vacuum = "";
String menu[] = {"메인", "숙박", "맛집","포토존" };
String local = request.getParameter("local"); 
String title  = request.getParameter("menu"); 
	if(title == null){btnfirst = menu[1];btnsecond =menu[2];btnThird=  menu[3];
	}else if(title.equals(menu[1])){btnfirst = menu[0]; btnsecond =menu[2]; btnThird=  menu[3];		
	}else if(title.equals(menu[2])){btnfirst = menu[0];btnsecond =menu[1]; btnThird=  menu[3];	
	}else{btnfirst = menu[0];btnsecond =menu[1];btnThird=  menu[2];			
	}

 %>
   
    
<%@ include file="/views/common/header.jsp" %>

    <section id="content">
        <div id="board_container">
           
               <h1 id="title_local"><%=local%></h1> 
             <% if(title != null){ %>  
             <h1 id="title_menu"><%=title%></h1>
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
            <button id="sort">=</button>
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
            <hr>

           <table id="board_table">
                <tr >
                    <td>
                       <a href=""> <div class="board_list_div">
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
                            <img src="<%=request.getContextPath() %>/logo/조회수1.png" class="board_list_count_img" ><span>1111</span>
                           </div>
                            <span class="board_list_div_span">안목 해변 후기입니다. 다들 잘</span>
                        </div></a>
                   </td>            
               </tr >
            </table>
     
        <br>
        <hr>
        <br>
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
            
            <button type="button" id="btn-add"
            onclick="">글쓰기</button>
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
   location.href="<%=request.getContextPath()%>/views/board/boardListColumns.jsp?local=<%=local%>&menu=<%=btnfirst%>";           
  <%  } %>	
   }
   function menuLocationsecond(){   
   location.href="<%=request.getContextPath()%>/views/board/boardListColumns.jsp?local=<%=local%>&menu=<%=btnsecond%>";    
   }
   function menuLocationThird(){   
   location.href="<%=request.getContextPath()%>/views/board/boardListColumns.jsp?local=<%=local%>&menu=<%=btnThird%>";    
   }

</script>

<%@ include file="/views/common/footer.jsp" %>

 