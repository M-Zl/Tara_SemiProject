<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

  <section id="content">
        <div id="board_container">
            <p id="title_local">강원도</p> 
                <p id="title_menu">숙박</p>
                <br>
           <div >
               <button class="list_btn"><a href=""></a>메인</button>
               <button class="list_btn"><a href=""></a>맛집</button>
               <button class="list_btn"><a href=""></a>포토존</button>   
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
            
            <button type="button" id="btn-add"
            onclick="">글쓰기</button>
        </div>
        
        <br>
        <br>
        </div>
    </section>

<%@ include file="/views/common/footer.jsp" %>