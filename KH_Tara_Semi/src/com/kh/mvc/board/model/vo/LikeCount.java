package com.kh.mvc.board.model.vo;

public class LikeCount {
	private int boardNo;
	
	private int userNo;
	
	private String Status;

	public LikeCount() {
	}
	
	public LikeCount(int boardNo, int userNo, String status) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		Status = status;
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
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	@Override
	public String toString() {
		return "LikeCount [boardNo=" + boardNo + ", userNo=" + userNo + ", Status=" + Status + "]";
	}
	
}
