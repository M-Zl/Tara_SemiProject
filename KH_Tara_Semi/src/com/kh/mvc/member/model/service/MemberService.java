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

		Connection conn = getConnection();
		
		Member member = dao.findMemberByIdAndPwd(conn, useId, userPwd);
		
		close(conn);
		
		return member;
	}

	public Member findId(String name, String email) {
		
		Connection conn = getConnection();
		
		Member member = dao.findId(conn, name, email);
		
		close(conn);
		
		return member;
	}

	public Member findPwd(String id, String name, String email) {
		
		Connection conn = getConnection();
		
		Member member = dao.findPwd(conn, id, name, email);
		
		close(conn);
		
		return member;
	}

	public int changePwd(String id, String pwd) {
		Connection conn = getConnection();
		int result = dao.changePwd(conn, id, pwd);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int joinMember(Member member) {
		Connection conn = getConnection();
		
		int result = dao.insertMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public boolean validate(String userId) {
		Connection conn = getConnection();
		
		Member member = dao.findMemberById(conn, userId);
		
		close(conn);
		
		
		return member != null;
	}

	public Member findMemberById(String userId) {		
		Connection conn = getConnection();
		
		Member member = dao.findMemberById(conn, userId);
		
		close(conn);
		
		
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

	public List<Member> getMemberList(String field, String value, PageInfo info) {
		Connection conn = getConnection();
		
		List<Member> list = new MemberDAO().findMembers(field, value, conn, info);
		
		close(conn);		
		
		return list;
	}

	public int getMemberSearchCount(String field, String value) {
		Connection conn = getConnection();

		int result = new MemberDAO().getMemberSearchCount(field,value,conn);

		close(conn);

		return result;			
	}
	
	public int deleteMember(String id) {
		Connection conn = getConnection();
		int result = dao.updateMemberStatus(conn, id, "N");

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}
	public int saveImg(Member member) {
		int result = 0;
		Connection conn = getConnection();

		result = new MemberDAO().updateImg(conn, member);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

	close(conn);
	
	return result;
	}

}
