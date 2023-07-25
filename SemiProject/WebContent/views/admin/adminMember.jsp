<%@ page import="com.kh.member.model.vo.Member, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
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

.modal_container {
	background-color: rgb(251, 246, 240);
	display: flex;
	justify-content: space-evenly;
	align-items: flex-start;
	padding: 10px;
}

.modal_profile {
	text-align: center;
}

.modal_profile_img {
	width: 60px;
	height: 60px;
	border-radius: 100%;
	margin: 0 auto;
	overflow: hidden;
}

#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background: rgb(251, 246, 240);
	box-shadow: 0 8px 32px 0 rgba(133, 133, 134, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 500px;
	height: 350px;
	position: relative;
	top: -100px;
	padding: 10px;
}

.modal_btn-area {
	text-align: center;
	padding-right: 25px;
}

.profile_table input {
	width: 150px;
	margin-left: 50px;
}

#modal_profile_img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	margin: 0 auto;
}

.member_table>tbody>tr:hover {
	cursor: pointer;
}

.close:hover {
	cursor: pointer;
}
</style>
</head>
<body>
    
    <div id="wrap">
        <div class="header" >
            <jsp:include page="adminMenubar.jsp"/>
        </div>

        <main id="container">
            <div class="container">
                <div class="item mt-3" style="width:1000px;">
                    <h2 class="master_member_title">회원관리</h2>
                    <table class="member_table table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">아이디</th>
                                <th scope="col">이름</th>
                                <th scope="col">닉네임</th>
                                <th scope="col">가입날짜</th>
                                <th scope="col">회원상태</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:choose>
                        		<c:when test="${ empty list }">
                        			<tr>
                            			<td scope="row" colspan="5">조회된 리스트가 없습니다.</td>
                            		</tr>
                        		</c:when>
                        		<c:otherwise>
                        			<c:forEach var="m" items="${ requestScope.list }" varStatus="status">
	                        			<tr>
	                            			<td scope="row">${ m.userId }</td>
	                            			<td>${ m.userName }</td>
	                            			<td>${ m.userNickname }</td>
	                            			<td>${ m.enrollDate }</td>
	                            			<c:choose>
	                            				<c:when test="${m.status eq 1}">
	                            					<td>가입</td>
	                            				</c:when>
	                            				<c:when test="${m.status eq 2}">
	                            					<td>탈퇴</td>
	                            				</c:when>
	                            				<c:when test="${m.status eq 3}">
	                            					<td>대기</td>
	                            				</c:when>
	                            				<c:when test="${m.status eq 4}">
	                            					<td>거절</td>
	                            				</c:when>
	                            			</c:choose>
	                            		</tr>
                        			</c:forEach>
                        		</c:otherwise>
                        	</c:choose>
                        </tbody>
                    </table>
                </div>
            </div>

        </main>

        <div class="footer">
          <jsp:include page="../common/footer.jsp"/>
        </div>
        
        <script>
	        $(function(){
	        	$(".member_table>tbody>tr").click(function(){
	        		$.ajax({
	        			url:"<%= request.getContextPath()%>/mlist",
	        			type:'get',
	        			data:{userId : $(this).children().eq(0).text()},
	        			success: (result) => {
	        				if(result.fileName != null){
	        					$("#modal_profile_img").attr('src',"<%= request.getContextPath() %>/"+result.fileName);
	        				}else{
	        					$("#modal_profile_img").attr('src',"https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%9D%B4%EC%9C%A0%EC%A7%84/profile_basic.png");
	        				}
	        				$("#listUserName").val(result.userName);
	        				if((result.status) == 1){
	        					$("#listUserStatus").val("가입");
	        					$("#approveBtn").attr("disabled","disabled");
	        					$("#refuseBtn").attr("disabled","disabled");
	        					$("#quitBtn").removeAttr("disabled","disabled");
	        				}else if((result.status) == 2){
	        					$("#listUserStatus").val("탈퇴");
	        					$("#quitBtn").attr("disabled","disabled");
	        					$("#approveBtn").attr("disabled","disabled");
	        					$("#refuseBtn").attr("disabled","disabled");
	        				}else if((result.status) == 3){
	        					$("#listUserStatus").val("대기");
	        					$("#quitBtn").attr("disabled","disabled");
	        					$("#approveBtn").removeAttr("disabled","disabled");
	        					$("#refuseBtn").removeAttr("disabled","disabled");
	        				}else if((result.status) == 4){
	        					$("#listUserStatus").val("거절");
	        				}
	        				$("#listUserId").val(result.userId);
	        				$("#listAddress").val(result.address);
	        				if((result.pet) == "dog" ){
	        					$("#listUserPet").val("강아지");
	        				}else if((result.pet) == "cat"){
	        					$("#listUserPet").val("고양이");
	        				}else if((result.pet) == "etc"){
	        					$("#listUserPet").val("기타");
	        				}else{
	        					$("#listUserPet").val("없음");
	        				}
	        			},
	        			error:function(){
	        				console.log('통신실패');
	        			}
	        			
	        		})
	        	});
	        });
        </script>
        
        <!-- Modal -->
        <div class="modal-overlay" id="modal">
            <div class="modal-window">
                <div class="modal-header">
                    <h3 class="modal-title" style="font-weight: bold;">회원관리 상세</h3>
                    <div class="close">X</div>
                </div>
                <div class="modal-content">
                    <div class="modal_container">
                        <div class="item modal_profile">
                            <div class="modal_profile_img" style="background-color: gray;">
                            	<img id="modal_profile_img" src="">
                            </div>
                        </div>
                        <div class="item">
	                        <form class="member_info" action="<%= request.getContextPath() %>/update.am" method="post">
		                        <table class="profile_table">
		                            <tr>
		                                <td>이름</td>
		                                <td><input id="listUserName" type="text" name="userName" value="" readonly></td>
		                            </tr>
		                            <tr>
		                                <td>가입승인</td>
		                                <td><input id="listUserStatus" type="text" name="userStatus" value="" readonly></td>
		                            </tr>
		                            <tr>
		                                <td>아이디</td>
		                                <td><input id="listUserId" type="text" name="userId" value="" readonly></td>
		                            </tr>
		                            <tr>
		                                <td>주소</td>
		                                <td><input id="listAddress" type="text" name="address" value="" readonly></td>
		                            </tr>
		                            <tr>
		                                <td>반려동물</td>
		                                <td><input id="listUserPet" type="text" name="pet" value="" readonly></td>
		
		                            </tr>
		                        </table>
		                        <br>
		                        <div class="modal_btn-area">
		                            <button type="submit" name ="status" value="2" class="btn btn-primary btn-sm" id="quitBtn">회원탈퇴</button>
		                            <button type="submit" name ="status" value="1" class="btn btn-primary btn-sm" id="approveBtn">가입승인</button>
		                            <button type="submit" name ="status" value="4" class="btn btn-primary btn-sm" id="refuseBtn">가입거절</button>
		                        </div>
	                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    
        <script>
            
            $(function(){
                $(".member_table>tbody>tr").click(function(){
                    $("#modal").css("display","flex");
                });
            });
            
            $(function(){
                $(".close").click(function(){
                    $("#modal").css("display","none");
                });
            });

        </script>


    </div>
</body>

</html>