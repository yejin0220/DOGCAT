<%@ page import="com.kh.member.model.vo.Member, java.util.ArrayList, com.kh.board.model.vo.Board, com.kh.chat.model.vo.Chatroom, 
      com.kh.save.model.vo.Save, com.kh.count.model.vo.Count, com.kh.reply.model.vo.Reply, com.kh.chat.model.vo.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
   ArrayList<Board> Mlist = (ArrayList<Board>)request.getAttribute("Mlist");      
   ArrayList<Chatroom> chatList = (ArrayList<Chatroom>)request.getAttribute("chatList");
   ArrayList<Save> slist = (ArrayList<Save>)request.getAttribute("slist");
   ArrayList<Reply> rlist = (ArrayList<Reply>)request.getAttribute("rlist");
   ArrayList<Message> mList = (ArrayList<Message>)request.getAttribute("mList");
   ArrayList<String>  recentMsgs =(ArrayList<String>)request.getAttribute("recentMsgs");
   Count count = (Count) request.getAttribute("count");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
   rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<style>
.mypage {
	margin-top: 50px;
	height: 15%;
}

.profile_img {
	width: 70px;
	border-radius: 70%;
	margin: 0 auto;
	overflow: hidden;
}

.img {
	width: 200px;
	height: 195px;
	border-radius: 50%;
	border: 3px solid black;
	margin-left: 900px;
	margin-top: -35px;
}

#profileImg {
	width: 145px;
	margin-left: 23px;
	margin-top: 20px;
}

.mypage>h1 {
	text-align: center;
	font-size: xx-large;
	font-family: 'Lilita One', cursive;
	height: 20%;
	margin-top: 20px;
	margin-right: 110px;
	margin-left: 100px;
}

.content {
	width: 100%;
	height: 60rem;
	border: 0px solid red;
	display: flex;
	align-items: center;
	flex-direction: column;
}

.content_2, .content_3, .content_5, #pf {
	width: 60%;
	height: 15rem;
	border: 0px solid black;
}

.content_4 {
	width: 61%;
	height: 20rem;
	border: 1px solid black;
	overflow: scroll;
	overflow-x: hidden;
}

.content4_category {
	display: flex;
}

.content_4::-webkit-scrollbar {
	width: 10px;
}

.content_4::-webkit-scrollbar-thumb {
	background: rgb(230, 242, 255);
	border-radius: 10px;
}

.container::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 12px;
	box-shadow: inset 0px 0px 5px white;
}

/*프로필 수정 & 버튼*/
.img {
	width: 200px;
	height: 195px;
	border-radius: 50%;
	border: 3px solid black;
	margin-left: 200px;
}

.myprofile {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	margin-left: 225px;
}

#file, #reset-file {
	display: none;
}

.btn-upload, .btn-reset {
	height: 40px;
	padding: 5px 10px;
	border-radius: 15px;
	text-align: center;
	width: 120px;
	border: 3px solid #FFD133;
	color: #FFD133;
	margin-right: 30px;
}

#reset-file {
	width: 80px;
}

#changebutton {
	width: 105px;
	height: 45px;
	font-size: small;
	border: 3px solid rgba(52, 152, 219, 0.52);
	border-radius: 15px;
	background: white;
}

.btn-reset {
	width: 120px;
	border: 3px solid gray;
	color: gray;
}

.content_2 {
	display: flex;
	align-items: center;
	flex-direction: column;
}

.content_3 {
	display: flex;
	align-items: center;
	justify-content: center;
}

#mymenu th {
	text-align: center;
	color: rgba(52, 152, 219, 0.52);
	width: 150px;
	font-size: 1.5rem;
	font-weight: 900;
}

#changebutton:hover {
	cursor: pointer;
}

.info {
	width: 100%;
	height: 8rem;
	border: 2px solid black;
	border-radius: 20px;
}

#table {
	margin: 0 auto;
	border-spacing: 15px;
	border-collapse: separate;
}

