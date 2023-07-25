package com.kh.board.free.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.free.model.service.FreeService;
import com.kh.board.free.model.vo.Category;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class FreeJoinController
 */
@WebServlet("/insert.bf")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WriteController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 카테고리 조회
		ArrayList<Category> categoryList = new FreeService().selectCategoryList();

		request.setAttribute("categoryList", categoryList);

		request.getRequestDispatcher("views/board/free/freeEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 1024 * 1024 * 10;//

			String savePath = request.getSession().getServletContext().getRealPath("/resources/free_board_upfiles/");

			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			String category = multi.getParameter("category");
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			int numberOfFile = Integer.parseInt(multi.getParameter("numberOfFile")); //업로드 파일 개수 

			String boardWriter = ((Member) request.getSession().getAttribute("loginUser")).getUserNo() + "";

			Board board = new Board();
			board.setBoardCategory(category);
			board.setBoardTitle(title);
			board.setBoardContent(content);
			board.setBoardWriter(boardWriter);

			ArrayList<Attachment> fileList = new ArrayList(); // 파일 저장할 객체
			
			//파일의 개수만큼 저장
			for (int i = 0; i <= numberOfFile -1; i++) {
				
				String fileName = "upfile"+i;
				
				if (multi.getOriginalFileName(fileName) != null) { // 넘어온 첨부파일이 있는 경우
					
					Attachment at= new Attachment();
					at.setOriginName(multi.getOriginalFileName(fileName));
					at.setChangeName(multi.getFilesystemName(fileName));
					at.setFilePath("resources/free_board_upfiles/");
					at.setFileLevel(i);

					fileList.add(at);
				}
			}

			int result = new FreeService().insertBoard(board, fileList);

			if (result > 0) { // 성공 -> list.th를 요청
				request.getSession().setAttribute("alertMsg", "성공적으로 업로드 되었습니다");
				response.sendRedirect(request.getContextPath() + "/list.bf");
			} else {
				request.setAttribute("errorMsg", "사진게시판 업로드 실패..");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}
}
