<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
 	request.setCharacterEncoding("UTF-8");
 	String alertMsg = request.getAttribute("alertMsg").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="<%= contextPath %>/resources/css/member/pwdsearch.css" rel="stylesheet" type="text/css">
<script src="<%= contextPath %>/resources/js/member/link.js"></script>
<title>비밀번호 찾기</title>

</head>
<body class="all">
<div class="search_Pwd_all">
	<div class="search_logo">
    <a href="<%= contextPath %>"><img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/logo.png" height="200" width="300" alt="">
    </a>
    </div>
    <div class="search_Pwd_Container">
<%
if (alertMsg == "success") {
%>     
		<div class = "container">
			<div class = "found-success">
				<h4 align="center"> 회원님의 임시 비밀번호가 이메일로 발송되었습니다. </h4>  
				<h4 align="center"> 로그인 후 비밀번호를 수정해주세요. </h4>  
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