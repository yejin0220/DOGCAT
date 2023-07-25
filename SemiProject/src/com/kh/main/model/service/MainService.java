package com.kh.main.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.kh.count.model.vo.Count;
import com.kh.main.model.dao.MainDao;

import static com.kh.common.JDBCTemplate.*;

public class MainService {
	
	public Count userCount(int userNo) {
		Connection conn = getConnection();
		
		int messageCount = new MainDao().messageCount(conn, userNo);
		int mateCount = new MainDao().mateCount(conn, userNo);	
		
		Count userCount = new Count();
		userCount.setcCount(messageCount);
		userCount.setmCount(mateCount);
		
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userCount;
	}

}
