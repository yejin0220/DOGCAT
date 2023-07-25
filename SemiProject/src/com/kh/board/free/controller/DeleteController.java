package com.kh.board.free.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.free.model.service.FreeService;
import com.kh.board.model.vo.Attachment;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet(urlPatterns = "/delete.bf" , name="boardDeleteServlet" )
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
	
		Attachment at = new FreeService().selectAttachment(boardNo);
		
		int result = new FreeService().deleteBoard(boardNo, userNo , at);
		
		if(result > 0) {
			if(at != null) {
				String savePath = request.getSession().getServletContext().getRealPath(at.getFilePath());				
				new File(savePath+at.getChangeName()).delete();
			}
			request.getSession().setAttribute("alertMsg", "성공적으로 게시글을 삭제했습니다.");
			response.sendRedirect(request.getContextPath()+"/list.bf");
		}else {
			response.getWriter().append("Served at: ").append(request.getContextPath());
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.print("<script>alert('게시글 삭제 실패');</script>");
			
			out.println("<script>location.href='list.bf';</script>");
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
