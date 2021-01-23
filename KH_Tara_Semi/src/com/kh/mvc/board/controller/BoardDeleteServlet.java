package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;

@WebServlet("/board/delete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		// 이 부분에 로그인한 사람이랑 작성자랑 일치하는지 확인하는 코드 필요 
		
		int result = new BoardService().deleteBoard(boardNo);
		
		if(result > 0) {
			msg = "정상적으로 삭제 되었습니다.";
		} else {
			msg = "삭제에 실패하였습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", "/");
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}
}