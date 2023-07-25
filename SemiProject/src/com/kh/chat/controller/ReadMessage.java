package com.kh.chat.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.chat.model.service.ChatService;
import com.kh.chat.model.vo.Message;

/**
 * Servlet implementation class ReadMessage
 */
@WebServlet("/readMessage")
public class ReadMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int reader = Integer.parseInt(request.getParameter("reader"));
		ArrayList<Message> mList = new ChatService().readMessageForBuyer(bno, reader);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		gson.toJson(mList, response.getWriter());
		// toJson(응답할 객체나 ArrayList, 응답할 스트림) : response.getWriter()라는 통로로 mList라는 ArrayList를 응답시키겠다.
		// 응답할 객체에 VO객체 하나만 제시하면 JSONObject형태로 만들어져서 응답
		// ArrayList로 제시시 JSONArray형태로 만들어져서 응답
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int crNo = Integer.parseInt(request.getParameter("crNo"));
		int reader = Integer.parseInt(request.getParameter("reader"));
		
		request.getSession().setAttribute("crNo", crNo);
		ArrayList<Message> mList = new ChatService().readMessage2(crNo, reader);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		gson.toJson(mList, response.getWriter());
	}

}