.matetitle{
  cursor: pointer;
}

/*숨겨진 내용*/
#btn1, #btn2, #btn3, #btn4, #btn5 {
	cursor: pointer;
	border-radius: 0px;
	border-color: lightgray;
	width: 14.6rem;
}

/*카테고리버튼*/

.content_category{ 
   display: flex;
   


#thead {
	position: sticky;
	top: 0;
	background-color: white;
	border: 0px solid black;
}

.category_swipper {
	width: 150px;
	margin: 0px;
	box-sizing: content-box;
}

.category_button {
	padding: 9px;
	background: rgb(226, 226, 226);
	border: 1.5px solid rgb(255, 255, 255);
	border-radius: 10px 10px 0px 0px;
	font-style: normal;
	font-weight: 900;
	font-size: 18px;
	line-height: 23px;
	text-align: center;
	color: rgb(102, 102, 102);
	white-space: nowrap;
	width: 300px;
	max-width: 100%;
}

.category_button:hover {
	background-color: rgb(83, 193, 243);
	color: white;
}
/*모달창*/
.container {
	display: flex;
	justify-content: space-evenly;
	align-items: flex-start;
	padding: 10px;
}

#mateCheck.modal-overlay {
	width: 100%;
	height: 1500px;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, modal255, 255, 0.18);
}

#mateCheck .modal-window {
	background: rgb(251, 246, 240);
	box-shadow: 0 8px 32px 0 rgba(133, 133, 134, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 500px;
	position: relative;
	top: 300px;
	padding: 10px;
}

.btn-area {
	text-align: center;
	padding-right: 25px;
}

.modal-th, .modal-td {
	padding: 10px 10px 10px 10px;
	border: 1px solid rgba(133, 133, 134, 0.37);
}

.modal-th {
	text-align: center;
}

.modal-td {
	font-size: 0.8rem;
}
</style>

</head>
<%@ include file="../common/menubar.jsp" %>
<div class="mypage">
   <h1 style="color: cornflowerblue; font-size: 60px;" onclick="">MyPage</h1>
</div>

