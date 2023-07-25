package com.kh.board.sell.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.sell.model.service.SellBoardService;
import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class SellInsertController
 */
@WebServlet("/insertBoard.sell")
public class SellInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/board/sell/sellEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 50 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/sell_upfiles/");
			
			MultipartRequest multi = new MultipartRequest(request , savePath, maxSize ,"UTF-8", new MyFileRenamePolicy());
			
			Board b = new Board();
			b.setBoardTitle(multi.getParameter("title"));
			b.setBoardContent(multi.getParameter("content"));
			b.setBoardWriter(((Member)request.getSession().getAttribute("loginUser")).getUserNo()+"");
			b.setAddress(multi.getParameter("address1")+","+multi.getParameter("address2"));
			if(multi.getParameter("latitude") != null) {
				b.setLatitude(Double.parseDouble(multi.getParameter("latitude")));
			}
			if(multi.getParameter("longitude") != null) {
				b.setLongitude(Double.parseDouble(multi.getParameter("longitude")));
			}
			
			ArrayList<Attachment> list = new ArrayList<>();
				
			Enumeration e = multi.getFileNames(); // 전달된 파일들의 key값만 뽑아오기
			int fileLevel = Integer.parseInt(multi.getParameter("fileLength"));
			while(e.hasMoreElements()) {
				String fileName = (String)e.nextElement();
				String originName = multi.getOriginalFileName(fileName); // 넘어온 파일의 원본명
				String changeName = multi.getFilesystemName(fileName);
				
				Attachment at = new Attachment();
				at.setOriginName(originName);
				at.setChangeName(changeName);
				at.setFilePath("/resources/sell_upfiles/");
				at.setFileLevel(fileLevel--);
				
				list.add(at);
				
				//System.out.println(originName);
			}
			
			int result = new SellBoardService().insertSellBoard(b, list);
			
			if(result>0) {
				System.out.println("업로드성공");
			}else {
				if(!list.isEmpty()) {
					for(Attachment a : list) {
						new File(savePath+a.getChangeName()).delete();
					}
				}
				request.setAttribute("errorMsg", "게시글 작성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

}
