package com.kh.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;


@WebServlet("/board/listRows")
public class BoardListServletRows extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
   
	public BoardListServletRows() {
    
      
   
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      String local = request.getParameter("local");
		      String menu  = request.getParameter("menu");
		      
		
		      request.getRequestDispatcher("/views/board/listRows.jsp").forward(request, response); 
	}

}
