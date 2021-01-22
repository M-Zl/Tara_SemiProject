package com.kh.mvc.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;

@WebServlet("/board/like")
public class BoardLikeCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public BoardLikeCountServlet() {
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int result = 0;
		
		result = new BoardService().LikeCheck(boardNo,userNo);

		if(result <= 0) {
			new BoardService().updateLikeCount(boardNo, userNo);
		} else if(result > 0) {
			new BoardService().deleteLikeCount(boardNo, userNo);
		}
		
		request.getRequestDispatcher("/board/detail?boardNo" + boardNo).forward(request, response);

	}
		
}
	


