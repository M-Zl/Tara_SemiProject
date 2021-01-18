package com.kh.mvc.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet("/findId")
public class MemberFindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberFindIdServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Member member = null;
		
		member = new MemberService().findId(name,email);
		
		if (member != null) {
			
			HttpSession session = request.getSession();

			session.setAttribute("FindMember", member);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/views/member/resultFindId.jsp");
			dispatcher.forward(request, response);			

		} else {
			request.setAttribute("msg", "입력하신 이름과 이메일이 존재하지 않습니다. ㅠㅠ");
			request.setAttribute("location", "/views/member/findId.jsp");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/views/common/msg.jsp");
			dispatcher.forward(request, response);

		}
	}

}
