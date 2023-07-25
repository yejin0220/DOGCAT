package com.kh.board.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.notice.model.dao.NoticeDao;
import com.kh.common.model.vo.PageInfo;

import static com.kh.common.JDBCTemplate.*;

public class NoticeService {

	public ArrayList<Board> selectNoticeList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new NoticeDao().selectNoticeList(conn, pi);
		
		close(conn);
		
		return list;
		
	}
	
	public int selectNoticeListCount() {
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().selectNoticeListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	public int insertNotice(Board b) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, b);
		
		if(result > 0) {
			
			commit(conn);
			
			result = new NoticeDao().selectNoticeNo(conn);
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	public int increaseCount(int bno) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, bno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public Board selectNotice(int bno) {
		
		Connection conn = getConnection();
		
		Board b = new NoticeDao().selectNotice(conn, bno);
		
		close(conn);
		
		return b;
		
	}
	
	public int updateNotice(Board b) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int deleteNotice(int bno) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, bno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public ArrayList<Board> selectMainNotice(){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new NoticeDao().selectMainNotice(conn);
		
		close(conn);
		
		return list;
		
	}
	

	public ArrayList<Attachment> selectMainBoard(){
		
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new NoticeDao().selectMainBoard(conn);
		
		close(conn);
		
		return list;
		
	} 
	

}
