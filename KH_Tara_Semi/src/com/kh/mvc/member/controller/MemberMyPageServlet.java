package com.kh.mvc.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.member.model.vo.Member;

@WebServlet("/member/mypage")
public class MemberMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberMyPageServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = ((HttpServletRequest) request).getSession(false);
		Member loginMember = (Member) (session.getAttribute("loginMember"));
		int userNo = loginMember.getUserNo();
		List<Board> createdList = null;
		List<Board> likeList = null;
		
		createdList = new BoardService().getCreatedBoard(userNo);
		likeList = new BoardService().getLikeBoard(userNo);


		request.setAttribute("createdList", createdList);
		request.setAttribute("likeList", likeList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/member/mypage.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
