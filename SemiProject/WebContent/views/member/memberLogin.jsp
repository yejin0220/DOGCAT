<%@ page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) request.getAttribute("loginUser");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="resources/css/member/login.css" rel="stylesheet" type="text/css">
<script src="<%= contextPath %>/resources/js/member/login.js"></script>
<script src="<%= contextPath %>/resources/js/member/link.js"></script>
<title>로그인 페이지</title>
</head>
<body class="login_star">
  	<div class="login_all">
        <div class="login_logo">
            <a href="<%= contextPath %>"><img src="resources/logo.png" width="200px"></a>
            <div class="login_wrapper">
                <h2>로그인</h2>
                <form method="post" action="<%= contextPath %>/login.me" id="login-form">
                    <input type="text" name="userId" id="userId" placeholder="아이디" autocomplete="off"> 
                    <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호" autocomplete="off">
                    <label for="remember-check"> <input type="checkbox" id="remember-check" > 아이디 저장 </label> &nbsp;
                    <label for="keepLogin"> <input type="checkbox" name="keepLogin" value="keep" id="keepLogin"> 자동 로그인 </label>
                    <input type="submit" onclick="submitLogin();" value="로그인" >
                <div class="separator"></div>
                <div class="login_footer">
                    <div class="id_search">
                        <a href="<%=contextPath%>/views/member/memberIdSearch.jsp">아이디 찾기</a>
                        <span>ㅣ</span>
                        <a href="<%=contextPath%>/views/member/memberPwdSearch.jsp">비밀번호 찾기</a>
                    </div>
                    <div class="sign_btn" align="end">
                        <button type="button" onclick="enrollPage();">회원가입</button>
                	</div>
                </div>
                </form>    
            </div>
       	</div>
    </div>
</body>
</html>