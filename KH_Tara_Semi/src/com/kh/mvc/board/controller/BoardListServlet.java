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
//		      String localvalue = request.getParameter("local");
//		      String menuvalue = request.getParameter("menu");		
//		      String locName = request.getParameter("locName");
//		      String boardName = request.getParameter("boardName");

		      String locName = request.getParameter("local");
		      String boardName = request.getParameter("menu");
		      String boardUserId = request.getParameter("boardUserId");
		      String boardTitle = request.getParameter("boardTitle");
		      String boardContent = request.getParameter("boardContent");
		      
		      
	
		      List<Board> list = new BoardService().getBoardList(locName, boardName, boardUserId, boardTitle, boardContent); 
		      
		      
//		      for(Board board : list) {
//		    	  if(board.getLocName().equals(localvalue)&& board.getBoardName().equals(menuvalue) ){ 
//		    		  listvalue.add(board);   
//		    	  }
//		      }
		     
		      
		      request.setAttribute("list", list);
		      request.setAttribute("local", locName);
		      request.setAttribute("menu", boardName);
		      request.getRequestDispatcher("/views/board/listColumns.jsp").forward(request, response); 
	}

}
