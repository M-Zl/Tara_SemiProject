package com.kh.mvc.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.BoardComment;
import com.kh.mvc.member.model.vo.Member;


@WebServlet("/board/comment")
public class BoardCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardCommentServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		String loc = "";
		HttpSession session = request.getSession(false);
		Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		if (loginMember != null) {			
			if(loginMember.getUserId().equals(writer)) {
				BoardComment reply = new BoardComment();			
				
				reply.setCommentBoardNO(boardNo);
				reply.setCommentWriterNo(loginMember.getUserNo());
				reply.setCommentContent(content);
				
				int result = new BoardService().saveBoardReply(reply);
				
				if(result > 0) {
					msg = "댓글 등록 성공";			
					loc = "/board/detail";
				} else {
					msg = "댓글 등록 실패";	
					loc = "/board/detail";
				}
			} else {
				msg = "잘못된 접근입니다.";
				loc = "/board/detail";
			}
		} else {
			msg = "로그인 진행 후 작성해주세요. ";
			loc ="/login";
		}
			
		request.setAttribute("msg", msg);
		request.setAttribute("location", loc);		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);		
	}
}