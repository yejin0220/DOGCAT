<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.terms_wrap {
	padding-top: 3em;
}

.page_tit {
	color: #212001;
	text-align: center;
	margin-bottom: 1em;
	font-weight: bold;
}

.tab_cont_wrap {
	width: 100%;
	background-color: #f5f5f5;
	margin: 0 auto;
}

.tab_cont_inner {
	text-align: center;
	padding: 2.66em;
	background-color: #fff;
}

.tab_cont_tit {
	margin-bottom: 0.5em;
	font-weight: normal;
	color: #666;
	line-height: 1.6em;
	text-align: left;
	word-break: keep-all;
}

.tab_cont_list>li {
	list-style: none;
	margin-bottom: 1.5em;
}

</style>
</head>
<body>
<%@ include file="menubar.jsp"%>

	<div class="terms_wrap">
		<h2 class="page_tit">이용약관</h2>
	</div>
	<div class="tab_cont_wrap board_wrap" style="padding-top:10px; padding-bottom:10px;">
		<div class="tab01 board_list tab_cont_inner guide" style="margin-left: 160px; margin-right: 160px;">
			<p class="tab_cont_tit mb_tit fw_b" style="font-weight:bold;">이용약관</p>
			<ul class="tab_cont_list">
				<li>
					<p class="tab_cont_tit">
						제 1 조 목적<br>
						이 약관은 또오개냥(이하 "회사")에서 제공하는 제반 서비스(이하 "서비스")에 접속과 사용자에 의해서 업로드 및 다운로드 되어 표시되는 모든 정보, 텍스트, 이미지 및 기타 자료를 이용하는 이용자(이하 "회원")와 서비스 이용에 관한 권리 및 의무와 책임사항, 기타 필요한 사항을 규정하는 것을 목적으로 합니다.
					</p>
				</li>
				<li>
					<p class="tab_cont_tit">
						제2조 약관의 게시와 효력, 개정<br>
						① 회사는 서비스의 가입 과정에 본 약관을 게시합니다.<br>
						② 회사는 관련법에 위배되지 않는 범위에서 본 약관을 변경할 수 있으며, 개정 전 약관과 함께 적용일자 7일 전부터 웹사이트에서 확인할 수 있도록 게시합니다. 다만, 이용자에게 불리하게 약관을 변경하는 경우에는 적용일자 30일 전에 개정내용을 이용자가 확인할 수 있도록 게시합니다.<br>
						③ 회원은 회사가 전항에 따라 변경하는 약관에 동의하지 않을 권리가 있으며, 이 경우 회원은 회사에서 제공하는 서비스 이용 중단 및 탈퇴 의사를 표시하고 서비스 이용 종료를 요청할 수 있습니다. 다만, 회사가 회원에게 변경된 약관의 내용을 통보하면서 회원에게 "7일 이내 의사 표시를 하지 않을 경우 의사 표시가 표명된 것으로 본다는 뜻"을 명확히 통지하였음에도 불구하고, 거부의 의사표시를 하지 아니한 경우 회원이 변경된 약관에 동의하는 것으로 봅니다.
					</p>
				</li>
				<li>
					<p class="tab_cont_tit">
						제3조 약관의 해석과 예외 준칙<br>
						① 회사는 제공하는 개별 서비스에 대해서 별도의 이용약관 및 정책을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우 개별 서비스의 이용약관을 우선하여 적용합니다.<br>
						② 본 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 그 규정에 따릅니다
					</p>
				</li>
			</ul>
		
		</div>
	</div>
<%@ include file="footer.jsp"%>
</body>
</html>