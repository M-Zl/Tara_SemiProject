package com.kh.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet("/member/delete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = ((HttpServletRequest)request).getSession(false);
		Member loginMember = (Member)(session.getAttribute("loginMember"));
		String userId = request.getParameter("userId");	
		String msg = "";
		String loc = "";
		int result = 0;
		
		
		System.out.println("1 " +userId);
		System.out.println("2 " +loginMember.getUserId());
		
		if(loginMember.getUserRole()==2 ||userId.equals(loginMember.getUserId())) {
			result = new MemberService().deleteMember(userId);
			msg = "정상적으로 탈퇴되었습니다.";
			if(loginMember.getUserRole()==2)
			{
				loc="/admin/members";
			} else {
				loc = "/logout";
			}
		}else {
			msg = "잘못된 경로로 접근하였습니다.";
			loc = "/";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("location", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}