package com.kh.board.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.vo.Board;
import com.kh.board.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeEnrollFormController
 */
@WebServlet("/insert.no")
public class NoticeEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/board/notice/noticeEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.setCharacterEncoding("UTF-8");

		String noticeTitle = request.getParameter("title");
		String noticdContent = request.getParameter("content");
		String userNo = request.getParameter("userNo");
		
		Board b = new Board();
		b.setBoardTitle(noticeTitle);
		b.setBoardContent(noticdContent);
		b.setBoardWriter(userNo);
		
		int result = new NoticeService().insertNotice(b);	
		
		HttpSession session = request.getSession();
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/detail.no?bno=" + result);
		} else {
			session.setAttribute("alertMsg", "공지사항 등록 실패");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}
		
		
	}

}
