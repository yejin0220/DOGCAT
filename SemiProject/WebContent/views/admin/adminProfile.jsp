<%@ page import="com.kh.member.model.vo.Member, com.kh.pet.model.vo.Pet, com.kh.board.model.vo.Attachment, java.util.ArrayList"%>
<%@ page import="com.kh.common.AEScryptor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	String alertMsg = (String) session.getAttribute("alertMsg");
%>
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
<style>
	.footer {
		width: 100%;
		height: 100px;
		position: absolute;
		bottom: 0;
	}

	.container>form{
     	display: flex;
        justify-content: space-evenly;
        align-items: flex-start;
        padding: 10px;
        width: 1000px;
    }
    #file {
        display: none;
    }
    .btn-upload {
        width: 100px;
        height: 30px;
        background: rgb(211, 207, 207); 
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 12px;
        border-radius: 10px;
       
    }
    .profile{
        text-align: center;
    }
    th, td{
        padding-top: 0px;
        padding-bottom: 20px;
        padding-right: 50px;
    }
    .profile_img{
        width: 80px;
        height: 80px;
        border-radius: 70%;
        margin: 0 auto;
        overflow: hidden;
    }
    #profile_img{
    	width: 100%;
    	height: 100%;
   		object-fit: cover;
   		margin: 0 auto;
    }
    .master_update{
        border: solid 1px gray;
        margin: 0 auto;
        width: 750px;
        padding: 5px 30px 5px 30px;
    }
    h2{
       width: 260px;
       font-weight: bold;
    }
    .btn-area{
        text-align: center;
    }
    #admin_profile_title{
    	font-weight: bold;
    }
   	.check-danger{
		color:#721c24;
	}
	.check-success{
		color:#155724;
	}
</style>
</head>
<body>

<%@ include file= "adminMenubar.jsp" %>

<%
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		String userNickname = loginUser.getUserNickname();
		String userPwd = loginUser.getUserPwd();
		String phone = loginUser.getPhone();
		String email = loginUser.getEmail();
		email = AEScryptor.decrypt(email);
		String address = loginUser.getAddress();
		int userNo =  loginUser.getUserNo();
		String userPet = loginUser.getPet();
		String fileName = loginUser.getFileName();
		System.out.println("email============="+email);
%>

	<div class="container">
		<form action="<%=contextPath %>/adminProfile" method="post" enctype="multipart/form-data">
	        <div class="item profile">
	        	<div class="master_profile_img" >
		            <input type="hidden" name="userNo" value="<%= userNo %>">
		            <input type="hidden" name="fileName" value="<%= fileName %>">
		            <input type="hidden" name="userPet" value="<%= userPet %>">
		            <div class="profile_img" style="background-color: gray;">
		            	<%if(fileName != null) { %>
			            	<img name="fileName" id="profile_img" src="<%= request.getContextPath() %>/<%= fileName %>">
		            	<% } else {  %>
		            		<img name="fileName" id="profile_img" src="resources/profile_basic.png">
		            	<% } %>
		            </div>
		            <div style="font-weight: bold;">관리자님</div>
		            <div>
		                <input type="file" name="file" id="file" onchange="loadImg(this)">
		                <label for="file"  class="btn-upload">이미지 변경</label>
		            </div>
	        	</div>
	        </div>
	        <div class="item">
	            <div class="master_update" >
	                <h2 id="admin_profile_title">관리자님의 프로필</h2>
	                <br>
	    	
	                <table class="profile_table">
	                    <tr>
	                        <td>이름</td>
	                        <td><input type="text" name="userName" value="<%= userName %>"></td>
	                    </tr>
	                    <tr>
	                        <td>닉네임</td>
	                        <td><input type="text" name="userNickname" value="<%= userNickname %>"></td>
	                    </tr>
	                    <tr>
	                        <td>아이디</td>
	                        <td><input type="text" name="userId" value="<%= userId %>" readonly></td>
	                    </tr>
	                     <tr style="display:none;">
	                        <td>현재 비밀번호</td>
	                        <td><input class="pwd" type="password" id="originPwd" name="originPwd" value="<%= userPwd %>"></td>
	                    </tr>
	                    <tr>
	                        <td>신규 비밀번호</td>
	                        <td><input class="pwd" type="password" id="newPwd" name="newPwd"></td>
	                    </tr>
	                    <tr>
	                        <td>비밀번호 확인</td>
	                        <td><input  class="pwd" type="password" id="checkPwd"></td>
	                        <td class="check check-danger" id="check-danger">비밀번호가 일치하지 않습니다.</td>
							<td class="check check-success" id="check-success">비밀번호가 일치합니다.</td>
	                    </tr>
	                    <tr>
	                        <td>이메일</td>
	                        <td><input type="email" name="email" value="<%= email == null ? "" : email %>"></td>
	                    </tr>
	                    <tr>
	                        <td>주소</td>
	                       	<td><input type="text" name="address" value="<%= address == null ? "" : address %>"></td>
	                    </tr>
	                </table>
	                <br>
	                <div class="btn-area">
	                    <button type="submit" class="btn btn-primary" id="update_profile">수정하기</button>
	                    <button type="reset" class="btn btn-secondary">취소하기</button>
	                </div>
	                <br>
	            </div>
	        </div>
		</form>
    </div>
    
    <script>
		$(function(){
			$("#check-danger").hide();
			$("#check-success").hide();
	
			$(".pwd").keyup(function(){
				var newPwd = $("#newPwd").val();
				var checkPwd = $("#checkPwd").val();
	
				if(newPwd != "" || checkPwd != ""){
					if(newPwd == checkPwd){
						$("#check-success").show();
						$("#check-danger").hide();
						$("#update_profile").removeAttr("disabled");
					}else{
						$("#check-success").hide();
						$("#check-danger").show();
						$("#update_profile").attr("disabled", "disabled");
					}
				}
			});
		});
    
    	$(function(){
    		let pet = "<%= userPet == null ? "none" : userPet%>";

    		$("input[name='pet']").each(function(){
    			
    			if(pet.search($(this).val()) >= 0 ){
    				$(this).attr("checked", true);
    			}
    		})
    		
    	});	
    
    	function loadImg(input){
    		
    		if(input.files && input.files[0]){
	    		var reader = new FileReader();
	    		reader.onload = function(e){
	    			document.getElementById('profile_img').src = e.target.result;
	    		};
	    		reader.readAsDataURL(input.files[0]);
	    	} else {
	    		document.getElementById('profile_img').src="resources/chatbot.png";
	    	}
    		
    	}
    </script>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>