package com.kh.chat.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.chat.model.service.ChatService;

/**
 * Servlet implementation class InsertChatroom
 */
@WebServlet("/insertChatroom")
public class InsertChatroom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertChatroom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int buyerNo = Integer.parseInt(request.getParameter("buyer"));
		int check = new ChatService().checkChatroom(bno, buyerNo);
		String checkResult = null;
		
		if(check<=0) {
			checkResult = "N";
			int result = new ChatService().insertChatroom(bno, buyerNo);
			int crNo = new ChatService().checkChatroom(bno, buyerNo);
			request.getSession().setAttribute("crNo", crNo);
			
			if(result<=0) {
				request.setAttribute("errorMsg", "채팅방 생성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}else {
			checkResult = "Y";
			request.getSession().setAttribute("crNo", check);
		}
		
		// JSP와의 통로를 열어두기 위해 PrintWriter객체 생성
		response.getWriter().print(checkResult);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
