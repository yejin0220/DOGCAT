package com.kh.count.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.chat.model.dao.ChatDao;
import com.kh.chat.model.vo.Chatroom;
import com.kh.count.model.dao.CountDao;
import com.kh.count.model.vo.Count;

import static com.kh.common.JDBCTemplate.*;


public class CountService {
	
	public Count selectCount(int userNo) {
		
		Connection conn = getConnection();
		
		int bCount = new CountDao().selectBCount(conn, userNo);
		int sCount = new CountDao().selectSCount(conn, userNo);
		int cCount = new CountDao().selectCCount(conn, userNo); 
		int mCount = new CountDao().selectMCount(conn, userNo);
		
		Count count = new Count(userNo, bCount ,sCount,cCount, mCount);
		
		System.out.println(count);
		
		close(conn);
		
		return count;
	}
	
	public ArrayList<Chatroom> selectChatroomList(int userNo) {
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
	
	
}
