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
import com.kh.mvc.common.util.PageInfo;


@WebServlet("/board/listColumns")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
   
	public BoardListServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		int listCount = 0;

		PageInfo info = null;
		List<Board> list = null;
		List<Board> imglist = null;
		String locName = request.getParameter("local");
		String boardName = request.getParameter("menu");
		String boardUserId = request.getParameter("boardUserId");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String recommend = request.getParameter("recommend");
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(NumberFormatException e) {
			page = 1;
		}		   


		
        if(recommend != null) {
        		if(boardName == null ) {
        			listCount = new BoardService().getBoardCount();
        			info = new PageInfo(page, 10, listCount, 8);    
        			list = new BoardService().getfindLikelocal(locName, boardUserId, boardTitle, boardContent, info); 
			    		request.setAttribute("list", list);
			    		request.setAttribute("local", locName);
			    		request.setAttribute("pageInfo", info);
			    		request.setAttribute("boardUserId", boardUserId);
			    		request.setAttribute("boardTitle", boardTitle);
			    		request.setAttribute("boardContent", boardContent);
			    		request.getRequestDispatcher("/views/board/listColumns.jsp").forward(request, response);  
			    		

        		}else {
        			listCount = new BoardService().getBoardCount();
        			info = new PageInfo(page, 10, listCount, 8);  
        			list = new BoardService().getfindLikeMenu(locName, boardName, boardUserId, boardTitle, boardContent, info );   
					    	    
						request.setAttribute("list", list);
						request.setAttribute("local", locName);
						request.setAttribute("menu", boardName);
						request.setAttribute("pageInfo", info);
						request.setAttribute("boardUserId", boardUserId);
						request.setAttribute("boardTitle", boardTitle);
						request.setAttribute("boardContent", boardContent);    		    	
						request.getRequestDispatcher("/views/board/listColumns.jsp").forward(request, response); 
					
        		}
        }else {        	
        	if(boardName == null ) {
					listCount = new BoardService().getBoardCount();
					info = new PageInfo(page, 10, listCount, 8);    
					list = new BoardService().getBoardSerch(locName, boardUserId, boardTitle, boardContent, info); 
					
			    		request.setAttribute("list", list);
			    		request.setAttribute("local", locName);
			    		request.setAttribute("pageInfo", info);
			    		request.setAttribute("boardUserId", boardUserId);
			    		request.setAttribute("boardTitle", boardTitle);
			    		request.setAttribute("boardContent", boardContent);
			    		request.getRequestDispatcher("/views/board/listColumns.jsp").forward(request, response);    
			    		
                      
                          
   
			    		
        	}else {	
					listCount = new BoardService().getBoardCount();
					info = new PageInfo(page, 10, listCount, 8);  
					list = new BoardService().getBoardList(locName, boardName, boardUserId, boardTitle, boardContent, info );   
					    	    
						request.setAttribute("list", list);
						request.setAttribute("local", locName);
						request.setAttribute("menu", boardName);
						request.setAttribute("pageInfo", info);
						request.setAttribute("boardUserId", boardUserId);
						request.setAttribute("boardTitle", boardTitle);
						request.setAttribute("boardContent", boardContent);    		    	
						request.getRequestDispatcher("/views/board/listColumns.jsp").forward(request, response); 
				        
        	}	 			

        }
	
	}
}