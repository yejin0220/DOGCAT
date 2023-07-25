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

function enrollPage() {
	location.href = getContextPath() + "/views/member/memberEnroll.jsp";
}

function goLogin() {
	var link = getContextPath() + "/login.me";
	location.href = link;
}

function goEnroll() {
	var link = getContextPath() + "/views/member/memberEnroll.jsp";
	location.href = link;
}

function hrefLink() { // 뒤로가기
        	var link = getContextPath();
			location.href = link;
		}