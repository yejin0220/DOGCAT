package com.kh.board.free.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.free.model.service.FreeService;
import com.kh.board.free.model.vo.Reply;
import com.kh.board.free.model.vo.ReplyBuilder;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ReplyListInsertController
 */
@WebServlet("/rinsert.bf")
public class ReplyListInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyListInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String replyContent = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int userNo =  ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
	
		Reply r = new Reply();
		r.setReplyContent(replyContent);
		r.setRefBno(boardNo);
		r.setReplyWriter(userNo+"");
		
		ReplyBuilder rb = new ReplyBuilder.
								Builder(1).
								setReplyContent("댓글내용").
								setRefBno(1).
								build();
		
		int result = new FreeService().insertReply(r);
		
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
