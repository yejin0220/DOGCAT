package com.kh.board.sell.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.vo.Board;
import com.kh.board.sell.model.service.SellBoardService;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class SellListController
 */
@WebServlet("/list.sell")
public class SellListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 페이징 처리
		int listCount;	// 현재 게시판의 총 게시글 개수
		int currentPage;	// 현재 페이지
		int pageLimit;	// 페이지 하단에 보여질 페이징바의 최대 개수
		int boardLimit;	// 한 페이지에 보여질 게시글의 최대 개수
		int maxPage;	// 가장 마지막 페이지가 몇번 페이지인지
		int startPage;	// 페이지 하단에 보여질 페이징바의 시작 수
		int endPage;	// 페이지 하단에 보여질 페이징바의 끝 수
		
		listCount = new SellBoardService().selectListCount();
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
		pageLimit = 10;
		boardLimit = 10;
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		startPage = (currentPage-1) / pageLimit * pageLimit+1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Board> list = new SellBoardService().selectList(pi);
		ArrayList<Board> nList = new SellBoardService().selectNoticeList();
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("nList", nList);
		
		request.getRequestDispatcher("views/board/sell/sellListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
