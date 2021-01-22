<%@page import="com.kh.mvc.common.util.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
   List<Member> list = (ArrayList) request.getAttribute("list");
   PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
   String f =request.getAttribute("f")==null ? "" : (String)request.getAttribute("f");
   String q =request.getAttribute("q")==null ? "" : (String)request.getAttribute("q");
%>
<section>
   <link rel="stylesheet" property="stylesheet"
      href="/KH_Tara_Semi/css/adminpage.css">
   <div class="main">
      <div class="admin-header">
         <h1 align="center" class="admin-header__title">회원 관리</h1>
      </div>
      <div class="admin-main">
         <div class="user-table">
            <table>
               <thead>
                  <tr>
                     <th>회원번호</th>
                     <th>아이디</th>
                     <th>이름</th>
                     <th>이메일</th>
                     <th>가입일</th>
                     <th>회원여부</th>
                     <th>회원탈퇴</th>
                  </tr>
               </thead>
               <tbody>
                  <% if(list.isEmpty()) {%>
                  <tr>
                     <td colspan="8">
                        조회된 회원이 없습니다.
                     </td>
                  </tr>
                  <%} else {
                     for(Member member : list){%>
                  <tr class="row">
                     <td><%=member.getUserNo() %></td>
                     <td><%=member.getUserId() %></td>
                     <td><%=member.getUserName() %></td>
                     <td><%=member.getEmail() %></td>
                     <td><%=member.getCreateDate() %></td>
                     <td><%=member.getStatus() %></td>
                     <td>
                     	<a href="<%=request.getContextPath()%>/member/delete?userId=<%= member.getUserId() %>">
                     <i class="fas fa-user-slash lg"></i></a></td>
                     
                  </tr>
                  <%} 
                     }%>
               </tbody>
            </table>
         </div>
         
         <!-- 페이징 -->
         
         
         <div class="pagecount">
               <!-- 맨 처음으로 -->
            <button onclick="location.href='<%=request.getContextPath()%>/admin/members?page=1&f=<%=f%>&q=<%=q%>'">&lt;&lt;</button>
               <!-- 이전 페이지로 -->
            <button onclick="location.href='<%=request.getContextPath()%>/admin/members?page=<%=pageInfo.getPrvePage()%>&f=<%=f%>&q=<%=q%>'">&lt;</button>
               <!--  10개 페이지 목록 -->
            <%
            for (int p = pageInfo.getStartPage(); p <= pageInfo.getEndPage(); p++) {
            %>
            <%
            if (p == pageInfo.getCurrentPage()) {
            %>
            <button disabled><%=p%></button>
            <%} else {%>
            <button onclick="location.href='<%=request.getContextPath()%>/admin/members?page=<%=p%>&f=<%=f%>&q=<%=q%>'"><%=p%></button>
               <%}%>
            <%}%>
               <!-- 다음 페이지로 -->
            <button
               onclick="location.href='<%=request.getContextPath()%>/admin/members?page=<%=pageInfo.getNextPage()%>&f=<%=f%>&q=<%=q%>'">&gt;</button>

            <!-- 맨 끝으로 -->
            <button onclick="location.href='<%= request.getContextPath() %>/admin/members?page=<%= pageInfo.getMaxPage()%>&f=<%=f%>&q=<%=q%>'">&gt;&gt;</button>
         </div>
         
      <div align="center"><a href="<%=request.getContextPath()%>/admin/members">목록으로</a></div>
         <div class="user-table__search">
            <div class="user__search">
               <form action="<%=request.getContextPath()%>/admin/members" method="get">
                     <input type="hidden" name="page" value="1">
                  <select name="f">
                     <option value="userNo" selected>회원번호</option>
                     <option value="userId">회원ID</option>
                     <option value="userName">이름</option>
                  </select> 
                     <input type="text" name="q"/> <input type="submit" value="검색" />
               </form>
            </div>
         </div>
      </div>
   </div>
   <script src="https://kit.fontawesome.com/0fe4d45686.js"
      crossorigin="anonymous"></script>
</section>
<%@ include file="/views/common/footer.jsp"%>