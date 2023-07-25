<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<title>DBTI</title>
<link rel="stylesheet" href="resources/mbti/css/default.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="resources/mbti/css/main.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="resources/mbti/css/qna.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="resources/mbti/css/animation.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="resources/mbti/css/result.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>

	<div class="container pt-5">
		<section id="main" class="mx-auto my-5 py-5 px-3">
			<!-- 부트스트랩 그리드 이용하기 -->
			<h1>반려동물 성격유형검사</h1>
			<div class="col-lg-6 col-md-8 col-sm-10 col- mx-auto">
				<img class="img-fluid my-5" src="resources/mbti/img/main.png" alt="mainImage">
			</div>
			<p>
				강아지 성격 테스트<br> 우리 강아지는 어떤 성격일까?
			</p>
			<button type="button" class="btn btn-outline-info mt-3" onclick="js:begin();">시작하기</button>
			<button type="button" class="btn btn-outline-secondary mt-3" onclick="history.back();">뒤로가기</button>
		</section>
		<section id="qna" class="pt-5">
			<div class="status mx-auto mt-5">
				<div class="statusBar"></div>
			</div>
			<div class="qBox my-5 py-3 mx-auto"></div>
			<div class="answerBox"></div>
		</section>
		<section id="result" class="mx-auto my-5 py-5 px-3">
			<h1>당신의 결과는?!</h1>
			<div class="resultName"></div>
			<div id="resultImg"
				class="my-3 col-lg-6 col-md-8 col-sm-10 col- mx-auto"></div>
			<div class="resultDesc"></div>
			<a type="button" class="kakao mt-3 py-2 px-3" href="<%= request.getContextPath()%>">홈으로</a>
			
		</section>
	</div>

	
	<script src="resources/mbti/js/data.js?v=<%=System.currentTimeMillis()%>" charset="UTF-8"></script>
	<script src="resources/mbti/js/start.js?v=<%=System.currentTimeMillis()%>" charset="UTF-8"></script>
	<script src="resources/mbti/js/share.js?v=<%=System.currentTimeMillis()%>" charset="UTF-8"></script>
</body>
</html>