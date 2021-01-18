package com.kh.mvc.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.common.util.PageInfo;

@WebServlet("/admin/members")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		int listCount = 0;
		PageInfo info = null;
		List<Board> list = null;
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(NumberFormatException e) {
			page = 1;
		}		
		
		listCount = new BoardService().getBoardCount();
		info = new PageInfo(page, 10, listCount, 5);		
		list = new BoardService().getBoardList(info);
		
		request.setAttribute("list", list);
		request.setAttribute("pageInfo", info);
		request.getRequestDispatcher("/views/admin/adminpage.jsp").forward(request, response);
	}

}