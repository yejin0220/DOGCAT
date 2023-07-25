<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file= "../common/menubar.jsp" %>
<link href="<%= contextPath %>/resources/css/member/enroll.css" rel="stylesheet" type="text/css">
<script src="<%= contextPath %>/resources/js/member/enroll.js"></script>
<script src="<%= contextPath %>/resources/js/member/link.js"></script>
<script src="<%= contextPath %>/resources/js/member/regex.js"></script>
<title>회원가입</title>
</head>
<body>
	<article id="enroll_sub">
		<div class="enroll_sub_in">
			<section id="enroll_content" class="enroll_cb" style="margin-top: 15px;">
				<div class="enroll_sub_left " style="max-width: 100% !important">
					<div class="enroll_sub_top2">
						<!--서브타이틀, 공지사항, 탭-->
						<div class="enroll_tit">
							<h2 class="enroll_sub_tit1">회원가입</h2>
						</div>
					</div>
					<form id="enroll_form" action="<%=contextPath%>/insert.me"
						method="post">
						<div class="enroll_sub_contents enroll_cb" style="margin: 10;">
							<div class="enroll_wrap enroll_cb">
								<table class="enroll_main">
									<colgroup></colgroup>
									<tbody>
										<tr>
											<th>아이디</th>
											<td>
											<input type="text" name="userId" id="userId" autocomplete="off" maxlength ="12" required> 
											<input type="button" name="userId" value="중복확인" onclick="idCheck(); ">
											<span>※ 아이디는 4~12자, 영문대소문자, 숫자만 입력해 주셔야 바랍니다.</span>
											</td>
										</tr>
										<tr>
											<th>이름</th>
											<td>
											<input type="text" name="userName" id="userName" autocomplete="off" maxlength ="4" required> 
											<span>※ 이름은 2~4자, 한글만 입력해 주셔야 바랍니다.</span>
											</td>
										</tr>
										<tr>
											<th>닉네임</th>
											<td><input type="text" name="userNickname" id="userNickname" autocomplete="off" maxlength ="10" required>
											<input type="button" name="userNickname" value="중복확인" onclick="nickCheck();"> 
											<span> ※ 닉네임은 2~10자 이내로 입력해 주셔야 합니다. (특수문자 불가)<br> ※ 닉네임은 변경이 불가하니 신중하게 입력해 주시기 바랍니다.<br></span>
											</td>
										</tr>
										<tr>
											<th>비밀번호</th>
											<td>
											<input type="password" name="userPwd" id="userPwd" autocomplete="off" maxlength ="20" required>
											<span>※ 비밀번호는 8~20자 영문 대소문자, 숫자, 특수문자 혼합해서 입력해 주시기 바랍니다.</span>
											</td>
										</tr>
										<tr>
											<th>비밀번호 확인</th>
											<td>
											<input type="password" name="pw_check" id="pw_check" autocomplete="off" maxlength ="20" required>
											</td>
										</tr>
										<tr>
											<th>이메일 중복확인 및<br>인증번호 발송
											</th>
											<td>
											<input type="email" name="email" id="email" size="20" autocomplete="off">
											<input type="button" name="email" id="address_btn" value="인증번호 발송" onclick="mailCheck();" required> 
											<span> 
											※ 메일 주소는 변경이 불가하며, 아이디/비번찾기 등에 사용됩니다.<br>
											※ 최대 5분 정도 소요됩니다. 메일이 오지 않을 경우 스팸메일함을 확인해 주시기 바랍니다.
											</span>
											</td>
										</tr>
										<tr>
											<th>이메일 인증 키</th>
											<td>
											<input type="hidden" name="hidden_key" id="hidden_key" value="">
											<input type="text" name="email_key" id="email_key" autocomplete="off" maxlength ="6" required> 
											<input type="button" name="email_key" id="email_key_btn" onclick="mailKeyCheck();" value="확인" autocomplete="off">
											</td>
										</tr>
										<tr>
											<th>핸드폰</th>
											<td>
											<input type="text" name="phone" id="phone" autocomplete="off" maxlength ="11" required>
											<span>※ '-' 를 제외하고 입력해 주시기 바랍니다.</span>
											</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>
											<input type="text"  name="address" id="sample6_postcode" size="10" style="text-align: center;" autocomplete="off"> 
											<input type="button" name="address" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"> <br>
											<input type="text" name="address" id="sample6_address" size="40" autocomplete="off"> 
											<input type="text" name="address" id="sample6_extraAddress" size="20" autocomplete="off"> <br>
											<input type="text" name="address" id="sample6_detailAddress" size="40" autocomplete="off">
											</td>
										</tr>
										<tr>
											<th>반려동물</th>
											<td>
											<select name="species">
												<option value="dog">강아지
												<option value="cat">고양이
												<option value="bird">조류
												<option value="reptile">파충류
												<option value="amphibia">양서류
												<option value="pisces">어류
											</select> <br> 
											<select name="gender">
												<option value="am">남
												<option value="af">여
											</select> <br> 
											<input type="text" name="petName" id="petName" required>
											<span>※ 이름음 입력해 주시기 바랍니다.</span>
											</td>
										</tr>
										<tr>
											<th>취미</th>
											<td><input type="text" name="hobby" autocomplete="off"> 
											<span>※ 없을시 공백으로 남겨 주시기 바랍니다.</span></td>
										</tr>
									</tbody>
								</table>

								<div class="enroll_btn">
									<button type="submit" onclick="return checks();" disabled>회원가입</button>
									<button type="button" onclick="hrefLink();"style="margin-left: 20px; background-color: #bbb">취소</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>
	</article>
	<%@ include file= "../common/footer.jsp" %>
</body>

</html>