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
	   String locName = request.getParameter("local");
	   String boardName = request.getParameter("menu");
	   
	   request.setAttribute("local", locName);
	   request.setAttribute("menu", boardName);
	   
      request.getRequestDispatcher("/views/board/UploadCKEditor.jsp").forward(request, response);
      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("UTF-8");
      
      String locName = request.getParameter("LocalboardCode");
      String boardName = request.getParameter("boardCode");
      String boardTitle = request.getParameter("titleName");
      String boardContent = request.getParameter("ck_content");
      String transport = request.getParameter("choice");
      String travelMoney = request.getParameter("moneyRange");
      int boardScore = 4;
      //      float boardScore = Float.parseFloat(request.getParameter("starGrade"));
      String msg = null;
      
      System.out.println(locName + ", " + boardName + ", " + boardTitle + ", " + boardContent + ", " + transport + ", " + travelMoney + ", " + boardScore);
      
      HttpSession session = request.getSession(false);
      Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
      
      System.out.println(loginMember);
      
      
      if (loginMember != null) {         
            Board board = new Board();
            
            board.setBoardWriteNo(loginMember.getUserNo());
            board.setLocName(locName);
            board.setBoardName(boardName);
            board.setBoardTitle(boardTitle);
            board.setBoardContent(boardContent);
            board.setTransport(transport);
            board.setTravelMoney(travelMoney);
            board.setBoardScore(boardScore);
            int result = new BoardService().cke_saveBoard(board);
            
            if(result > 0) {
               msg = "게시글 등록 성공";         
               
            } else {
               msg = "게시글 등록 실패";         
            }
         
      } else {
         msg = "로그인 진행 후 작성해주세요. ";
      }
      

      request.setAttribute("msg", msg);
      request.setAttribute("location", "/board/listColumns?local=" +locName +"&menu=" + boardName);      
      request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
   }
}