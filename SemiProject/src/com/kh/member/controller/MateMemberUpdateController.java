package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.mateboard.model.service.mateBoardService;

/**
 * Servlet implementation class MateMemberUpdateController
 */
@WebServlet("/updateMate")
public class MateMemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MateMemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userNickname = request.getParameter("userNickname");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String status = request.getParameter("status");
		
		String updateStatus = new mateBoardService().updateStatus(userNickname,boardNo,status );
		
		if(updateStatus!=null) {
			request.setAttribute("updateStatus", updateStatus);
			response.sendRedirect(request.getContextPath()+"/Mypage.jsp");
		}
		
		
	
	}

}
