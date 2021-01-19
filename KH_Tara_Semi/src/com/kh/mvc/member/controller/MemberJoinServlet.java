package com.kh.mvc.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;


@WebServlet(name="join", urlPatterns = "/member/join")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberJoinServlet() {
      
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/member/join.jsp");
		
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		String msg = "";
		String location = "";
				
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("mobile1") + request.getParameter("mobile2") + request.getParameter("mobile3");
		String email = request.getParameter("email1") + request.getParameter("email2");
		String address = request.getParameter("address");
		String travel = String.join(",", request.getParameterValues("travel"));
		
		member.setUserId(userId);
		member.setUserPwd(userPwd);
		member.setUserName(userName);
		member.setPhone(phone);
		member.setEmail(email);
		member.setAddress(address);
		member.setTravel(travel); 
		
		System.out.println(member);
		
		// 전달받은 데이터를 DB에 저장
		int result = new MemberService().joinMember(member);
		
		if(result > 0) {
			msg = "회원가입 성공";
			location= "/"; // 메인화면으로 돌아가는것
		} else {
			msg ="회원가입 실패";
			 location= "/member/join";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", location);
		
		// 정보 유지하며 페이지 이동한다. 
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/common/msg.jsp");
		
		dispatcher.forward(request, response);	
		
	}

}
