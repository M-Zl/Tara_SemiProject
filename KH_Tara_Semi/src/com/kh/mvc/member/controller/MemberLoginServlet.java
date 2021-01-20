package com.kh.mvc.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet(name="login", urlPatterns ="/login")

public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberLoginServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/member/login.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String saveId = request.getParameter("saveId");
		Member member = null;

		System.out.println("userID : " + userId + ", userPwd : " + userPwd + ", saveId : " + saveId);

		member = new MemberService().login(userId, userPwd);

		// 아이디 저장로직 구현
		if (saveId != null) {
			Cookie cookie = new Cookie("saveId", userId);

			cookie.setMaxAge(60 * 60 * 24 * 3);
			response.addCookie(cookie);

		} else {
			Cookie cookie = new Cookie("saveId", "");

			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}

		if (member != null) {
			HttpSession session = request.getSession();

			session.setAttribute("loginMember", member);

			response.sendRedirect(request.getContextPath() + "/");
			
		} else {
			request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다.");

			request.setAttribute("location", "/login");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/views/common/msg.jsp");
			dispatcher.forward(request, response);

		}
	}
}
