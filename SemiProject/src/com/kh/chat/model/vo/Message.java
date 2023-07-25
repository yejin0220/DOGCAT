package com.kh.chat.model.vo;

import java.sql.Date;

public class Message {

	private int messageNo; //	MESSAGE_NO
	private int chatroomNo; //	CR_NO 참조채팅방번호
	private int sender; //	SENDER 보낸회원번호
	private int receiver; // RECEIVER 받는회원번호
	private String messageContent; //	M_CONTENT
	private Date createDate; //	CREATE_DATE
	private String check; //	M_CHECK 확인여부(Y/N)
	
	public Message() {
		super();
	}
	public Message(int messageNo, int chatroomNo, int sender, String messageContent, Date createDate, String check) {
		super();
		this.messageNo = messageNo;
		this.chatroomNo = chatroomNo;
		this.sender = sender;
		this.messageContent = messageContent;
		this.createDate = createDate;
		this.check = check;
	}
	public Message(int sender, int receiver, String messageContent) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.messageContent = messageContent;
	}
	
	
	public int getReceiver() {
		return receiver;
	}
	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public int getChatroomNo() {
		return chatroomNo;
	}
	public void setChatroomNo(int chatroomNo) {
		this.chatroomNo = chatroomNo;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", chatroomNo=" + chatroomNo + ", sender=" + sender + ", receiver="
				+ receiver + ", messageContent=" + messageContent + ", createDate=" + createDate + ", check=" + check
				+ "]";
	}
	
}
