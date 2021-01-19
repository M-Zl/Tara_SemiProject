package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.service.MemberService;


@WebServlet(name="changePwd", urlPatterns ="/changePwd")
public class MemberChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberChangePwdServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/changePwd.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String msg = "";
		String loc = null;
		
		int result = new MemberService().changePwd(userId, userPwd);
		
		if(result > 0) {
			msg = "비밀번호가 정상적으로 변경되었습니다.";
			loc = "/";
		} else {
			msg = "비밀번호 변경에 실패했습니다.";
			loc = "/views/member/changePwd.jsp";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
