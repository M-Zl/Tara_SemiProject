package com.kh.mvc.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.board.model.vo.Like;
import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet("/board/like")
public class BoardLikeCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public BoardLikeCountServlet() {
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = ((HttpServletRequest) request).getSession(false);
		Member loginMember = (Member) (session.getAttribute("loginMember"));
		int userNo = loginMember.getUserNo();
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		Like like = new BoardService().LikeCheck(boardNo, userNo);
		if(like==null) {
			new BoardService().insertLike(boardNo,userNo);
		}else {
			new BoardService().setLike(like);
		}
		request.getRequestDispatcher("/board/detail?boardNo" + boardNo).forward(request, response);

	}
		
}
	


