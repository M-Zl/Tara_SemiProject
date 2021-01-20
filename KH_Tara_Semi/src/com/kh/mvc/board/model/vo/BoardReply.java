package com.kh.mvc.board.model.vo;

import java.sql.Date;

public class BoardReply {
	private int commentNo;

	private int commentBoardNo;

	private int commentWriterNo;

	private String content;

	private Date CreateDate;

	private Date ModifyDate;

	private String status;

	public BoardReply() {
	}

	public BoardReply(int commentNo, int commentBoardNo, int commentWriterNo, String content, Date createDate,
			Date modifyDate, String status) {
		super();
		this.commentNo = commentNo;
		this.commentBoardNo = commentBoardNo;
		this.commentWriterNo = commentWriterNo;
		this.content = content;
		CreateDate = createDate;
		ModifyDate = modifyDate;
		this.status = status;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getCommentBoardNo() {
		return commentBoardNo;
	}

	public void setCommentBoardNo(int commentBoardNo) {
		this.commentBoardNo = commentBoardNo;
	}

	public int getCommentWriterNo() {
		return commentWriterNo;
	}

	public void setCommentWriterNo(int commentWriterNo) {
		this.commentWriterNo = commentWriterNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return CreateDate;
	}

	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}

	public Date getModifyDate() {
		return ModifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		ModifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "BoardReply [commentNo=" + commentNo + ", commentBoardNo=" + commentBoardNo + ", commentWriterNo="
				+ commentWriterNo + ", content=" + content + ", CreateDate=" + CreateDate + ", ModifyDate=" + ModifyDate
				+ ", status=" + status + "]";
	}

}
