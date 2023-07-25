<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.footer {
	width: 100%;
	height: 100px;
	position: absolute;
	bottom: 0;
}

     body{
         justify-content: center;
     }
     .container {
             margin: auto;
             padding: 10px;
             width: 900px;
        }

     .master_title {
         border-bottom: #FFD133 solid;
         width: 250px;
         font-weight: bold;
         text-align: center;
     }

     .chat-list {
         width: 100%;
     }

     .chat-list tr, .chat-list td, .chat-list th{
         text-align: center;
         border: 1px solid gray;

     }
     .chat-list>tbody>tr:hover{
         cursor:pointer;
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
	<%@ include file="../common/menubar.jsp" %>

    <div class="container">
            <h2 class="master_title">채팅 목록</h2>
            
            <table class="chat-list">
                <thead>
                    <tr style="background-color: rgb(190, 187, 187);">
                        <th width="150px" height="35px">대화상대</th>
                        <th width="500px">최근 메세지</th>
                        <th width="150px">생성 일자</th>
                    </tr>
                </thead>
                <tbody id="chat-list-table">
                	<c:choose>
		            	<c:when test="${empty chatList }">
		            		<tr>
		            			<td colspan=3>조회된 채팅방이 없습니다.</td>
		            		</tr>
		            	</c:when>
	            		<c:otherwise>
	            			<c:forEach var="c" items="${chatList }" varStatus="status">
		            			<tr>
		            				<input type="hidden" value="${c.chatroomNo }">
		            				<c:choose>
		            					<c:when test="${c.seller eq loginUser.userNickname}">
		            						<td>${c.buyer }</td>
		            					</c:when>
		            					<c:otherwise>
		            						<td>${c.seller }</td>
		            					</c:otherwise>
		            				</c:choose>
		            				<td>${recentMsgs[status.index]} </td>
		            				<td>${c.createDate } </td>
		            			</tr>
	            			</c:forEach>
	            		</c:otherwise>
	            	</c:choose>
                </tbody>
            </table>
        </div>
    </div>
    
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
            <button id="sendMsg" >전송</button> <!-- onclick="sendMsg()" -->
        </div>
    </div>
    
    <script>
    	
    	let crNo;
    	$(function(){
    		$("#chat-list-table>tr").click(function(){
    			$(".chat-area").css("display","block");
            	crNo = $(this).children().eq(0).val();
            	
            	// 새로고침 되지 않게 비동기 식으로 채팅내역 불러오기
                $.ajax({
                	url : '<%= contextPath %>/readMessage',
                	type : 'post',
                	data : {crNo : crNo, reader : ${loginUser.userNo}},
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
            	
            	$.ajax({
            		url : '<%= contextPath %>/checkMessage',
            		type : 'get',
            		data : {crNo : crNo, reader : ${loginUser.userNo}},
            		success : function(){
            			console.log("메세지 체크 완료");
            		}
            	});
            	
             	websocket();
             	
             	$(".btn-close").click(function(){
                    $(".chat-area").css("display","none");
                    socket.close();
                });
            	
            });
    		
    		 
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
         				$(".chat-content").append(msg);
         					
         			}
         		}
            }
            socket.onclose = function(e){
         	   console.log("접속해제");
            }
    	}
    	
    	$("#sendMsg").click(function(){
     		let msg = $("#msg-content").val();
      	   socket.send(msg);
      	   
      	   console.log(crNo);
      	   
      	   // 새로고침 되지 않게 비동기 식으로 메세지 저장 요청 보내기
             $.ajax({
             	url : '<%= contextPath %>/insertMessage',
             	type : 'post',
             	data : {crNo : crNo, buyer : ${loginUser.userNo}, msg : msg},
             	success : function(){
             		console.log("메세지 전송 ajax통신 성공");
             	},
             	error : function(){
             		console.log("메세지 전송 ajax통신 실패");
             	}
             });
      	   
             $("#msg-content").val("");
     	});
        
    </script>
    
    <%@ include file="../common/footer.jsp" %>
</body>
</html>