<div class="content">
   <form action="<%=contextPath%>/userprofileupdate" method="post" enctype="multipart/form-data">
      <div class="content_2">
         <div class="myprofile_img">
            <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
            <div class="img">

               <%if(loginUser.getFileName()!= null){ %>
                <img id="profileImg" src="<%=request.getContextPath() %>/<%=loginUser.getFileName() %>">
               <%}else{ %>
               <img id="profileImg" src="<%=request.getContextPath() %>/resources/profile_basic.png">
               <%} %>
            </div>
            
            </div>
            <div class="myprofile">
               <input type="file" name="file" id="file" >
               <label for="file" class="btn-upload" >프로필 선택</label> 
               
               <input type="submit" name="reset-file" id="reset-file" onchange="" > 
               <label for="reset-file" class="btn-reset">변경하기</label>
            </div>
         </div>
      </form>
      <div class="content_3">
         <div class="info">
            <table id="table">
               <tr id="mymenu">
                  <th id="username" style="color: #FFD133;"><%= loginUser.getUserNickname()%>님</th>
                  <th id="board">게시글</th>
                  <th id="likelist">찜목록</th>
                  <th id="chatting">채팅</th>
                  <th id="walk mate" style="text-align: center; color: rgba(52, 152, 219, 0.52);">산책메이트</th>
               </tr>
               <tr>
                  <td><button type="button" id="changebutton" style="width: 150px;">
                  <a href="<%=contextPath%>/updateuser.me" style= "text-decoration: none;">회원정보 수정</a></button></td>
                  
                  <td style="text-align: center;"><%= count.getbCount()%></td>
                  <td style="text-align: center;"><%= count.getsCount()%></td>
                  <td style="text-align: center;"><%= count.getcCount()%></td>
                  <td style="text-align: center;"><%= count.getmCount()%></td>
               </tr>
            </table>
         </div>
      </div>
  
      <div class="content4_category">
         <div class="category_swiper">
            <button id="btn1" class="category_button">작성글</button>
         </div>
         <div class="category_swiper">
            <button id="btn2" class="category_button">채팅</button>
         </div>
         <div class="category_swiper">
            <button id="btn3" class="category_button">찜목록</button>
         </div>
         <div class="category_swiper">
            <button id="btn4" class="category_button">작성댓글</button>
         </div>
         <div class="category_swiper">
            <button id="btn5" class="category_button">산책메이트</button>
         </div>
      </div>
   <div class="content_4">
      <form id="free_main2" action="" method="post" class="category">
         <table>
            <thead id="thead">
               <tr align="center" id="see">
                  <th style="width: 120px;">글번호</th>
                  <th style="width: 600px;">제목</th>
                  <th style="width: 150px;">작성자</th>
                  <th style="width: 180px;">날짜</th>
                  <th style="width: 100px;">조회수</th>
               </tr>
            </thead>    
            <tbody id="tbody2">
               <%if(list != null){ %>
               <%for(Board b: list) { %>
               <tr align="center">
                  <td><%= b.getBoardNo() %></td>
                  <td><a href="#"><%= b.getBoardTitle() %></a></td>
                  <td><%= b.getBoardWriter() %></td>
                  <td><%= b.getCreateDate() %></td>
                  <td><%= b.getCount() %></td>
               </tr>
               <% } %>
               <%} else{ %>
               <tr align="center">
                  <td colspan="5">조회된 글이 없습니다.</td>
               </tr>
               <% } %>
            </tbody>
         </table>
      </form>
      <div class="content4_chatroom" style="display:none;">
         <form id="free_main3" action="" method="post">
            <table>
               <thead id="thead">
                  <tr align="center">
                     <th style="width: 120px;">채팅방 번호</th>
                     <th style="width: 600px;">최근 채팅</th>
                     <th style="width: 200px;">보낸사람</th>
                     <th style="width: 100px;">받는사람</th>
                     <th style="width: 250px;">날짜</th>
                  </tr>
               </thead>
               <tbody>
                  <%if(chatList != null){ %>
                  <%for(Chatroom c: chatList) { %>
                  <tr align="center">
                     <td><%= c.getChatroomNo()%></td>
                     <td><a href="#"><%=recentMsgs.get(chatList.indexOf(c))%></a></td>
                     <td><%= c.getBuyer() %></td>
                     <td><%= c.getSeller() %></td> 
                     <td><%= c.getCreateDate() %></td>
                  </tr>
                  <% } %>
                  <%} else{ %>
                  <tr align="center">
                     <td colspan="5">조회된 채팅이 없습니다.</td>
                  </tr>
                  <% } %>
               </tbody>
            </table>
         </form>
      </div>
      <div class="content4_save" style="display:none;">
         <form id="free_main4" action="" method="post">
            <table>
               <thead id="thead">
                  <tr align="center">
                     <th style="width: 120px;">게시글 번호</th>
                     <th style="width: 600px;">찜게시글 제목</th>
                     <th style="width: 200px;">회원번호</th>
                     <th style="width: 250px;">게시글 내용</th>
                     <!-- <th style="width: 100px;">조회수</th> -->
                  </tr>
               </thead>
               <tbody>
                  <%if(slist != null){ %>
                  <%for(Save s: slist) { %>
                  <tr align="center">
                     <td><%= s.getBoardNo()%></td>
                     <td><a href="#"><%= s.getBoardTitle() %></a></td>
                     <td><%= s.getUserNo() %></td>
                     <td><%= s.getBoardContent()%></td>
                     <%-- <td><%= b.getCount() %></td> --%>
                  </tr>
                  <% } %>
                  <%} else{ %>
                  <tr align="center">
                     <td colspan="5">조회된 찜목록이 없습니다.</td>
                  </tr>
                  <% } %>
               </tbody>
            </table>
         </form>
      </div>
      <div class="content4_reply" style="display:none;">
      <form id="free_main5" action="" method="post">
           <table>
            <thead id="thead">
                        <tr align="center">
                            <th style="width: 120px;">댓글번호</th>
                            <th style="width: 200px;">게시글 번호</th>
                            <th style="width: 180px;">회원번호</th>
                            <th style="width: 600px;">댓글내용</th>
                            <th style="width: 200px;">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                       <%if(rlist != null){ %>
                     <%for(Reply r: rlist) { %>
                     <tr align="center">
                     <td><%= r.getReply_No()%></td>
                     <td><%= r.getRef_Bno()%></td>
                     <td><%= r.getReply_Writer()%></td>
                     <td><a href="#"><%= r.getReply_Content()%></a></td>
                     <td><%= r.getCreate_Date()%></td>      
                  </tr>
                  <% } %>
                  <%} else{ %>
                  <tr align="center">
                     <td colspan="5">조회된 댓글이 없습니다.</td>
                  </tr>
                  <% } %>
                    </tbody>
                </table>
            </form>
          </div> 
          <div class="content4_mate" style="display:none;">
      <form id="free_main6" action="" method="post">
           <table class="mate_table">
            <thead id="thead">
               <tr align="center">
                   <th style="width: 200px;">게시글 번호</th>
                   <th style="width: 600px;">내용</th>
                   <th style="width: 180px;">작성자</th>
                   <th style="width: 180px;">날짜</th>
                   <th style="width: 180px;">신청자</th>
                   <th style="width: 200px;">수락여부</th>
               </tr>
            </thead>
            <tbody>
          		<c:choose>
          			<c:when test="${ empty Mlist }">
          				<tr>
          					<td colspan="6">조회된 메이트가 없습니다.</td>
          				</tr>
          			</c:when>
          			<c:otherwise>
          				<c:forEach var="m" items="${Mlist }">
							<tr>
								<td>${m.boardNo }</td>
								<td>${m.boardTitle }</td>
								<td>${m.boardWriter }</td>
								<td>${m.createDate }</td>
								<td>${m.mateuseNo }</td>
								<c:choose>
									<c:when test="${m.mateStatus eq 1}">
										<td>신청대기</td>	
									</c:when>
									<c:when test="${m.mateStatus eq 2}">
										<td>신청수락</td>	
									</c:when>
									<c:when test="${m.mateStatus eq 3}">
										<td>신청거절</td>	
									</c:when>
								</c:choose>
							</tr>          				
          				</c:forEach>
          			</c:otherwise>
          		</c:choose>
            </tbody>
          </table>
         </form>
       </div> 
     </div>

   </div>
      <%@ include file="../common/footer.jsp" %>

