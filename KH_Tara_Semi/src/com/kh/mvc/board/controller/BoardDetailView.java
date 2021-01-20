package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;

@WebServlet("/board/detail")
public class BoardDetailView extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardDetailView() {
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));

//		Board board = new BoardService().getBoard(boardNo);
		
//		request.setAttribute("board", board);
		request.getRequestDispatcher("/views/board/localBoardDetail.jsp").forward(request, response);
	}

}
