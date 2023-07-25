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
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class SellUpdateController
 */
@WebServlet("/update.sell")
public class SellUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		Board b = new SellBoardService().selectBoard(bno);
		ArrayList<Attachment> list = new SellBoardService().selectAttachmentList(bno);
	
		request.setAttribute("b", b);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/board/sell/sellUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 50 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/sell_upfiles/");
			
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Board b = new Board();
			b.setBoardNo(Integer.parseInt(multi.getParameter("bno")));
			b.setBoardTitle(multi.getParameter("title"));
			b.setBoardContent(multi.getParameter("content"));
			b.setAddress(multi.getParameter("address1")+","+multi.getParameter("address2"));
			b.setSale(multi.getParameter("sale"));
			
			if(multi.getParameter("latitude") != null) {
				b.setLatitude(Double.parseDouble(multi.getParameter("latitude"))); }
			if(multi.getParameter("longitude") != null) {
				b.setLongitude(Double.parseDouble(multi.getParameter("longitude"))); }
			 
			
			// 새롭게 전달된 첨부파일이 있는 경우에만 list에 필요한 값 추가할 것
			ArrayList<Attachment> list = new ArrayList<>();
			if(multi.getFileNames() != null) {
				
				Enumeration e = multi.getFileNames(); // 전달된 파일들의 key값만 뽑아오기
				int fileLevel = 1;
				while(e.hasMoreElements()) {
					String fileName = (String)e.nextElement();
					String originName = multi.getOriginalFileName(fileName); // 넘어온 파일의 원본명
					String changeName = multi.getFilesystemName(fileName);
					
					Attachment at = new Attachment();
					at.setOriginName(originName);
					at.setChangeName(changeName);
					at.setFilePath("/resources/sell_upfiles/");
					at.setFileLevel(fileLevel++);
					at.setRefBno(Integer.parseInt(multi.getParameter("bno")));
					
					list.add(at);
				}
				
				// 새로 전달된 파일 있을 경우 원래 파일 서버에서 지워주기
				int index = 0;
				while(true) {
					String changeFileName = multi.getParameter("changeFileName"+ index++);
					//System.out.println(changeFileName);
					
					if(changeFileName == null) {
						break;
					}else{
						new File(savePath+changeFileName).delete();
					}
				}
			}
			
			ArrayList<Integer> originFileNos = new ArrayList<>();
			int index2 = 0;
			while(true) {
				String originFileNo = multi.getParameter("originFileNo"+index2++);
				//System.out.println(originFileNo);
				
				if(originFileNo == null) {
					break;
				}else {
					originFileNos.add(Integer.parseInt(originFileNo));
				}
			}
			
		
			int result = new SellBoardService().updateBoard(b, list, originFileNos);
			
			if(result>0) { 
				System.out.println("업데이트성공"); 
			}else { 
				if(!list.isEmpty()) {
					for(Attachment a : list) { 
						new File(savePath+a.getChangeName()).delete(); 
					} 
				}
				System.out.println("업데이트실패"); 
			}
		}
	}

}
