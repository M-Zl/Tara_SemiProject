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
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
      
      // 업로드 관련
      if(!ServletFileUpload.isMultipartContent(request)) {
			// enctype이 multipart/from-data가 아닌 경우 메시지 전송 
			request.setAttribute("msg", "관리자에게 문의하세요.");			
			request.setAttribute("location", "/board/listColumns");	
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			
			return;			
      }
      
      String path = getServletContext().getRealPath("/ckedit_down");
      
      int maxSize = 1024 * 1024 * 10;
      
      MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());

      String fileName = mr.getFilesystemName("upfile_img");
      String upfileName = mr.getOriginalFileName("upfile_img");
      
      // 글 업로드
      String locName = mr.getParameter("LocalboardCode");
      String boardName = mr.getParameter("boardCode");
      String boardTitle = mr.getParameter("titleName");
      String boardContent = mr.getParameter("ck_content");
      String transport = mr.getParameter("choice");
      String travelMoney = mr.getParameter("moneyRange");
      int boardScore = Integer.parseInt(mr.getParameter("starGrade"));
      String msg = null;
     
      
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
            board.setBoardOriginalFileName(fileName);
            board.setBoardRenamedFileName(upfileName);
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