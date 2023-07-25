package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class memberUpdateUserController
 */
@WebServlet("/updateuser.me")
public class memberUpdateUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public memberUpdateUserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("views/member/memberUpdateUser.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		/*
		 * String userName = request.getParameter("userName"); String userNickname =
		 * request.getParameter("userNickname"); String email =
		 * request.getParameter("email");
		 */
		String address = request.getParameter("address");
		String pet = request.getParameter("pet");
		String userPwd = request.getParameter("userPwd");
		String userId = request.getParameter("userId");
		// String userId = request.getParameter("userId");

		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		m.setAddress(address);

		System.out.println(userId + "," + userPwd + "," + address);

		Member updateUser = new MemberService().updateUser(m);

		if (updateUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateUser);
			request.getSession().setAttribute("alertMsg", "수정에 성공했개냥");
			response.sendRedirect(request.getContextPath() + "/Mypage.me");
		} else {
			request.setAttribute("errorMsg", "수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

	}

}
