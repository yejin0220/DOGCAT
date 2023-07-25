package com.kh.board.sell.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.sell.model.service.SellBoardService;

/**
 * Servlet implementation class SellDetailController
 */
@WebServlet("/detail.sell")
public class SellDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int result = new SellBoardService().increaseCount(bno);
		
		if(result>0) {
			Board b = new SellBoardService().selectBoard(bno);
			ArrayList<Attachment> list = new SellBoardService().selectAttachmentList(bno);
			int lCount = new SellBoardService().selectLikeCount(bno);
			
			request.setAttribute("b", b);
			request.setAttribute("list", list);
			request.setAttribute("lCount", lCount);
			request.getRequestDispatcher("views/board/sell/sellDetailView.jsp").forward(request, response);
		}else {
			System.out.println("게시글 조회 실패");
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
