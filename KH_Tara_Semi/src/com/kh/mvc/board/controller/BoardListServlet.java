package com.kh.mvc.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;


@WebServlet("/board/listColumns")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
   
	public BoardListServlet() {
    
      
   
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String locName = request.getParameter("local");
		String boardName = request.getParameter("menu");
		String boardUserId = request.getParameter("boardUserId");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		      
			if(boardName == null) {
				
				List<Board> list = new BoardService().getBoardSerch(locName, boardUserId, boardTitle, boardContent); 
		    		request.setAttribute("list", list);
		    		request.setAttribute("local", locName);
		    		request.getRequestDispatcher("/views/board/listColumns.jsp").forward(request, response); 
		    	
			}else {
				List<Board> list = new BoardService().getBoardList(locName, boardName, boardUserId, boardTitle, boardContent);   
		    		request.setAttribute("list", list);
		    		request.setAttribute("local", locName);
		    		request.setAttribute("menu", boardName);
		    		request.getRequestDispatcher("/views/board/listColumns.jsp").forward(request, response); 
			}
	}
	
}
