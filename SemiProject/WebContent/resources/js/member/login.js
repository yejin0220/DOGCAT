/**
 * 
 */
//[자동 로그인]
var link = getContextPath();
const autoLogin = localStorage.getItem("autoLogin");
if(autoLogin != null){ // 로컬에 자동로그인 남아있는 경우
   location.href = link;
}
function autoLogin2(){
	// [자동로그인] 체크박스
       let userId = $("#userId").val();
	
    if($("input:checkbox[id='keepLogin']").prop("checked")){
      // local storage에 boolean값 저장해줘야함
        localStorage.setItem('autoLogin', userId );
      console.log("로컬스토리지 담긴 값 : "+localStorage.getItem("autoLogin"));
    } else { // 자동로그인 체크 안했다면
      localStorage.removeItem('autoLogin');    // 로컬 삭제
    }
}

   autoLogin2();

function getContextPath() {
	let hostIndex = location.href.indexOf(location.host) + location.host.length;
	let contextPath = location.href.substring(
		hostIndex,
		location.href.indexOf('/', hostIndex + 1)
	);
	console.log('getContextPath 불림');
	return contextPath;
}

function submitLogin(){
   let userId = $("#login-form input[name=userId]").val();
   if($("#remember-check").is(":checked") ) {
    document.cookie = "remember-check="+userId+"; path=/; max-age="+60*60*24;     
   }else{
      document.cookie = "remember-check=; path=/; max-age=0;"
   }
   $("#login-form").submit();
}

function getCookie(){
   let value = "";
   if(document.cookie.length > 0){
      let index = document.cookie.indexOf("remember-check=");
      if(index != -1){ 
         index += "remember-check=".length;
         let end = document.cookie.indexOf(";",index);
         
         if(end == -1){
            value = document.cookie.substring(index);
         }else{
            value = document.cookie.substring(index,end );
         }
         $("#login-form input[name=userId]").val(value);
         $("#remember-check").attr("checked",true);
      }
   }
}
$(function(){
   getCookie();
});


