package com.kh.board.mateboard.model.vo;

public class Mate {
	
	private int userNo;
	private int boardNo;
	private String status;
	private String userNickname;
	
	public Mate() {
		super();
	}

	public Mate(int userNo, int boardNo, String status, String userNickname) {
		super();
		this.userNo = userNo;
		this.boardNo = boardNo;
		this.status = status;
		this.userNickname=userNickname;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	@Override
	public String toString() {
		return "Mate [userNo=" + userNo + ", boardNo=" + boardNo + ", status=" + status + "]";
	}
	
	

}
