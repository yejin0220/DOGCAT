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

$(function(){
			$("#free_table>tbody>tr").click(function(){
				let bno = $(this).children().eq(0).text();
				location.href = getContextPath() + '/detail.bf?bno='+bno;
			});
		});