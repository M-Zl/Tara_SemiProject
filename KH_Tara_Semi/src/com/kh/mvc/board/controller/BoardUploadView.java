package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/board/upload")
public class BoardUploadView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardUploadView() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/board/UploadCKEditor.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String locName = request.getParameter("localTitleSel");
		String boardName = request.getParameter("titleSel");
		String boardTitle = request.getParameter("titleName");
		String boardContent = request.getParameter("ck_content");
		String msg = null;
		
		HttpSession session = request.getSession(false);
		Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
		
		System.out.println(loginMember);
		
		if (loginMember != null) {			
			if(loginMember.getUserId().equals(boardName)) {
				Board board = new Board();
				
				board.setLocName(locName);
				board.setBoardName(boardName);
				board.setBoardTitle(boardTitle);
				board.setBoardContent(boardContent);
				
				int result = new BoardService().saveBoard(board);
				
				if(result > 0) {
					msg = "게시글 등록 성공";			
					
				} else {
					msg = "게시글 등록 실패";			
				}
			} else {
				msg = "잘못된 접근입니다.";
			}
		} else {
			msg = "로그인 진행 후 작성해주세요. ";
		}
		
		
	}

}
