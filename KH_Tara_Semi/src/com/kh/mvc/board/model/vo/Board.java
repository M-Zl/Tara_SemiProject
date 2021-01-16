package com.kh.mvc.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo;
	
	private int boardWriteNo;
	
	private String userId;
	
	private String locName;
	
	private String boardName;
		
	private String boardTitle;
	
	private String boardContent;
	
	private int boardReadCount;
	
	private String boardOriginalFileName;
	
	private String boardRenamedFileName;
	
	private String transport;
	
	private String travelMoney;
	
	private int boardScore;
	
	private Date boardCreateDate;
	
	private Date boardModifyDate;
	
	private String status;
	
	public Board() {
	}

	public Board(int boardNo, int boardWriteNo, String userId, String locName, String boardName, String boardTitle,
			String boardContent, int boardReadCount, String boardOriginalFileName, String boardRenamedFileName,
			String transport, String travelMoney, int boardScore, Date boardCreateDate, Date boardModifyDate,
			String status) {
		super();
		this.boardNo = boardNo;
		this.boardWriteNo = boardWriteNo;
		this.userId = userId;
		this.locName = locName;
		this.boardName = boardName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardReadCount = boardReadCount;
		this.boardOriginalFileName = boardOriginalFileName;
		this.boardRenamedFileName = boardRenamedFileName;
		this.transport = transport;
		this.travelMoney = travelMoney;
		this.boardScore = boardScore;
		this.boardCreateDate = boardCreateDate;
		this.boardModifyDate = boardModifyDate;
		this.status = status;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardWriteNo() {
		return boardWriteNo;
	}

	public void setBoardWriteNo(int boardWriteNo) {
		this.boardWriteNo = boardWriteNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getLocName() {
		return locName;
	}

	public void setLocName(String locName) {
		this.locName = locName;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardReadCount() {
		return boardReadCount;
	}

	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}

	public String getBoardOriginalFileName() {
		return boardOriginalFileName;
	}

	public void setBoardOriginalFileName(String boardOriginalFileName) {
		this.boardOriginalFileName = boardOriginalFileName;
	}

	public String getBoardRenamedFileName() {
		return boardRenamedFileName;
	}

	public void setBoardRenamedFileName(String boardRenamedFileName) {
		this.boardRenamedFileName = boardRenamedFileName;
	}

	public String getTransport() {
		return transport;
	}

	public void setTransport(String transport) {
		this.transport = transport;
	}

	public String getTravelMoney() {
		return travelMoney;
	}

	public void setTravelMoney(String travelMoney) {
		this.travelMoney = travelMoney;
	}

	public int getBoardScore() {
		return boardScore;
	}

	public void setBoardScore(int boardScore) {
		this.boardScore = boardScore;
	}

	public Date getBoardCreateDate() {
		return boardCreateDate;
	}

	public void setBoardCreateDate(Date boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}

	public Date getBoardModifyDate() {
		return boardModifyDate;
	}

	public void setBoardModifyDate(Date boardModifyDate) {
		this.boardModifyDate = boardModifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriteNo=" + boardWriteNo + ", userId=" + userId + ", locName="
				+ locName + ", boardName=" + boardName + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardReadCount=" + boardReadCount + ", boardOriginalFileName=" + boardOriginalFileName
				+ ", boardRenamedFileName=" + boardRenamedFileName + ", transport=" + transport + ", travelMoney="
				+ travelMoney + ", boardScore=" + boardScore + ", boardCreateDate=" + boardCreateDate
				+ ", boardModifyDate=" + boardModifyDate + ", status=" + status + "]";
	}

	
}