package com.kh.board.mateboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.mateboard.model.service.mateBoardService;
import com.kh.board.mateboard.model.vo.Board;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MateApplyController
 */
@WebServlet("/applyMate")
public class MateApplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MateApplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		
		int result = new mateBoardService().applyMate(userNo, boardNo);
		
		/*
		 * if(result>0) { Board b = new mateBoardService().selectBoard(boardNo);
		 * request.setAttribute("b", b);
		 * request.getRequestDispatcher("views/board/mateboard/mateboardDetail.jsp").
		 * forward(request, response);
		 * 
		 * }else { request.setAttribute("errorMsg", "신청실패");
		 * request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,
		 * response); }
		 */
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
