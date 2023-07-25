/**
 * 
 */
function getContextPath() {
	let hostIndex = location.href.indexOf(location.host) + location.host.length;
	let contextPath = location.href.substring(
		hostIndex,
		location.href.indexOf('/', hostIndex + 1)
	);
	console.log('getContextPath 불림');
	return contextPath;
}

function idCheck() { // 아이디 정규화&중복확인

	var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{4,12}$/); // 아이디

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

	const $userId = $("#enroll_form [id=userId]");  // 아이디 중복확인

	$.ajax({
		url: getContextPath()+"/idCheck.me",
		data: { userId: $userId.val() },
		success: function(result) {
			if (result == 'NNNNN') {
				alert("이미 존재하거나 회원탈퇴한 아이디입니다. 다른 아이디를 입력해 주시기 바랍니다.");
				$userId.focus();
				$userId.val("");
			} else {
				if ("...") {
					alert("아이디 중복 체크 확인했습니다.")
					$("#userName").focus();
				} else {
					$userId.val("");
					$userId.focus();
				}
			}
		},
		error: function() {
			alert("아이디 중복체크에 실패했습니다.");
		}
	});
}

function nickCheck() { // 닉네임 정규화&중복확인 

	var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/); // 닉네임

	// 닉네임 공백 검사
	if ($("#userNickname").val() == "") {
		alert("닉네임을 입력해 주시기 바랍니다.");
		$("#userNickname").focus();
		return false;
	}

	// 닉네임 유효성 검사
	if (!nickNameCheck.test($("#userNickname").val())) {
		alert("닉네임은 2~8자 이내로 입력해 주시기 바랍니다. (특수문자 불가)")
		$("#userNickname").val("");
		$("#userNickname").focus();
		return false;
	}

	const $userNickname = $("#enroll_form [id=userNickname]"); // 닉네임 중복확인

	$.ajax({
		url: getContextPath()+"/nickCheck.me",
		data: { userNickname: $userNickname.val() },
		success: function(result) {
			if (result == 'NNNNNN') {
				alert("현재 입력한 닉네임은 사용중입니다. 다른 닉네임을 입력해 주시기 바랍니다.");
				$userNickname.focus();
				$userNickname.val("");
			} else {
				if ("...") {
					alert("닉네임 중복 체크 확인했습니다.")
					$("#userPwd").focus();
				} else {
					$userNickname.val("");
					$userNickname.focus();
				}
			}
		},
		error: function() {
			alert("닉네임 중복체크에 실패했습니다.");
		}
	});
}

function mailCheck() { // 이메일 정규화&중복확인&전송

	var emailCheck = RegExp(/^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/); // 이메일 

	// 이메일 공백 확인
	if ($("#email").val() == "") {
		alert("이메일을 입력해 주시기 바랍니다.");
		$("#email").focus();
		return false;
	}

	// 이메일 유효성 검사
	if (!emailCheck.test($("#email").val())) {
		alert("이메일 형식에 맞게 입력해 주시기 바랍니다.")
		$("#email").val("");
		$("#email").focus();
		return false;
	}

	const $email = $("#enroll_form [id=email]"); // 이메일 중복확인

	$.ajax({
		url: getContextPath()+"/mailCheck1.me",
		data: { email: $email.val() },
		async: false,
		success: function(result) {
			if (result == 'NNNNNN') {
				alert("현재 입력한 이메일은 사용중입니다. 다른 이메일을 입력해 주시기 바랍니다.");
				$email.focus();
				$email.val("");
			} else {
				if (result == 'NNNNNY') { // 이메일 전송
					alert("이메일 중복 체크 확인했습니다.")

					const $userMail = $("#enroll_form [id=email]");
					const $hidden_key = $("#enroll_form [id=hidden_key]");

					$.ajax({
						url: getContextPath()+"/mailCheck.me",
						data: { userMail: $userMail.val() },
						method: "GET",
						success: function(result) {
							alert("해당 이메일을 전송했습니다.");
							$hidden_key.val(result);
							$("#enroll_form [id=email_key").focus();
						},
						error: function() {
							alert("메일을 다시한번 확인해 주시기 바랍니다.");
						}
					});
				} else {
					$email.val("");
				}
			}
		},
		error: function() {
			alert("이메일 중복체크에 실패했습니다.");
		}
	});
}

function mailKeyCheck() { // 이메일 정규화&인증

	// 이메일 키 공백 확인
	if ($("#email_key").val() == "") {
		alert("이메일 인증을 확인해 주시기 바랍니다.");
		$("#email_key").focus();
		return false;
	}

	const $email_key = $("#enroll_form [id=email_key]"); // 이메일 인증
	const $hidden_key = $("#enroll_form [id=hidden_key]");

	console.log($hidden_key.val());

	if ($email_key.val() === $hidden_key.val()) {
		alert("이메일 인증번호 확인했습니다.")
		$("#enroll_form :submit").removeAttr("disabled");
		$("#enroll_form :submit").css("background", "rgba(41, 128, 185, 0.46)");
		$("#phone").focus();
	}
	else {
		alert("이메일 인증번호를 다시 입력해 주시기 바랍니다.")
		$email_key.focus();
		$email_key.val("");
	}
}



function sample6_execDaumPostcode() { // 다음 API 상세주소
	new daum.Postcode(
		{
			oncomplete: function(data) {
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