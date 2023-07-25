<%@ page import="java.util.ArrayList, com.kh.board.model.vo.*, com.kh.chat.model.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Board b = (Board)request.getAttribute("b");
	String address = b.getAddress();
	int index = address.indexOf(",");
	String address1 = address.substring(0,index);
	String address2 = address.substring(index+1);
	
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	div {
        box-sizing: border-box;
        /* border: 1px solid lightgray; */
        line-height: 35px;
    }
    #contents {
        width: 1200px;
        height: auto;
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
    }
    #page-title {
        text-align: center;
        color: #FFD133;
        font-size: 35px;
    }
    hr {
        margin: 5px 0;
        border: 0.7px solid lightgray;
    }
    #page-description {
        text-align: center;
        font-size: 13px;
        margin-bottom: 30px;
    }

    #button-area {
        display: flex;
        justify-content: right;
    }
    #button-area button {
        border-radius: 7px;
        border: 0;
        padding: 5px 15px;
        font-size: 20px;
    }
    #button-area button:focus{
    	border: none;
        outline: none;
    }
    #chatting {
        background-color: rgb(230, 242, 255);
        color: rgb(0, 123, 255);
    }
    #like {
    	background-color: #FFD133;
    	color: white;
    }
    .search2 {
        display: none;
    }
    #title-area {
        display: flex;
        justify-content: space-evenly;
    }
    #title-area div, #title-area2 div {
        border: 2px solid rgb(204, 204, 204);
        height: 40px;
        color: black;
        font-size: 15px;
        border-radius: 5px;
        padding: 0 10px;
    }
    #title-area .address {
        width: 150px;
        text-align: center;
    }
    #title-area .content-title {
        width: 888px;
    }
    #title-area2 div {
        width: 100%;
    }
    #content-area>div{
        width: 100%;
        height: 450px;
        padding: 0 10px;
        border: 2px solid #ccc;
        border-radius: 5px;
        resize: none;
    }
    h5 {
        color: #FFD133;
    }
    #map {
    	margin-bottom: 5px;
    }
    #under-button {
    	display: flex;
        justify-content: center;
    }
    #under-button>button {
    	border-radius: 7px;
        border: 0;
        padding: 5px 15px;
        font-size: 15px;
    }
    #under-button button:focus{
    	border: none;
        outline: none;
    }
    #updateBtn {
    	background-color: rgb(230, 242, 255);
        color: rgb(0, 123, 255);
    }
    #deleteBtn {
    	background-color: #FFD133;
    	color : white;
    }
    
    /* 삭제 모달 */
    *{
        font-family: 'Noto Sans KR', sans-serif;
        /* border: 1px solid black; */
    }
    .container{
        text-align: center;
        padding: 10px;
    }
    
    #modal.modal-overlay {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 50%;
        display: none;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
    }
    #modal .modal-window {
        background:   rgb(251, 246, 240);
        box-shadow: 0 8px 32px 0 rgba(133, 133, 134, 0.37);
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
        width: 500px;
        position: relative;
        top: -100px;
        padding: 10px;
    }
    button {
        margin-top: 20px;
    }

    #cancel {
        background-color: lightgrey;
    }
    #delete {
        background-color: #FFD133;
    }
    
    /* 일대일채팅 모달 */
    .chat-area{
        border-radius: 20px;
        border: 1px solid gray;
        width: 500px;
        display: none;
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
        width:100%; 
        height: 60px;
        border-bottom-left-radius: 20px;
        border-bottom-right-radius: 20px;
        border: none;
    }
    .chat-question>input:focus {
        outline: none;
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
	<%@ include file="../../common/menubar.jsp" %>
	
	<div id="contents">
        <div id="page-title">
            <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/KakaoTalk_20230316_095326819_01.png" width="45px">
            나눔&거래
            <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/KakaoTalk_20230316_095326819_02.png" width="45px">
        </div>
        <hr>
        <div id="page-description">
            우리 아이가 좋아하지 않는 장난감, 옷, 사료 등을 팔고, <br>
            필요한 물품들을 싸게 사보세요!
        </div>

        <div id="button-area">
        	<c:if test="${!empty loginUser and loginUser.userNickname ne b.boardWriter}">
        		<button type="button" id="like" onclick="like();">찜하기</button>
                <button type="button" id="chatting">구매 문의 채팅</button>
            </c:if>
        </div>
        <div id="title-area">
            <div class="address" id="address1"><%= address1 %></div>
            <div class="address" id="address2"><%= address2 %></div>
            <div class="content-title"><%= b.getBoardTitle() %></div>
        </div>
        <div id="title-area2">
            <div class="title-detail"><%=b.getBoardWriter() %> || <%=b.getCreateDate() %> || 조회수 <%= b.getCount() %> || 찜 ${lCount }</div>
        </div>
        <div id="content-area">
            <div id="content-main">
            	<%= b.getBoardContent() %>
            	<br><br>
            
	            <c:if test="${!empty requestScope.list }">
	        		<c:forEach var="at" items="${requestScope.list }" varStatus="status">
	        			<img src="<%=contextPath%>${at.filePath}${at.changeName}" width='150' height='120'>
	        			<br>
	        		</c:forEach>
	        	</c:if>
            </div>
        </div>

        <hr>
        <h5>거래 희망 장소</h5>
        <div id="map" style="width:100%; height:350px;">

        </div>
        
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=74c4595a346e879941f9b54bcb0a86f0"></script>
        <script>
	        const lat = <%=b.getLatitude() %>;
	        const long = <%= b.getLongitude()%>;
	        
	        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	            mapOption = { 
	                center: new kakao.maps.LatLng(lat, long), // 지도의 중심좌표
	                level: 3 // 지도의 확대 레벨
	            };
	        
	        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	        
	        var marker = new kakao.maps.Marker({ 
	            // 지도 중심좌표에 마커를 생성합니다 
	            position: map.getCenter() 
	        }); 
	        // 지도에 마커를 표시합니다
	        marker.setMap(map);
        </script>
        <div id="under-button">
        	<button type="button" align="center" onclick="toList();">목록으로</button>
        	<c:if test="${!empty loginUser and loginUser.userNickname eq b.boardWriter}">
        		<button type="button" id="updateBtn" onclick="toUpdate();">수정하기</button>
        		<button type="button" id="deleteBtn" onclick="toDelete();">삭제하기</button>
        	</c:if>
        </div>
        <script>
        	function toList(){
        		location.href="<%= contextPath%>/list.sell";
        	}
        	function toUpdate(){
        		location.href="<%=contextPath%>/update.sell?bno=<%=b.getBoardNo()%>";
        	}
        	function toDelete(){
        		$("#modal").css("display", "flex");
        	}
        	function like(){
        		location.href="<%= contextPath %>/like.sell?bno=<%= b.getBoardNo() %>";
        	}
        </script>
    </div>

	<%@ include file="../../common/footer.jsp" %>
	
	<!-- 삭제모달 -->
    <div class="modal-overlay" id="modal">
        <div class="modal-window">
            <div class="modal-header">
                <h3 class="modal-title" style="font-weight: bold;">나눔&거래</h3>
                <div type="button" class="close">X</div>
            </div>
            <div class="modal-content">
                <div class="container">
                    <div>삭제하시겠습니까?</div> 
                    
                    <button type="button" id="delete" class="btn btn-sm">삭제</button>
                    <button type="button" id="cancel" class="btn btn-sm">취소</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            $(".close, #cancel").click(function(){
                $("#modal").css("display","none");
            });
            $("#delete").click(function(){
            	location.href="<%= contextPath %>/delete.sell?bno=<%= b.getBoardNo() %>"
            });
        })
    </script>
    
    <!-- 일대일 채팅 모달 -->
    <div class="chat-area">
        <div class="chat-title">
            <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/free-icon-chat-oval-speech-bubbles-symbol-55009.png" width="35px">
            <span style="font-size: 29px; font-weight: bold;">1:1채팅</span>
            <button type="button" class="btn-close" style="float: right; margin-right: 20px; font-size: 25px;">X</button>
        </div>

        <div class="chat-content" >
            
        </div>

        <div class="chat-question">
            <input type="text" id="msg-content" placeholder="메세지를 입력하세요" >
            <button onclick="sendMsg()">전송</button>
        </div>
    </div>

    <script>
       $(function(){
            $("#chatting").click(function(){
                $(".chat-area").css("display","block"); 
                
                // 새로고침 되지 않게 비동기 식으로 채팅방 생성 요청 보내기
                $.ajax({
                	url : '<%= contextPath %>/insertChatroom',
                	type : 'get',
                	data : {bno : <%= b.getBoardNo() %>, buyer : ${loginUser.userNo}},
                	success : function(checkResult){ // 매개변수에는 서블릿으로부터 전달받은 응답데이터가 담겨있음
                		if(checkResult == "N"){
                			console.log("ajax통신 성공/채팅방생성");
                		}else{
                			console.log("ajax통신 성공/메세지 읽어오기");
                			
                			// 새로고침 되지 않게 비동기 식으로 채팅내역 불러오기
                            $.ajax({
                            	url : '<%= contextPath %>/readMessage',
                            	type : 'get',
                            	data : {bno : <%= b.getBoardNo() %>, reader : ${loginUser.userNo}},
                            	success : function(mList){
                            		console.log("메세지 읽어오기 성공");
                            		if(mList!=null){
                            			
                            			let str = "";
                            			for(let i = 0; i<mList.length; i++){
                                			if(mList[i].sender != ${loginUser.userNo}){ // 메세지 보낸이가 현재 리더가 아니면
                                				str += "<div class='chat-response'>"
                                							+ "<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-dog-2396837.png' width='50px' height='50px'>"
                                                			+ "<div class='chat-bubble'>"+mList[i].messageContent+"</div>"
                                                		  +"</div>";
                                			}else{ // 일치할 경우
                                				str += "<div class='chat-request'>"
                                        			+ "<div class='chat-bubble2'>"+mList[i].messageContent+"</div>"
                                        			+ "<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-cat-2195875.png' width='50px' height='50px'>"
                                        		  +"</div>";                       
                                			}
                                		}
                               			$(".chat-content").html(str);
                            		}
                            	},
                            	error : function(){
                            		console.log("메세지 읽어오기 실패");
                            	}
                            });
                		}
                	},
                	error : function(){
                		console.log("ajax통신 실패");
                	}
                });
             	
                websocket();
                
            });
            
         
            $(".btn-close").click(function(){
                $(".chat-area").css("display","none");
            });
            
            /* // 모달창 드래그해서 위치 옮길 수 있게 하는 코드
            $(".chat-area").draggable(); */
        });
        
       let socket;
       
       function websocket(){
    		// 웹소켓 서버에 연결하기
           socket = new WebSocket("ws://localhost:8081<%= contextPath %>/chattingServer");
        	
       	   // socket 설정하기
           // 1. 접속 후 실행되는 이벤트 핸들러
           socket.onopen = function(e){
        	   console.log("접속성공");
           }
           
           // 2. 채팅서버에서 sendText, sendObject메소드를 실행하면 실행되는 함수
           socket.onmessage = function(e){
        	   
        	   // Object형태의 String데이터(JSONObject)를 객체로 변환해주기
        	   let data = JSON.parse(e.data);
        	   for (let i = 0; i<data.length; i++){
        			if('${loginUser.userNo}'== data[i].sender){
        				
        				let msg = $("<div class='chat-request'>");
        				let img = $("<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-cat-2195875.png' width='50px' height='50px'>");
        				let msgContent = $("<div class='chat-bubble2'>");
        				
        				msgContent.append(data[i].msg);
        				msg.append(msgContent);
        				msg.append(img);
        				$(".chat-content").append(msg);
        				
        			} else{
        				
        				let msg = $("<div class='chat-response'>");
        				let img = $("<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-cat-2195875.png' width='50px' height='50px'>");
        				let msgContent = $("<div class='chat-bubble'>");
        				
        				msgContent.append(data[i].msg);
        				msg.append(img);
        				msg.append(msgContent);
        				$(".chatContent").append(msg);
        					
        			}
        		}
           }
           
           socket.onclose = function(e){
        	   console.log("접속해제");
           }
       }
       
       
       function sendMsg(){
    	   let msg = $("#msg-content").val();
    	   socket.send(msg);
    	   
    	   // 새로고침 되지 않게 비동기 식으로 메세지 저장 요청 보내기
           $.ajax({
           	url : '<%= contextPath %>/insertMessage',
           	type : 'get',
           	data : {bno : <%= b.getBoardNo() %>, buyer : ${loginUser.userNo}, msg : $("#msg-content").val()},
           	success : function(){
           		console.log("메세지 전송 ajax통신 성공");
           	},
           	error : function(){
           		console.log("메세지 전송 ajax통신 실패");
           	}
           });
    	   
           $("#msg-content").val("");
       }
    </script>
</body>
</html>