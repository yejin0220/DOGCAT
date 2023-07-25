package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*; 

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.mateboard.model.vo.Mate;
import com.kh.chat.model.vo.Chatroom;
import com.kh.common.JDBCTemplate;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.pet.model.vo.Pet;
import com.kh.reply.model.vo.Reply;
import com.kh.save.model.vo.Save;
 
public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();

		Member m = new MemberDao().loginMember(conn, userId, userPwd);

		close(conn);

		return m;
		
	}
	
	public Member updateMember(Member m) {

		Connection conn = getConnection();

		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;

		if (result > 0) {
			commit(conn);

			updateMem = new MemberDao().selectMember(conn, m.getUserId());
			
		} else {
			rollback(conn);
		}

		close(conn);
		
		return updateMem;
		
	}
	
	public Member updateUser(Member m) {
		Connection conn = getConnection();

		int result = new MemberDao().updateUser(conn, m);
		
		Member updateUser = null;

		if (result > 0) {
			commit(conn);

			updateUser = new MemberDao().selectUser(conn, m.getUserId());
			
		} else {
			rollback(conn);
		}

		close(conn);

		return updateUser;
	}
	
	public int deleteMember(String userId, String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().deleteMember(conn, userId, userPwd);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	
	public int insertProfileImg(int userNo, Attachment at) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertProfileImg(conn, userNo, at);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public ArrayList<Attachment> selectProfileImg(int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new MemberDao().selectProfileImg(conn, userNo);
		
		close(conn);
		
		return list;
		
	}
	
	public ArrayList<Member> selectMemberList(){
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMemberList(conn);
		
		close(conn);
		
		return list;
			
	}
	
	public ArrayList<Board> selectBoardList(int boardWriter){
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new MemberDao().selectBoardList(conn, boardWriter);
		
		close(conn);
		
		
		return list;
			
	}
	
	public ArrayList<Board> selectMBoardList(int boardWriter){
		
		Connection conn = getConnection();
		
		ArrayList<Board> Mlist = new MemberDao().selectMBoardList(conn, boardWriter);
		
		close(conn);
		
		
		return Mlist;
			
	}
	
	
	public ArrayList<Chatroom> selectChatroomList(int seller){
		
		Connection conn = getConnection();
		
		ArrayList<Chatroom> clist = new MemberDao().selectChatroomList(conn, seller);
		
		close(conn);
		
		System.out.println(seller);
		return clist;
			
	}
	
	public ArrayList<Save> selectSaveList(int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Save> slist = new MemberDao().selectSaveList(conn, userNo);
		
		close(conn);
		
		System.out.println(userNo);
		
		return slist;
			
	}
	
	public ArrayList<Reply> selectReplyList(int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Reply> rlist = new MemberDao().selectReplyList(conn, userNo);
		
		close(conn);
		
		return rlist;
			
	}
	
	
	public Member memberListDetail(String userId) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().selectDetailMember(conn, userId);
		
		close(conn);
		
		return m;
	}
	
	public Attachment memberListImg(String userId){
		Connection conn = getConnection();
		
		Attachment at = new MemberDao().memberListImg(conn, userId);
		
		close(conn);
		
		return at;
	}
	
	public String updateStatusM(String status, String userId) {
		Connection conn = getConnection();
		
		
		int result =  new MemberDao().updateStatusM(conn, userId, status);
		
		String updateStatus = null;
		
		if(result > 0) {
			commit(conn);
			
			updateStatus = new MemberDao().selectStatus(conn, userId);
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateStatus;
	}
	
	// 아이디 중복체크
	public int idCheck(String userId) {

		Connection conn = getConnection();
	
			int count = new MemberDao().idCheck(conn, userId);
	
		close(conn);
	
		return count;
	}
	
	// 닉네임 중복체크
	public int nickCheck(String userNickname) {
	
		Connection conn = getConnection();
	
		int count1 = new MemberDao().nickCheck(conn, userNickname);
	
		close(conn);
	
		return count1;
	}
	
	// 이메일 중복체크
	public int emailCheck(String email) {
	
		Connection conn = getConnection();
	
		int count1 = new MemberDao().emailCheck(conn, email);
	
		close(conn);
	
		return count1;
	}
	
	// 회원가입 멤버, 펫정보 삽입
	public int insertMember(Member m, Pet p) {
	
		Connection conn = getConnection();
	
		int result1 = new MemberDao().insertMember(conn, m);
		int result2 = 1;
	
		if (p != null) {
			result2 = new MemberDao().insertPet(conn, p);
		}
	
		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
	
		close(conn);
	
		return result1 * result2;
	}
	
	MemberDao dao = new MemberDao();
	
	// 이름,이메일로 아이디 찾기
	public String searchMemberId(String inputName, String inputEmail) { 
		return dao.searchMemberId(inputName, inputEmail);
	}
	
	// 아이디,이름으로 이메일 찾기
	public String searchMemberEmail(String inputId, String inputName) { 
		return dao.searchMemberEmail(inputId, inputName);
	}
	
	// 비밀번호 업데이트
	public int UpdateMemberPwd(Member member) { 
		return dao.UpdateMemberPwd(member);
	}
	
	//메이트리스트
	
	
}
