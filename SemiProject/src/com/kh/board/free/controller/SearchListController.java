package com.kh.board.free.controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.free.model.service.FreeService;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class FreeJoinController
 */
@WebServlet("/searchWordAction.bf")
public class SearchListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchText = request.getParameter("searchText");
		
		int listCount; 
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new FreeService().searchListCount(); 
		
		currentPage = Integer.parseInt(  request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage")  );
		
		pageLimit = 10;
		
		boardLimit = 20;
		
		maxPage = (int) Math.ceil( ((double) listCount / boardLimit) );
	
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit -1;
		
		 if(endPage >maxPage) {
			 endPage = maxPage;
		 }

		 PageInfo pageInfo = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		 //리스트 조회 
		 ArrayList<Board> list = new FreeService().searchList(pageInfo, searchText);
		
		 request.setAttribute("pi", pageInfo);
		 request.setAttribute("list", list);	 
		 request.getRequestDispatcher("views/board/free/freeListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
