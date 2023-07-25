
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
	*{
          font-family: 'Noto Sans KR', sans-serif;
      }
      html, body {height: 100%; overflow-x:hidden;}
      #wrap {min-height: 100%; position: relative;}
      #container {padding-bottom: 20px;} /* footer height */
      
      .footer {
          width: 100%; 
          height: 100px; 
        /*   position: absolute;  */
          bottom: 0;
      }
      .footer>div{
          display: inline-block;
          vertical-align: middle;
          color: rgb(158, 158, 158);
          margin: 10px;
      }
      .footer2>div>li, .footer4>div>li{
          list-style-type: none;
          display: inline;
          margin: auto;
          text-decoration: none;
          
      }

      .footer4{
          float: right;
          margin: 30px;
      }
      .footer2>div>li a{
          color: rgb(158, 158, 158);
          padding-right: 20px;
      }
      .footer4>div>li a{
          padding-right: 9px;
      }


      .nav-area{
          background-color: #E6F2FF;
          align-items: center;
          margin: auto;
      }
      #nav{
          color: gray;
          font-size: 20px;
      }

      .nav-item a:hover{
          font-weight: bold;
          color: #FFD133;
      }
      .logo{
          display: flex;
          justify-content: center;
      }
       
     
</style>
</head>
<body>

   <div class="logo">
        <a href="<%= request.getContextPath() %>"><img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%9D%B4%EC%9C%A0%EC%A7%84/logo2.png" width="210px" ></a>
    </div>
        
    <div class="nav-area" style="margin-bottom: 20px;">
        <ul class="nav justify-content-center">
            <li class="nav-item">
              <a class="nav-link active" id="nav" aria-current="page" href="<%= request.getContextPath()%>/adminProfile">프로필</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="nav" href="<%= request.getContextPath()%>/admin_member">회원관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="nav" href="<%= request.getContextPath()%>/allB">게시판관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="nav" href="<%= request.getContextPath() %>/list.no">공지사항관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="nav" href="<%= request.getContextPath() %>/adminChatList">1:1문의</a>
            </li>
        </ul>
    </div>
	


</body>
</html>