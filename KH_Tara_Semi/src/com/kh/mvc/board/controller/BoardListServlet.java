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
		      List<Board> listvalue = new ArrayList<>();
		      String localvalue = request.getParameter("local");
		      String menuvalue = request.getParameter("menu");
		
	          
		      List<Board> list = new BoardService().getBoardList(); 
		      
		      
		      for(Board board : list) {
			   if(board.getLocName().equals(localvalue)&& board.getBoardName().equals(menuvalue) ){ 
				   listvalue.add(board);   
			   }
         }
		     
		      
		      request.setAttribute("list", listvalue);
		      		
		      request.getRequestDispatcher("/views/board/listColumns.jsp").forward(request, response); 
	}

}
