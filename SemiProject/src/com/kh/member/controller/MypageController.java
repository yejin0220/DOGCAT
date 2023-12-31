package com.kh.member.controller;

import java.util.ArrayList; 
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.chat.model.service.ChatService;
import com.kh.chat.model.vo.Chatroom;
import com.kh.count.model.service.CountService;
import com.kh.count.model.vo.Count;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.reply.model.vo.Reply;
import com.kh.save.model.vo.Save;

/**
 * Servlet implementation class MypageController
 */
@WebServlet("/Mypage.me")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		HttpSession session = request.getSession();
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		Attachment at = new MemberService().memberListImg(loginUser.getUserId());
		ArrayList<Board> list = new MemberService().selectBoardList(loginUser.getUserNo());
		ArrayList<Board> Mlist = new MemberService().selectMBoardList(loginUser.getUserNo());
		
		ArrayList<Save> slist = new MemberService().selectSaveList(loginUser.getUserNo());
		ArrayList<Reply> rlist = new MemberService().selectReplyList(loginUser.getUserNo());
		
		ArrayList<Chatroom> chatList = new ChatService().userChatList(loginUser.getUserNo());
		ArrayList<Integer> crNoList = new ArrayList<>();
		ArrayList<String> recentMsgs = new ArrayList<>();
		
		System.out.println("c"+chatList);
		for(Chatroom cr : chatList) {
			int crNo = cr.getChatroomNo();
			String recentMsg = new ChatService().selectRecentMsg3(crNo);
			recentMsgs.add(recentMsg);
		}
		System.out.println("최종"+recentMsgs);
		

		//회원이 등록한 데이터 갯수
		Count count = new CountService().selectCount(loginUser.getUserNo());
	
		if(at != null) {
			loginUser.setFileName(at.getFilePath() + at.getChangeName());
		}
		
		request.setAttribute("list", list);
		request.setAttribute("Mlist", Mlist);
		request.setAttribute("chatList", chatList);
		request.setAttribute("slist", slist);
		request.setAttribute("rlist", rlist);
		request.setAttribute("count", count);
		request.setAttribute("recentMsgs", recentMsgs);

		request.getRequestDispatcher("views/member/Mypage.jsp").forward(request, response);
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
