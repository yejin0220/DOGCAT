package com.kh.board.all.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.all.model.dao.AllBoardDao;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;

import static com.kh.common.JDBCTemplate.*;

public class AllBoardService {
	
	public int selectAllListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new AllBoardDao().selectAllListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Board> selectAllBoardList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new AllBoardDao().selectAllBoardList(conn, pi);
		
		close(conn);
		return list;
	}
	
	public int selectTypeListCount(int type) {
		
		Connection conn = getConnection();
		
		int listCount = new AllBoardDao().selectTypeListCount(conn,type);
		
		close(conn);
		
		return listCount;
		
		
	}
	public ArrayList<Board> selectTypeBoardList(int type, PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new AllBoardDao().selectTypeBoardList(conn, type, pi);
		
		close(conn);
		
		return list;
	}


}
