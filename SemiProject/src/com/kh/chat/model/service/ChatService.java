package com.kh.chat.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.chat.model.dao.ChatDao;
import com.kh.chat.model.vo.Chatroom;
import com.kh.chat.model.vo.Message;

public class ChatService {

	public int checkChatroom(int bno, int buyerNo) {
		Connection conn = getConnection();
		int result = new ChatDao().checkChatroom(conn, bno, buyerNo);
		close(conn);
		return result;
	}
	public int insertChatroom(int bno, int buyerNo) {
		Connection conn = getConnection();
		int result = new ChatDao().insertChatroom(conn, bno, buyerNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int insertMessageFromBuyer(int bno, int senderNo, String msg) {
		Connection conn = getConnection();
		int result = new ChatDao().insertMessageFromBuyer(conn, bno, senderNo, msg);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public ArrayList<Message> readMessageForBuyer(int bno, int reader) {
		Connection conn = getConnection();
		ArrayList<Message> mList = new ChatDao().readMessageForBuyer(conn, bno, reader);
		close(conn);
		return mList;
	}
	
	public ArrayList<Chatroom> selectChatList(int userNo) {
		Connection conn = getConnection();
		ArrayList<Chatroom> chatList = new ChatDao().selectChatList(conn, userNo);
		close(conn);
		return chatList;
	}
	public String selectRecentMsg2(int crNo) {
		Connection conn = getConnection();
		String recentMsg = new ChatDao().selectRecentMsg2(conn, crNo);
		close(conn);
		return recentMsg;
	}
	public ArrayList<Message> readMessage2(int crNo, int reader){
		Connection conn = getConnection();
		ArrayList<Message> mList = new ChatDao().readMessage2(conn, crNo, reader);
		close(conn);
		return mList;
	}
	public int insertMessage2(int crNo, int senderNo, String msg) {
		Connection conn = getConnection();
		int result = new ChatDao().insertMessage2(conn, crNo, senderNo, msg);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int checkMessage(int crNo, int reader) {
		Connection conn = getConnection();
		int result = new ChatDao().checkMessage(conn, crNo, reader);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	// 문의하기(챗봇) 채팅	
	public int selectChatroom (int buyerNo) {
		Connection conn = getConnection();
		int result = new ChatDao().selectChatroom(conn, buyerNo);
		close(conn);
		return result;
		
	}
	
	public int insertChatBot (int buyerNo) {
		Connection conn = getConnection();
		int result = new ChatDao().insertChatBot(conn, buyerNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public ArrayList<Message> readChatbot(int reader){
		
		Connection conn = getConnection();
		ArrayList<Message> mList = new ChatDao().readChatbot(conn, reader);
		close(conn);
		return mList;
	}
	
	public int insertChatMessage(int senderNo, String msg) {
		Connection conn = getConnection();
		int result = new ChatDao().insertChatMessage(conn, senderNo, msg);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Chatroom> adminChatList(){
		
		Connection conn = getConnection();
		
		ArrayList<Chatroom> chatList = new ChatDao().adminChatList(conn);
		close(conn);
		return chatList;
	}
	
	public ArrayList<Chatroom> userChatList(int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Chatroom> chatList = new ChatDao().userChatList(conn, userNo);
		
		close(conn);
		
		return chatList;
	}
	
	
	public String selectAdminMsg(int crNo) {
		Connection conn = getConnection();
		String recentMsg = new ChatDao().selectAdminMsg(conn, crNo);
		close(conn);
		return recentMsg;
		
	}
	
	public int insertChatMessage2(int crNo, int senderNo, String msg) {
		Connection conn = getConnection();
		
		int result = new ChatDao().insertChatMessage2(conn, crNo, senderNo, msg);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	public ArrayList<Message> readChatbot2(int crNo, int reader){
		Connection conn = getConnection();
		
		ArrayList<Message> mList = new ChatDao().readChatbot2(conn, crNo, reader);
		
		close(conn);
		return mList;
		
	}
	
	
	public String selectRecentMsg3(int crNo) {
		Connection conn = getConnection();
		String recentMsg = new ChatDao().selectRecentMsg3(conn, crNo);
		close(conn);
		return recentMsg;
	}
}