<script>
$('input[name="file"]').change(function(){
    setImageFromFile(this, '#profileImg');
});

function setImageFromFile(input, expression) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
    $(expression).attr('src', e.target.result);
  }
  reader.readAsDataURL(input.files[0]);
  }
}

const btn1 = document.getElementById('btn1');
const category = document.querySelector(".category");
const btn2 = document.getElementById('btn2');
const chat = document.querySelector(".content4_chatroom");
const btn3 = document.getElementById('btn3');
const save = document.querySelector(".content4_save");
const btn4 = document.getElementById('btn4');
const reply = document.querySelector(".content4_reply");
const btn5 = document.getElementById('btn5');
const mate = document.querySelector(".content4_mate");


function hideAllExcept(divToShow) {
 
  if (divToShow === category) {
    chat.style.display = 'none';
    save.style.display = 'none';
    reply.style.display = 'none';
    mate.style.display = 'none';
  } else if (divToShow === chat) {
    category.style.display = 'none';
    save.style.display = 'none';
    reply.style.display = 'none';
    mate.style.display = 'none';
  } else if (divToShow === save) {
    category.style.display = 'none';
    chat.style.display = 'none';
    reply.style.display = 'none';
    mate.style.display = 'none';
  } else if (divToShow === reply) {
    category.style.display = 'none';
    chat.style.display = 'none';
    save.style.display = 'none';
    mate.style.display = 'none';
  } else if (divToShow === mate) {
    category.style.display = 'none';
    chat.style.display = 'none';
    save.style.display = 'none';
    reply.style.display = 'none';
  }
}

