package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.mvc.common.util.FileRename;
import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/member/profile")
public class MemberProfileImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberProfileImgServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = ((HttpServletRequest)request).getSession(false);
//		Member loginMember = (Member)(session.getAttribute("loginMember"));
//		String userId = request.getParameter("userId");	
		
		request.getRequestDispatcher("/views/member/profileImg.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "관리자에게 문의하세요.");			
			request.setAttribute("location", "/member/mypage");		
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			
			return;			
		}
		String msg = null;
		
		String path = getServletContext().getRealPath("/upload/profile");
		
		int maxSize = 1024 * 1024 * 10;
		
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
		
		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String content = mr.getParameter("content");		
		
		String fileName = mr.getFilesystemName("upfile");
		
		HttpSession session = request.getSession(false);
		Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
		
		System.out.println(loginMember);
		
		if (loginMember != null) {			
				Member member = new Member();
				
				member.setUserId(loginMember.getUserId());
				member.setUserimg(fileName);
				
				System.out.println(member);
				
				int result = new MemberService().saveImg(member);
				
				if(result > 0) {
					msg = "프로필 사진 등록 성공";		
					loginMember.setUserimg(fileName);
				} else {
					msg = "프로필 사진 등록 실패";			
				}
			} else {
				msg = "잘못된 접근입니다.";
			}
			
		request.setAttribute("msg", msg);
		request.setAttribute("location", "/member/mypage");		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}

}
