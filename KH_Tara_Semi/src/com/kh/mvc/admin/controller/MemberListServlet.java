package com.kh.mvc.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet("/admin/members")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		int listCount = 0;
		PageInfo info = null;
		List<Member> list = null;
		// 검색구현
		String field= request.getParameter("f");
		String value= request.getParameter("q");
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(NumberFormatException e) {
			page = 1;
		}		
		if(field!=null) {
			listCount = new MemberService().getMemberSearchCount(field,value);
			info = new PageInfo(page, 10, listCount, 10);
			list = new MemberService().getMemberList(field,value,info);	
			request.setAttribute("f", field);
			request.setAttribute("q", value);
		}else {
			listCount = new MemberService().getMemberCount();
			info = new PageInfo(page, 10, listCount, 10);
			list = new MemberService().getMemberList(info);
				
		}
		
		request.setAttribute("list", list);
		request.setAttribute("pageInfo", info);
		request.getRequestDispatcher("/views/admin/adminpage.jsp").forward(request, response);
	}

}