btn1.addEventListener('click', function() {
  if (category.style.display === 'none') {
    category.style.display = 'block';
    hideAllExcept(category); 
  } else {
    category.style.display = 'none';
  }
});

// 채팅
btn2.addEventListener('click', function() {
  if(chat.style.display === 'none'){
    chat.style.display = 'block';
    hideAllExcept(chat); 
  } else {
    chat.style.display = 'none';
  }
});

// 찜목록
btn3.addEventListener('click', function() {
  if(save.style.display === 'none'){
    save.style.display = 'block';
    hideAllExcept(save); 
  } else {
    save.style.display = 'none';
  }
});

// 댓글
btn4.addEventListener('click', function() {
  if(reply.style.display === 'none'){
    reply.style.display = 'block';
    hideAllExcept(reply); 
  } else {
    reply.style.display = 'none';
  }
});

// 산책메이트
btn5.addEventListener('click', function() {
  if(mate.style.display === 'none'){
    mate.style.display = 'block';
    hideAllExcept(mate); 
  } else {
    mate.style.display = 'none';
  }
});

</script>

<script>
$(function(){
	$(".mate_table>tbody>tr").click(function(){
		console.log($(this).children().eq(0).text());
		console.log($(this).children().eq(4).text());
		$.ajax({
			url : "<%=request.getContextPath()%>/mateMember",
			type:"get",
			data : {
				userNo : $(this).children().eq(4).text(),
			    boardNo : $(this).children().eq(0).text()
			},
			success :function(result){
				$("#madal-name").val(result.userNickname);
				$("#madal-date").val(result.boardNo);
				if((result.status)==1){
				
				}else if((result.status)==2){
					$(".refusal").attr("disabled","disabled");
					$(".accept").attr("disabled","disabled");
				}else if((result.status)==3){
					$(".modal-apply").text("수락거절");
				}
				
			},
			error:function(){
				console.log("전송실패");
			}
		})
		
	})
})


	$(function(){
		$(".mate_table>tbody>tr>td").click(function(){
			$("#mateCheck").css("display","flex");
		});
		
		 $(".close").click(function(){
                $("#modal").css("display","none");
         });
	})
	
	 
</script>
<!-- 모달창 -->
 <div class="modal-overlay" id="modal mateCheck" style="display:none;">
        <div class="modal-window">
            <div class="modal-header">
                <h3 class="modal-title" style="font-weight: bold;">산책메이트 신청자 &nbsp;</h3>
                <img src="<%=request.getContextPath() %>/resources/요청 아이콘.png" width="30" height="30">
                <div type="button" class="close">X</div>
            </div>
            <hr>
            <div class="modal-content">
                <div class="container">
                    <div class="item">
                    	<form action="<%=request.getContextPath() %>/updateMate" method="post">
	                        <table class="profile_table">
	                            <tr class="modal-tr">
	                                <th class="modal-th">신청자 정보</th>
	                                <th class="modal-th">신청글 번호</th>
	                                <th class="modal-th">수락 여부</th>
	                             </tr>
	                            <tr class="modal-tr">
	                                <td class="modal-td madal-name"><input id="madal-name" type="text" name="userNickname" style="width:40px; border:none;"></td>
	                                <td class="modal-td madal-date"><input id="madal-date" type="text" name="boardNo" style="width:40px; border:none;"></td>
	                                <td class="modal-td">
	                                    <button class="btn btn-primary btn-sm accept" name="status" value="2" >요청수락</button>
	                                    <button class="btn btn-primary btn-sm refusal" name="status" value="3">요청거절</button>
	                                </td>
	                            </tr>
	                        </table>
                        </form>  
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>