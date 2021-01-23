package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.JsonObject;
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
		String path = getServletContext().getRealPath("/ckedit_down");
		int maxSize = 1024 * 1024 * 10;
		String img = null;
		String encoding = "UTF-8";
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
		
     
     
      
      String locName = mr.getParameter("LocalboardCode");
      String boardName = mr.getParameter("boardCode");
      String boardTitle = mr.getParameter("titleName");
      String boardContent = mr.getParameter("ck_content");
      String transport = mr.getParameter("choice");
      String travelMoney = mr.getParameter("moneyRange");
      
      String fileName = mr.getFilesystemName("upload");
	  String upfileName = mr.getOriginalFileName("upload");		
				
		response.setContentType("application/json; charset=utf-8");
		
		JsonObject jsonObject = new JsonObject();
		
		String url = request.getContextPath() + "/ckedit_down/" + upfileName;
		
		jsonObject.addProperty("uploaded", 1);
		jsonObject.addProperty("fileName", fileName);
		jsonObject.addProperty("url", url);		
		response.getWriter().print(jsonObject);	
      
      
//      int boardScore = Integer.parseInt(request.getParameter("star_grade"));
      int boardScore = 1;
      String msg = null;
      
      System.out.println("boardScore : " + boardScore);
     
      
      HttpSession session = request.getSession(false);
      Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
     
      
      
      if (loginMember != null) {         
            Board board = new Board();
            
            board.setBoardWriteNo(loginMember.getUserNo());
            board.setLocName(locName);
            board.setBoardName(boardName);
            board.setBoardTitle(boardTitle);
            board.setBoardContent(boardContent);
            board.setBoardOriginalFileName(fileName);
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