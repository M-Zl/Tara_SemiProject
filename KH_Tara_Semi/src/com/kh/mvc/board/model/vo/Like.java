package com.kh.mvc.board.model.vo;

public class Like {
	private int boardNo;
	private int userNo;
	private String status;
	
	
	public Like() {
	}
	public Like(int boardNo, int userNo, String status) {
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.status = status;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Like [boardNo=" + boardNo + ", userNo=" + userNo + ", status=" + status + "]";
	}
	
}
