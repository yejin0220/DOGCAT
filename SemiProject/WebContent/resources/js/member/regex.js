/**
 * 
 */
function checks() { // 정규화
	var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{4,12}$/); // 아이디
	var userNameCheck = RegExp(/^[가-힣]{2,4}$/); // 이름
	var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/); // 닉네임
	var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
	var emailCheck = RegExp(/^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/); // 이메일
	var phonNumberCheck = RegExp(/^01[0179][0-9]{7,8}$/); // 폰번호

	// 아이디 공백 확인
	if ($("#userId").val() == "") {
		alert("아이디를 입력해 주시기 바랍니다.");
		$("#userId").focus();
		return false;
	}

	// 아이디 유효성검사
	if (!userIdCheck.test($("#userId").val())) {
		alert("아이디는 4~12자, 영문 대소문자, 숫자만 입력해 주시기 바랍니다.");
		$("#userId").val("");
		$("#userId").focus();
		return false;
	}

	// 이름 공백 확인
	if ($("#userName").val() == "") {
		alert("아이디를 입력해 주시기 바랍니다.");
		$("#userName").focus();
		return false;
	}

	// 이름 유효성검사
	if (!userNameCheck.test($("#userName").val())) {
		alert("이름은 2~4자, 한글만 입력해 주시기 바랍니다.");
		$("#userName").val("");
		$("#userName").focus();
		return false;
	}

	// 닉네임 공백 검사
	if ($("#userNickname").val() == "") {
		alert("닉네임을 주시기 바랍니다.");
		$("#register_nick").focus();
		return false;
	}

	// 닉네임 유효성 검사
	if (!nickNameCheck.test($("#userNickname").val())) {
		alert("닉네임은 2~8자 이내로 입력해 주시기 바랍니다. (특수문자 불가)")
		$("#userNickname").val("");
		$("#userNickname").focus();
		return false;
	}

	// 비밀번호 공백 확인
	if ($("#userPwd").val() == "") {
		alert("비밀번호를 입력해 주시기 바랍니다.");
		$("#userPwd").focus();
		return false;
	}

	// 비밀번호 유효성검사
	if (!passwdCheck.test($("#userPwd").val())) {
		alert("비밀번호는 8~20자 영문 대소문자, 숫자, 특수문자 혼합해서 입력해 주시기 바랍니다.");
		$("#userPwd").val("");
		$("#userPwd").focus();
		return false;
	}

	// 비밀번호 확인란 공백 확인
	if ($("#pw_check").val() == "") {
		alert("비밀번호를 다시 입력해 주시기 바랍니다.");
		$("#pw_check").focus();
		return false;
	}

	// 비밀번호 확인
	if ($("#userPwd").val() != $("#pw_check").val()) {
		alert("비밀번호가 다릅니다. 다시 입력해 주시기 바랍니다.");
		$("#userPwd").val("");
		$("#pw_check").val("");
		$("#userPwd").focus();
		return false;
	}

	// 이메일 공백 확인
	if ($("#email").val() == "") {
		alert("이메일을 입력해 주시기 바랍니다.");
		$("#email").focus();
		return false;
	}

	// 이메일 키 공백 확인
	if ($("#email_key").val() == "") {
		alert("이메일 인증을 확인해 주시기 바랍니다.");
		$("#email_key").focus();
		return false;
	}

	// 이메일 유효성 검사
	if (!emailCheck.test($("#email").val())) {
		alert("이메일 형식에 맞게 입력해 주시기 바랍니다.")
		$("#email").val("");
		$("#email").focus();
		return false;
	}

	// 폰번호 공백 확인
	if ($("#phone").val() == "") {
		alert("핸드폰 번호를 입력해 주시기 바랍니다.");
		$("#phone").focus();
		return false;
	}

	// 폰번호 유효성 검사
	if (!phonNumberCheck.test($("#phone").val())) {
		alert("핸드폰 번호를 형식에 맞게 입력해 주시기 바랍니다.")
		$("#phone").val("");
		$("#phone").focus();
		return false;
	}

	// 주소 공백 확인
	if ($("#sample6_detailAddress").val() == "") {
		alert("상세주소를 입력해 주시기 바랍니다.");
		$("#sample6_detailAddress").focus();
		return false;
	}

	// 반려동물이름 공백 확인
	if ($("#petName").val() == "") {
		alert("반려동물 이름을 입력해 주시기 바랍니다.");
		$("#petName").focus();
		return false;
	}

}

function idchecks() {
	var userNameCheck = RegExp(/^[가-힣]{2,4}$/); // 이름
	var emailCheck = RegExp(/^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/); // 이메일

	// 이름 공백 확인
	if ($("#userName").val() == "") {
		alert("이름를 입력해 주시기 바랍니다.");
		$("#userName").focus();
		return false;
	}

	// 이름 유효성검사
	if (!userNameCheck.test($("#userName").val())) {
		alert("이름이 일치하지 않습니다.");
		$("#userName").val("");
		$("#userName").focus();
		return false;
	}

	// 이메일 공백 확인
	if ($("#email").val() == "") {
		alert("이메일을 입력해 주시기 바랍니다.");
		$("#email").focus();
		return false;
	}

	// 이메일 유효성 검사
	if (!emailCheck.test($("#email").val())) {
		alert("이메일이 일치하지 않습니다.")
		$("#email").val("");
		$("#email").focus();
		return false;
	}
}

function pwdchecks() {
	var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{4,12}$/); // 아이디
	var userNameCheck = RegExp(/^[가-힣]{2,4}$/); // 이름

	// 아이디 공백 확인
	if ($("#userId").val() == "") {
		alert("아이디를 입력해 주시기 바랍니다.");
		$("#userId").focus();
		return false;
	}

	// 아이디 유효성검사
	if (!userIdCheck.test($("#userId").val())) {
		alert("아이디가 일치하지 않습니다.");
		$("#userId").val("");
		$("#userId").focus();
		return false;
	}

	// 이름 공백 확인
	if ($("#userName").val() == "") {
		alert("이름를 입력해 주시기 바랍니다.");
		$("#userName").focus();
		return false;
	}

	// 이름 유효성검사
	if (!userNameCheck.test($("#userName").val())) {
		alert("이름이 일치하지 않습니다.");
		$("#userName").val("");
		$("#userName").focus();
		return false;
	}

}

