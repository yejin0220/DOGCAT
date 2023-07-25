<%@   page import="com.kh.member.model.vo.Member, com.kh.common.AEScryptor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<!-- Latest compiled and minified CSS -->
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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   
</head>
<style>

.Updateuser{
   display: flex;
   justify-content: center;
   margin-top: 50px;
}

.Updateuser>h1{
   font-weight: 900;
}

#board {
   margin-top: 20px;
}

.content {
   height: 40%;
   display: flex;
   flex-direction: column;
   align-items: center;
   margin: 50px 0px 0px 0px;
   /* margin-left: 120px; */
}

.content_2{
   width: 60%;
   height: 15rem;
   border: 0px solid black;
}

.myprofile_img {
   border: 0px solid black;
   height: 10rem;
   width: 30%;
   display: flex;
   flex-direction: column;
   align-items: center;
   border-top-left-radius: 30px;
   border-bottom-left-radius: 30px;
}

.img {
   width: 200px;
   height: 195px;
   border-radius: 50%;
   border:3px solid black;
   margin-left: 900px;
}

#profilechange, #rset {
   margin: 60px 0px 0px 30px;
}

button {
   border-radius: 10px;
   cursor: pointer;
}

button:hover {
   background-color: lightgray;
}

#div1, #div2, #div3, #div4, #div5, #div6 {
   border: 1px solid black;
   width: 350px;
   margin: 0px 0px 0px 115px; 
}
.userId{
	border:none;
	width: 40px;
}
#tt {
   background-color:  rgb(230, 242, 255);
}

#bb {
   background-color: white;
   width: 400px;
   padding-left: 30px;
}

#btn {
   border: 0px solid lightgray;
   width: 50px;
   height: 20px;
   border-radius: 5px;
   background-color: rgb(224, 224, 224);
   font-size: 10px;
}

#btn2 {
   border: 0px solid lightgray;
   width: 70px;
   height: 20px;
   border-radius: 5px;
   background-color: rgb(224, 224, 224);
   font-size: 5px;
   margin-top: 10px;
}

.table td, .table th {
    padding: .75rem;
    vertical-align: inherit;
    border-top: 1px solid #dee2e6;
}

.btn-div {
   display: flex;
   flex-direction: row;
   align-items: center;
   flex-wrap: wrap;
   justify-content: space-evenly;
   margin-left: 50px;
   margin-top: 50px;
   
}

#updatebtn, #backbtn, #deletebtn {
   height: 40px;
   padding: 5px 10px;
   border-radius: 15px;
   text-align: center;
   width: 120px;
   border: 3px solid #FFD133;
   color: #FFD133;
   margin-right: 30px;
}

.update {
   margin-right: 50px;
}

/*alert창*/
.alert {
   background-color: rgba(249, 219, 99, 0.4);
   padding: 20px;
   border: 1px solid black;
   width: 500px;
   margin: auto;
   margin-top: -300px;
   text-align: center;
   font-size: 20px;
   font-weight: bold;
   box-shadow: 5px 5px 5px grey;
   color: black;
   z-index:1;
   display:none;
}
.last-alert {
   background-color: rgba(249, 219, 99, 0.4);
   padding: 20px;
   border: 1px solid black;
   width: 500px;
   margin: auto;
   margin-top: -300px;
   text-align: center;
   font-size: 20px;
   font-weight: bold;
   box-shadow: 5px 5px 5px grey;
   color: black;
   position:relative;
   z-index:1;
   display:none;
}

/* 버튼 스타일 */
.alert-btn{
   margin-top: 5px; /* 버튼 간격 조정 */
   margin-right: 70px; /* 버튼 간격 조정 */
   margin-left: 70px;
   padding: 10px;
   border-radius: 10px;
   background-color: rgba(52, 152, 219, 0.84);
   color: black;
   font-size: 15px;
   border: none;
   cursor: pointer;
}

.alert-btn:hover {
   background-color: gray;
}

#profileImg {
   width: 80%;
    height: 80%;
    margin-left: 20px;
    margin-top: 20px;
}

#userIdlabel{
   margin-left:134px;
}

#userNicknamelabel{
	margin-left:145px;
}

#email{
	margin-left:20px;
}


</style>
<body>
<%@ include file="../common/menubar.jsp" %>
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
%>
  <div class="Updateuser">
     <h1 style="color: cornflowerblue; font-size: 60px;" onclick="">바꾸개냥?</h1>
     <img src="<%=contextPath %>/resources/돋보기.png" width="50px" height="50px">
</div>

