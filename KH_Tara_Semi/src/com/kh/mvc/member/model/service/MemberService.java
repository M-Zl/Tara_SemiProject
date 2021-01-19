package com.kh.mvc.member.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.board.model.dao.BoardDAO;
import com.kh.mvc.common.jdbc.JDBCTemplate;
import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.member.model.dao.MemberDAO;
import com.kh.mvc.member.model.vo.Member;

public class MemberService {
	private MemberDAO dao = new MemberDAO();

	public Member login(String useId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member member = dao.findMemberByIdAndPwd(conn, useId, userPwd);
		
		JDBCTemplate.close(conn);
		
		return member;
	}
	public List<Member> getMemberList(PageInfo info) {
		Connection conn = getConnection();
		
		List<Member> list = new MemberDAO().findAll(conn, info);
		
		close(conn);		
		
		return list;
	}
	public int getMemberCount() {
		Connection conn = getConnection();
		
		int result = new MemberDAO().getMemberCount(conn);
		
		close(conn);
		
		return result;			
	}

}
