package com.kh.board.sell.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.vo.Attachment;
import com.kh.board.sell.model.service.SellBoardService;

/**
 * Servlet implementation class SellDeleteController
 */
@WebServlet("/delete.sell")
public class SellDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		ArrayList<Attachment> list = new SellBoardService().selectAttachmentList(bno);
		int result = new SellBoardService().deleteBoard(bno, list);
		
		if(result>0) {
			if(list != null) {
				for(Attachment at : list) {
					String savePath = request.getSession().getServletContext().getRealPath(at.getFilePath());
					new File(savePath+at.getChangeName()).delete();
				}
			}
			response.sendRedirect(request.getContextPath()+"/list.sell");
		}else {
			request.setAttribute("errorMsg", "게시글 삭제 실패");
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
