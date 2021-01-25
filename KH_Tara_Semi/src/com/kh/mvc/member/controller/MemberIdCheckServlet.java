package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;


@WebServlet("/member/idCheck")
public class MemberIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MemberIdCheckServlet() {
        super();
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		Member memberStatus = new MemberService().findMemberById(userId);
		
	
		
		boolean valid = new MemberService().validate(userId);
		
		request.setAttribute("valid", valid); 
		request.setAttribute("status", memberStatus);
		
		request.getRequestDispatcher("/views/member/idCheck.jsp").forward(request, response);
	}

}
