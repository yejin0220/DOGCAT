package com.kh.chat.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.chat.model.service.ChatService;
import com.kh.chat.model.vo.Chatroom;

/**
 * Servlet implementation class AdminchatList
 */
@WebServlet("/adminChatList")
public class AdminchatList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminchatList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Chatroom> chatList = new ChatService().adminChatList();
		ArrayList<Integer> crNoList = new ArrayList<>();
		ArrayList<String> recentMsgs = new ArrayList<>();
		
		for(Chatroom cr : chatList){
			int crNo = cr.getChatroomNo();
			String recentMsg = new ChatService().selectAdminMsg(crNo);
			recentMsgs.add(recentMsg);
		}
		
		System.out.println(chatList);
		request.setAttribute("chatList", chatList);
		request.setAttribute("recentMsgs", recentMsgs);
		request.getRequestDispatcher("views/admin/adminChatList.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
