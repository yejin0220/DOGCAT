package com.kh.chat.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.chat.model.vo.Chatroom;
import com.kh.chat.model.vo.Message;

public class ChatDao {

	private Properties prop = new Properties();

	public ChatDao() {
		try {
			prop.loadFromXML(new FileInputStream(ChatDao.class.getResource("/sql/chat/chat-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int checkChatroom(Connection conn, int bno, int buyerNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkChatroom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, buyerNo);
			pstmt.setInt(2, buyerNo);
			pstmt.setInt(3, bno);
			pstmt.setInt(4, bno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("CR_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	public int insertChatroom(Connection conn, int bno, int buyerNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertChatroom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, buyerNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertMessageFromBuyer(Connection conn, int bno, int senderNo, String msg) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMessageFromBuyer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, senderNo);
			pstmt.setInt(3, senderNo);
			pstmt.setInt(4, bno);
			pstmt.setInt(5, senderNo);
			pstmt.setInt(6, senderNo);
			pstmt.setInt(7, senderNo);
			pstmt.setInt(8, bno);
			pstmt.setInt(9, senderNo);
			pstmt.setInt(10, senderNo);
			pstmt.setInt(11, bno);
			pstmt.setString(12, msg);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
	public ArrayList<Message> readMessageForBuyer(Connection conn, int bno, int reader) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Message> mList = new ArrayList<>();
		String sql = prop.getProperty("readMessageForBuyer");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, reader);
			pstmt.setInt(3, reader);
			pstmt.setInt(4, bno);
			pstmt.setInt(5, reader);
			pstmt.setInt(6, reader);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Message m = new Message(rset.getInt("SENDER"), rset.getInt("RECEIVER"), rset.getString("M_CONTENT"));
				mList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return mList;
	}
	
	public ArrayList<Chatroom> selectChatList(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Chatroom> chatList = new ArrayList<>();
		String sql = prop.getProperty("selectChatList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Chatroom croom = new Chatroom();
				croom.setChatroomNo(rset.getInt("CR_NO"));
				croom.setCreateDate(rset.getDate("CREATE_DATE"));
				croom.setSeller(rset.getString("SELLER"));
				croom.setBuyer(rset.getString("BUYER"));
				
				chatList.add(croom);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return chatList;
	}
	public String selectRecentMsg2(Connection conn, int crNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String recentMsg = null;
		String sql = prop.getProperty("selectRecentMsg2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, crNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				recentMsg = rset.getString("M_CONTENT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return recentMsg;
	}
	public ArrayList<Message> readMessage2(Connection conn, int crNo, int reader){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Message> mList = new ArrayList<>();
		String sql = prop.getProperty("readMessage2");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, crNo);
			pstmt.setInt(2, reader);
			pstmt.setInt(3, reader);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Message m = new Message(rset.getInt("SENDER"), rset.getInt("RECEIVER"), rset.getString("M_CONTENT"));
				mList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return mList;
	}
	public int insertMessage2(Connection conn, int crNo, int senderNo, String msg) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMessage2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, crNo);
			pstmt.setInt(2, senderNo);
			pstmt.setInt(3, senderNo);
			pstmt.setInt(4, senderNo);
			pstmt.setInt(5, crNo);
			pstmt.setString(6, msg);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
	
	public int checkMessage(Connection conn, int crNo, int reader) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("checkMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, crNo);
			pstmt.setInt(2, reader);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
			
			
			
	// 챗봇용	
	public int selectChatroom(Connection conn, int buyerNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectChatroom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, buyerNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("CR_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}
	
	public int insertChatBot(Connection conn, int buyerNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertChatBot");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, buyerNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Message> readChatbot(Connection conn, int reader){
		ArrayList<Message> mList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("readChatbot");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reader);
			pstmt.setInt(2, reader);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Message m = new Message(rset.getInt("SENDER"), 
										rset.getInt("RECEIVER"), 
										rset.getString("M_CONTENT"));
				mList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return mList;
		
	}
	
	public int insertChatMessage(Connection conn, int senderNo, String msg) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertChatMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, senderNo);
			pstmt.setInt(2, senderNo);
			pstmt.setString(3, msg);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public ArrayList<Chatroom> adminChatList(Connection conn){
		
		ArrayList<Chatroom> chatList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminChatList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Chatroom ct = new Chatroom();
				ct.setChatroomNo(rset.getInt("CR_NO"));
				ct.setCreateDate(rset.getDate("CREATE_DATE"));
				ct.setSeller(rset.getString("SELLER"));
				ct.setBuyer(rset.getString("BUYER"));
				
				chatList.add(ct);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return chatList;
		
	}
	
	public ArrayList<Chatroom> userChatList(Connection conn, int userNo){
		
		ArrayList<Chatroom> chatList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("userChatList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Chatroom ct = new Chatroom();
				ct.setChatroomNo(rset.getInt("CR_NO"));
				ct.setCreateDate(rset.getDate("CREATE_DATE"));
				ct.setSeller(rset.getString("SELLER"));
				ct.setBuyer(rset.getString("BUYER"));
				
				chatList.add(ct);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return chatList;
		
	}
	
	
	
	public String selectAdminMsg(Connection conn, int crNo) {
		
		String recentMsg = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdminMsg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, crNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				recentMsg = rset.getString("M_CONTENT");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return recentMsg;
	}
	
	public int insertChatMessage2(Connection conn, int crNo, int senderNo, String msg) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertChatMessage2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, crNo);
			pstmt.setInt(2, senderNo);
			pstmt.setInt(3, senderNo);
			pstmt.setInt(4, senderNo);
			pstmt.setInt(5, crNo);
			pstmt.setString(6, msg);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public ArrayList<Message> readChatbot2(Connection conn, int crNo, int reader){
		ArrayList<Message> mList = new ArrayList<Message>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("readChatbot2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, crNo);
			pstmt.setInt(2, reader);
			pstmt.setInt(3, reader);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Message m = new Message();
				m.setMessageContent(rset.getString("M_CONTENT"));
				m.setSender(rset.getInt("SENDER"));
				m.setReceiver(rset.getInt("RECEIVER"));
				
				mList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return mList;
		
	}	

public String selectRecentMsg3(Connection conn, int crNo) {
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String recentMsg = null;
	String sql = prop.getProperty("selectRecentMsg3");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, crNo);
		rset = pstmt.executeQuery();
		
		if(rset.next()) {
			recentMsg = rset.getString("M_CONTENT");
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}
	return recentMsg;
}
	
}
