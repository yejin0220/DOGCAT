package com.kh.chat.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.chat.model.service.ChatService;

/**
 * Servlet implementation class InsertChatMessage
 */
@WebServlet("/insertChatMessage")
public class InsertChatMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertChatMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int senderNo = Integer.parseInt(request.getParameter("buyer"));
		String msg = request.getParameter("msg");
		int result = new ChatService().insertChatMessage(senderNo, msg);
		
		if(result<=0) {
			request.setAttribute("errorMsg","실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int crNo = Integer.parseInt(request.getParameter("crNo"));
		int senderNo = Integer.parseInt(request.getParameter("buyer"));
		String msg = request.getParameter("msg");
		
		int result = new ChatService().insertChatMessage2(crNo, senderNo, msg);
		
		if(result<=0) {
			request.setAttribute("errorMsg", "메시지 저장 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
