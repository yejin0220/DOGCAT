<%@ page import="com.kh.member.model.vo.Member, java.util.ArrayList, com.kh.chat.model.vo.Chatroom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<Chatroom> chatList = (ArrayList<Chatroom>) request.getAttribute("chatList");
	Member loginUser = (Member) session.getAttribute("loginUser");
	ArrayList<String> recentMsgs = (ArrayList<String>)request.getAttribute("recentMsgs");
%>
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

.container {
	display: flex;
	justify-content: space-evenly;
	margin-top: 10px;
}

.master_member_title {
	width: 250px;
	font-weight: bold;
	text-align: left;
}

.member_table {
	width: 1200px;
	padding: 0px 10px 0px 10px;
	margin-top: 20px;
	border-top: 2px solid rgb(83, 193, 243);
}
/* 일대일채팅 모달 */
.chat-area {
	border-radius: 20px;
	border: 1px solid gray;
	width: 500px;
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.chat-title {
	background-color: white;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
}

.btn-close {
	border: none;
	background-color: white;
}

.btn-close:focus {
	outline: none;
}

.chat-content {
	background-color: rgb(251, 246, 240);
	height: 550px;
	overflow: hidden;
	text-overflow: ellipsis;
	overflow-y: scroll;
	border-radius: 10px;
	width: 100%;
}

.chat-response {
	width: 70%;
	display: flex;
	padding-top: 20px;
}

.chat-request {
	display: flex;
	padding-top: 20px;
	justify-content: right;
}

.chat-request>img {
	margin-left: 10px;
}

.chat-bubble {
	width: 100%;
	background-color: rgb(255, 218, 119);
	margin-left: 15px;
	padding: 5px;
	overflow-wrap: break-word;
	word-wrap: break-word;
}

.chat-bubble2 {
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

.chat-question>input {
	width: 100%;
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

.chat-question>button:focus {
	outline: none;
}
</style>

</head>
<body>

	
	<div id="wrap">
		<div class="header">
			<jsp:include page="adminMenubar.jsp" />
		</div>

		<main id="container">
			<div class="container">
				<div class="item mt-3" style="width: 1000px;">
					<h2 class="master_member_title">1:1문의</h2>
					<table class="member_table table table-hover">
						<thead>
							<tr>
								<th scope="col">문의자</th>
								<th scope="col">최근메시지</th>
								<th scope="col">문의날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty chatList }">
									<tr>
										<td colspan="3">현재 문의 내역이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="c" items="${chatList}" varStatus="status">
										<tr>
											<input type="hidden" value="${c.chatroomNo }">
											<c:choose>
												<c:when test="${c.seller eq loginUser.userNickname }">
													<td>${c.buyer }</td>
												</c:when>
												<c:otherwise>
													<td>${c.seller }</td>
												</c:otherwise>
											</c:choose>
											<td>${recentMsgs[status.index] }</td>
											<td>${c.createDate }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</main>
		
		<!-- 일대일 채팅 모달 -->
		<div class="chat-area">
			<div class="chat-title">
				<img
					src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/free-icon-chat-oval-speech-bubbles-symbol-55009.png"
					width="35px"> <span
					style="font-size: 29px; font-weight: bold;">1:1채팅</span>
				<button type="button" class="btn-close"
					style="float: right; margin-right: 20px; font-size: 25px;">X</button>
			</div>

			<div class="chat-content"></div>

			<div class="chat-question">
				<input type="text" id="msg-content" placeholder="메세지를 입력하세요">
				<button id="sendMsg">전송</button>
				<!-- onclick="sendMsg()" -->
			</div>
		</div>


		<script>
			let crNo;
			$(function(){
				$(".member_table>tbody>tr").click(function(){
					$(".chat-area").css("display", "block");
					crNo = $(this).children().eq(0).val();
					$.ajax({
						url:"<%=request.getContextPath()%>/ReadChatbot",
						type:"post",
						data:{crNo : crNo, reader : ${loginUser.userNo}},
						success: function(mList){
							console.log("메시지 읽어오기 성공");
							if(mList != null){
								let str = "";
								for(let i = 0; i<mList.length; i++){
									if(mList[i].sender != ${loginUser.userNo}){
										str += "<div class='chat-response'>"
                							+ "<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-dog-2396837.png' width='50px' height='50px'>"
                                			+ "<div class='chat-bubble'>"+mList[i].messageContent+"</div>"
                                		  +"</div>";
									} else {
										str += "<div class='chat-request'>"
	                            			+ "<div class='chat-bubble2'>"+mList[i].messageContent+"</div>"
	                            			+ "<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-cat-2195875.png' width='50px' height='50px'>"
	                            		  +"</div>";    
									}
								}
								$(".chat-content").html(str);
							}
						},
						error:function(){
							console.log("메시지 읽어오기 실패");
						}
					});
					
					websocket();
					
					$(".btn-close").click(function(){
						$(".chat-area").css("display", "none");
						socket.close();
					});
				});
			});
			
			let socket;
			
			function websocket(){
				socket = new WebSocket("ws://localhost:8081<%= request.getContextPath() %>/chattingServer");
				
				socket.onopen = function(e){
					console.log("접속성공")
				}
				
				socket.onmessage = function(e){
					let data = JSON.parse(e.data);
					for(let i = 0; i<data.length; i++){
						if('${loginUser.userNo}' == data[i].sender){
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
			
			$("#sendMsg").click(function(){
				let msg = $("#msg-content").val();
				socket.send(msg);
				
				console.log(crNo);
				
				$.ajax({
					url:'<%= request.getContextPath()%>/insertChatMessage',
					type:'post',
					data:{crNo : crNo, buyer:${loginUser.userNo}, msg : msg},
					success : function(){
						console.log("메시지 전송 ajax 통신 성공");
					},
					error: function(){
						console.log("메시지 전송 ajax 통신 실패");
					}
				});
				
				$("#msg-content").val("");
			});
			
		</script>


		<div class="footer">
			<jsp:include page="../common/footer.jsp" />
		</div>
	</div>
	
	

</body>
</html>