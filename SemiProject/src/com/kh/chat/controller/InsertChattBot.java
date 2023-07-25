package com.kh.chat.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.chat.model.service.ChatService;

/**
 * Servlet implementation class InsertChattBot
 */
@WebServlet("/InsertChattBot")
public class InsertChattBot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertChattBot() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int buyerNo = Integer.parseInt(request.getParameter("buyer"));
		int check = new ChatService().selectChatroom(buyerNo);
		String checkResult = null;
		
		if(check<=0) {
			checkResult = "N";
			int result = new ChatService().insertChatBot(buyerNo);
			int crNo = new ChatService().selectChatroom(buyerNo);
			request.getSession().setAttribute("crNo", crNo);
			
			if(result<=0) {
				request.setAttribute("errorMsg", "채팅방생성실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		}else {
			checkResult = "Y";
			request.getSession().setAttribute("crNo", check);
		}
		
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
