<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="<%= contextPath %>/resources/css/member/idsearch.css" rel="stylesheet" type="text/css">
<script src="<%= contextPath %>/resources/js/member/regex.js"></script>
<title>아이디 찾기</title>
</head>

<body class="all">
	<div class="search_Id_all">
		<div class="search_logo">
	     <a href="<%= contextPath %>"><img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/logo.png" height="200" width="300" alt="">
	    </a>
	    </div>
		<div class="search_Id_Container">
			<form name="idfindscreen" method ="POST" action="<%= contextPath %>/idSearch.me" >
				<h1>아이디 찾기</h1>
					<input type="text" id="userName" name="userName" placeholder="이름을 입력해주세요.">
					<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요.">
					<button type="submit" id="searchBtn" onclick="return idchecks();">아이디찾기</button>
			</form>
		</div>
	</div>
</body>
</html>