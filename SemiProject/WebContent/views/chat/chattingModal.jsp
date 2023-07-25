<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<style>
	.chat-area{
        border-radius: 20px;
        border: 1px solid gray;
        width: 500px;
        display: block;
        position: absolute;
        top:50%; left:50%; transform:translate(-50%, -50%);
    }
    .chat-title {
        background-color: white;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
    }
    .btn-close{
    	border: none;
    	background-color: white;
    }
    .btn-close:focus{
    	outline: none;
    }
    .chat-content{
        background-color: rgb(251, 246, 240);
        height: 550px;
        overflow: hidden;
        text-overflow: ellipsis;
        overflow-y:scroll;
        border-radius: 10px;
        width: 100%;
    }
    .chat-response{
        width: 70%;
        display: flex;
        padding-top: 20px;
    }
    .chat-request{
        display: flex;
        padding-top: 20px;
        justify-content: right;
    }
    .chat-request>img {
        margin-left: 10px;
    }
    .chat-bubble{
        width: 100%;
        background-color: rgb(255, 218, 119);
        margin-left: 15px;
        padding: 5px;
        overflow-wrap: break-word;
        word-wrap: break-word;
    }
    .chat-bubble2{
        width: 70%;
        background-color: rgb(255, 218, 119);
        margin-left: 15px;
        padding: 5px;
        overflow-wrap: break-word;
        word-wrap: break-word;
    }
    .chat-question {
        display: flex;
        justify-content: space-between;
        height: 60px;
    }
    .chat-question>input{
        /* width:100%; */
        height: 60px;
        border-bottom-left-radius: 20px;
        border-bottom-right-radius: 20px;
        border: none;
    }
    .chat-question>button {
        border: none;
        border-radius: 20px;
        width: 100px;
        background-color: rgb(230, 242, 255);
        color: rgb(0, 123, 255);
    }
    .chat-question>button:focus{
    	outline: none;
    }
</style>
</head>
<body>
	<div class="chat-area">
        <div class="chat-title">
            <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/free-icon-chat-oval-speech-bubbles-symbol-55009.png" width="35px">
            <span style="font-size: 29px; font-weight: bold;">1:1채팅</span>
            <button type="button" class="btn-close" style="float: right; margin-right: 20px; font-size: 25px;">X</button>
        </div>

        <div class="chat-content" >
            <div class="chat-response">
                <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-dog-2396837.png" width="50px" height="50px">
                <div class="chat-bubble">
                    안녕하세요! 또오개냥에 방문해주셔서 감사합니다:) 무엇을 도와 드릴까요?
                </div>
            </div>
            <div class="chat-request" style="display: flex;">
                <div class="chat-bubble2">
                    회원가입
                </div>
                <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-cat-2195875.png" width="50px" height="50px">
            </div>
        </div>

        <div class="chat-question">
            <input type="text" placeholder="메세지를 입력하세요" >
            <button onclick="sendMsg()">전송</button>
        </div>
    </div>
    <script>
	    $(".btn-close").click(function(){
	        $(".chat-area").css("display","none");
	    });
    </script>
</body>
</html>