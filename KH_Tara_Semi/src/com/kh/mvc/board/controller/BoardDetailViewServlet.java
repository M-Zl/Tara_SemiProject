package com.kh.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.board.model.vo.BoardReply;

@WebServlet("/board/detail")
public class BoardDetailView extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardDetailView() {
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = 61;
		Board board = null;
		List<BoardReply> replies = null;
		
		// 새로고침시 조회수가 증가하는 것을 방지하는 로직 
//		Cookie[] cookies = request.getCookies();
//		String boardHistory = ""; 
		boolean hasRead = false;
//		
//		if(cookies != null) {
//			String name = null;
//			String value = null;
//			
//			for(Cookie cookie : cookies) {
//				name = cookie.getName();
//				value = cookie.getValue();
//				
//				if("boardHistory".equals(name)) {
//					boardHistory = value;
//					if(value.contains("|" + boardNo + "|")) {
//						//읽은 게시글
//						hasRead = true;
//						 
//						break;
//					}
//				}
//			}
//		}
//		
//		// 2. 읽지않은 게시글이면 cookie에 기록
//		if(!hasRead) {
//			Cookie cookie = new Cookie("boardHistory", boardHistory + "|" + boardNo + "|");
//			
//			cookie.setMaxAge(-1);//브라우저 종료시 삭제
//			response.addCookie(cookie);
//		}
//		
		board = new BoardService().getBoard(boardNo, hasRead);
		replies = new BoardService().getReplyList(boardNo);
		
		System.out.println(board);
		
		request.setAttribute("board", board);				
		request.setAttribute("replies", replies);				
		request.getRequestDispatcher("/views/board/localBoardDetail.jsp").forward(request, response);
	}

}
