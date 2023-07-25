package com.kh.board.sell.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.sell.model.service.SellBoardService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class SellLikeController
 */
@WebServlet("/like.sell")
public class SellLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int uno = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		int result = new SellBoardService().selectLike(bno, uno);
		int result2 = 0;
		if(result == 0) {
			result2 = new SellBoardService().insertLike(bno, uno);
		}else {
			result2 = new SellBoardService().deleteLike(bno,uno);
		}
		
		if(result2 >0) {
			response.sendRedirect(request.getContextPath()+"/detail.sell?bno="+bno);
		}else {
			request.setAttribute("errorMsg", "찜하기 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
