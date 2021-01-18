package com.kh.mvc.board.model.vo;

import java.sql.Date;

public class BoardComment {

	private int commentNo;
	
	private int commentBoardNO;
	
	private int commentWriterNo;
	
	private String userId;
	
	private String commentContent;	
	
	private Date commentCreateDate;
	
	private Date commentModifyDate;
	
	private String status;

	public BoardComment() {

	}
	public BoardComment(int commentNo, int commentBoardNO, int commentWriterNo, String userId, String commentContent,
			Date commentCreateDate, Date commentModifyDate, String status) {
		super();
		this.commentNo = commentNo;
		this.commentBoardNO = commentBoardNO;
		this.commentWriterNo = commentWriterNo;
		this.userId = userId;
		this.commentContent = commentContent;
		this.commentCreateDate = commentCreateDate;
		this.commentModifyDate = commentModifyDate;
		this.status = status;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getCommentBoardNO() {
		return commentBoardNO;
	}

	public void setCommentBoardNO(int commentBoardNO) {
		this.commentBoardNO = commentBoardNO;
	}

	public int getCommentWriterNo() {
		return commentWriterNo;
	}

	public void setCommentWriterNo(int commentWriterNo) {
		this.commentWriterNo = commentWriterNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentCreateDate() {
		return commentCreateDate;
	}

	public void setCommentCreateDate(Date commentCreateDate) {
		this.commentCreateDate = commentCreateDate;
	}

	public Date getCommentModifyDate() {
		return commentModifyDate;
	}

	public void setCommentModifyDate(Date commentModifyDate) {
		this.commentModifyDate = commentModifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "BoardComment [commentNo=" + commentNo + ", commentBoardNO=" + commentBoardNO + ", commentWriterNo="
				+ commentWriterNo + ", userId=" + userId + ", commentContent=" + commentContent + ", commentCreateDate="
				+ commentCreateDate + ", commentModifyDate=" + commentModifyDate + ", status=" + status + "]";
	}
	
	
	
}
