package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;


@WebServlet("/board/update")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardUpdateServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		Board board = new BoardService().getBoard(boardNo, true);
		
		//여기도 로그인 로직
		
		request.setAttribute("board", board);				
		request.getRequestDispatcher("/views/board/boardUpdate.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		String msg = "";
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String locName=request.getParameter("locName");
		String writer=request.getParameter("writer");
		String title = request.getParameter("title");
		String transport = request.getParameter("transport");
		String travelMoney = request.getParameter("travelMoney");
		int boardScore = Integer.parseInt(request.getParameter("boardScore"));
		String content = request.getParameter("content");
		Board board = new Board();
		
		board.setBoardNo(boardNo);
		board.setLocName(locName);
		board.setUserId(writer);
		board.setBoardTitle(title);
		board.setTransport(transport);
		board.setTravelMoney(travelMoney);
		board.setBoardScore(boardScore);
		board.setBoardContent(content);
		
		result = new BoardService().saveBoard(board);
		
		if(result > 0) {
			msg = "성공적으로 수정되었습니다.";
		} else {
			msg = "게시판 수정에 실패하였습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", "/board/detail?boardNo=" + boardNo);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

}
