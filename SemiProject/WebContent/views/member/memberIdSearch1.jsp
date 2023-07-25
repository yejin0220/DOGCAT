<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	String userId = request.getAttribute("userId").toString();

	System.out.println("============memberIdSearch1.jsp==============" );
	System.out.println("userId" + userId );
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="<%= contextPath %>/resources/css/member/idsearch.css" rel="stylesheet" type="text/css">
<script src="<%= contextPath %>/resources/js/member/link.js"></script>

<title>아이디 찾기</title>
</head>
<body class="all">
<div class="search_Id_all">
	<div class="search_logo">
    <a href="<%= contextPath %>"><img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/logo.png" height="200" width="300" alt="">
    </a>
    </div>
    <div class="search_Id_Container">
<%
if (userId != "NNNNNN") {
%>     
		<div class = "container">
			<div class = "found-success">
				<h4 align="center">  회원님의 아이디는 </h4>  
				<div class ="found-id" align="center"><%= userId %></div>
				<h4 align="center">  입니다 </h4>
			</div>
			<div class = "found-login">
				 <button type="button" id="btnLogin" onClick="goLogin()">로그인</button>
			</div>
		</div>
<%
} 
else {
%>
		<div class = "container">
	      	<div class = "found-fail">
		      	<h4 align="center">  등록된 정보가 없습니다 </h4>  
		     </div>
		     <div class = "found-login">
	 		    <button type="button" id="btnback" onClick="history.back()">뒤로가기</button>
	 		    <button type="button" id="btnjoin" onClick="goEnroll()">회원가입</button>
	       	</div>
       	</div>  
<%
}
%>      
	</div>
</div>
</body>
</html>