<div class="content">

   <form action="<%= contextPath%>/userprofileupdate" method="post"
      enctype="multipart/form-data">

      <div class="content_2">
         <div class="myprofile_img">
            <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
            <div class="img">
               <%if(loginUser.getFileName() != null){ %>
               <img id="profileImg" src="<%=request.getContextPath() %>/<%=loginUser.getFileName() %>">
               <%}else{ %>
               <img id="profileImg" src="<%=request.getContextPath() %>/resources/profile_basic.png">
               <%} %>
            </div>
         </div>
      </div>
   </form>   
      <div class="content_3">
         <form action="<%=contextPath %>/updateuser.me" method="post">
            <div class="user">
               <div class="ID" id="ID">
                  <table class="table" border="2">
                     <tbody id="tt">
                        <tr>
                           <td align="center" width="345">ID</td>
                           <td id="bb" ><input type="text" name="userId" class="userId" value="<%=userId %>" readonly>
                           <label style="font-size: x-small;" id="userIdlabel">※ 아이디 변경 불가</label></td>
                        </tr>
                        <tr>
                           <input type="hidden" name="userName" value="<%= userName %>">
                           <td align="center">닉네임</td>
                           <td id="bb"><!--<input type="text" name="userNickname" value="--><%= userNickname %>
                           <label style="font-size: x-small;" id="userNicknamelabel">※ 닉네임 변경 불가</label></td>
                        </tr>
                        <tr>
                    <td align="center" style="vertical-align: inherit;">신규비밀번호</td>
                    <td id="bb">
                      <input type="password" name="userPwd" id="userPwd" required onkeyup="checkPassword()"><br>
                      <label style="font-size: x-small;">※ 비밀번호는 8~20자 영문 대소문자, 숫자, 특수문자 혼합해서 입력해 주시기 바랍니다.</label>
                      <p id="passwordError" style="color: red;"></p>
                    </td>
                  </tr>
                  <tr>
                    <td align="center">신규비밀번호 확인</td>
                    <td id="bb">
                      <input type="password" name="pw_check"id="pw_check" required><br>
                      <p id="passwordMatchError" style="color: red;"></p>
                    </td>
                  </tr>
                        <tr>
                           <td align="center">이메일</td>
                           <td id="bb"><!--<input type="text" name="email" value="--><%= email%>
                           <label style="font-size: x-small;" id="email">※ 이메일 변경 불가</label></td>
                        </tr>
                        <tr>
                           <td align="center" style="vertical-align: inherit;">주소</td>
                           <td id="bb">
                           	 <input type="text"  name="address" id="sample6_postcode" size="10" style="text-align: center;" autocomplete="off"> 
		                     <input type="button" name="address" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"> <br>
		                     <input type="text" name="address" id="sample6_address" size="40" autocomplete="off"> 
		                     <input type="text" name="address" id="sample6_extraAddress" size="20" autocomplete="off"> <br>
		                     <input type="text" name="address" id="sample6_detailAddress" size="40" autocomplete="off">
                           </td>
                        </tr>
                        <tr>
                           <td align="center">취미</td>
                           <td id="bb"><%=loginUser.getHobby() %></td>
                           <input type="hidden" name="pet" vlaue=<%=userPet %>>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
            <div class="btn-div">
               <button type="submit" class="update" id="updatebtn">수정하기</button>
               <button type="button" class="back" id="backbtn"><a href="<%=contextPath%>/Mypage.me" style= "text-decoration: none;">돌아가기</a></button>
            <button class="delete" id="deletebtn">회원탈퇴</button>
            </div>
         </form>
      </div> 
   </div>
   
  
   
    <!-- 알림창 -->
   <div class="alert">
      <p>회원탈퇴를 하시겠습니까?</p>
      <button class="deleteMemer alert-btn" >확인</button>
      <button type="button" class="cansleMember alert-btn" ><a href="<%=contextPath%>/updateuser.me" style= "text-decoration: none;">취소</a></button>
   </div>
   
   <!-- 최종알림창 -->
   <div class="last-alert">
      <p>회원탈퇴</p>
      <form action="<%=contextPath%>/deleteMem" method="post">
         <div class="alert-box">
            <span style="padding: 10px;" >비밀번호</span>
            <input type="password" name="userPwd" placeholder="비밀번호를 입력하세요." style="padding: 10px; width: 200px; margin-right: 50px;"></td><br>               
         </div>
         <label style="font-size: 10px; color: gray; margin-left: 10px;">※ 비밀번호 입력 후 탈퇴하기를 눌러주세요.</label><br><br>
         <button type="sumbit" class="alert-btn" id="submitBtn">확인</button>
         <button type ="reset" class="alert-btn" >취소</button>
      </form>
   </div>
   

   <%-- <%@ include file= "../common/footer.jsp" %> --%>
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script>
      //비밀번호 유효성 검사
   function checkPassword() {
     var passwordInput = document.getElementById("userPwd");
     var password = passwordInput.value;
     var passwordError = document.getElementById("passwordError");
     var passwordMatchError = document.getElementById("passwordMatchError");
     var submitBtn = document.getElementById("submitBtn");
     var passwordCheck = document.getElementById("pw_check").value;
   
     var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
   
     if (!passwordPattern.test(password)) {
       passwordError.innerHTML = "비밀번호는 8~20자 영문 대소문자, 숫자, 특수문자 혼합해서 입력해 주시기 바랍니다.";
       submitBtn.disabled = true; // 수정하기 버튼 비활성화
     } else {
       passwordError.innerHTML = "";
       if (password !== passwordCheck) {
         passwordMatchError.innerHTML = "비밀번호가 일치하지 않습니다.";
         submitBtn.disabled = true; // 수정하기 버튼 비활성화
       } else {
         passwordMatchError.innerHTML = "";
         submitBtn.disabled = false; // 수정하기 버튼 활성화
       }
     }
   }
         
   $(function(){
      //탈퇴 창 보이게
      $(".delete").click(function(){
         $(".alert").css("display","block");
      })
      //탈퇴 창 취소
      $(".cansle").click(function(){
         $(".alert").css("display","none");
      })
      
      //최종탈퇴로 넘어가기
      $(".deleteMemer").click(function(){
         $(".alert").css("display","none");
         $(".last-alert").css("display","block");
      })
   })
   
   //주소 가져오기  
   function sample6_execDaumPostcode() { // 다음 API 상세주소
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if (data.userSelectedType === 'R') {
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if (data.bname !== ''
                           && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName
                              : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                     }
                     // 조합된 참고항목을 해당 필드에 넣는다.
                     document.getElementById("sample6_extraAddress").value = extraAddr;

                  } else {
                     document.getElementById("sample6_extraAddress").value = '';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample6_postcode').value = data.zonecode;
                  document.getElementById("sample6_address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("sample6_detailAddress")
                        .focus();
               }
            }).open();
   }
   </script>
</body>
</html>