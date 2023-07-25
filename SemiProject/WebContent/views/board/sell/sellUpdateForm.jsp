<%@ page import="java.util.ArrayList, com.kh.board.model.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Board b = (Board)request.getAttribute("b");
	String address = b.getAddress();
	int index = address.indexOf(",");
	String address1 = address.substring(0,index);
	String address2 = address.substring(index+1);
	
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
        box-sizing: border-box;
        /* border: 1px solid lightgray; */
    }
    #contents {
        width: 1200px;
        height: auto;
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
    }
    #page-title {
        text-align: center;
        color: #FFD133;
        font-size: 35px;
    }
    hr {
        margin: 5px 0;
        border: 0.7px solid lightgray;
    }
    #page-description {
        text-align: center;
        font-size: 13px;
        margin-bottom: 30px;
    }

    button:focus {
        border: none;
        outline: none;
    }
    #button-area {
        display: flex;
        justify-content: space-between;
    }
    #button-area button {
        border-radius: 7px;
        border: 0;
        padding: 5px 15px;
        font-size: 20px;
    }
    #register {
        background-color: rgb(230, 242, 255);
        color: rgb(0, 123, 255);
    }
    #title {
        color: #FFD133;
        font-size: 30px;
    }
    .address2 {
        display: none;
    }
    #title-area {
        display: flex;
        justify-content: space-evenly;
    }
    #title-area select:focus {
        outline: none;
    }
    #title-area select {
        border: 2px solid rgb(204, 204, 204);
        width: 150px;
        height: 40px;
        color: black;
        font-size: 15px;
        text-align: center;
        border-radius: 5px;
    }
    #title-area input:focus {
        outline: none;
    }
    #title-area input {
        border: 2px solid rgb(204, 204, 204);
        width: 888px;
        height: 40px;
        color: black;
        font-size: 15px;
        border-radius: 5px;
    }
    #content-area>textarea {
        width: 100%;
        height: 450px;
        padding: 0 10px;
        border: 2px solid #ccc;
        border-radius: 5px;
        resize: none;
        /* margin: 0; */
    }
    #content-area>textarea:focus {
    outline: none;}
    #filebox label {
        margin: 0;
        display: inline-block;
        padding: .3em .4em;
        color: rgb(255, 255, 255);
        font-size: inherit;
        line-height: normal;
        vertical-align: middle;
        background-color: rgb(0, 123, 255);
        cursor: pointer;
        border: 1px solid #ebebeb;
        border-bottom-color: #e2e2e2;
        border-radius: .25em;
    }
    input[type="file"] {
        width: 1px;
        height: 1px;
    }
    h5 {
        color: #FFD133;
    }
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	
	<div id="contents">
   		<div id="page-title">
            <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/KakaoTalk_20230316_095326819_01.png" width="45px">
            나눔&거래
            <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/KakaoTalk_20230316_095326819_02.png" width="45px">
        </div>
        <hr>
        <div id="page-description">
            우리 아이가 좋아하지 않는 장난감, 옷, 사료 등을 팔고, <br>
            필요한 물품들을 싸게 사보세요!
        </div>

        <div id="button-area">
            <div id="title">수정하기</div>
            <div id="buttons">
                <button type="button" id="cancel" onclick="cancel();">취소</button>
                <button type="button" id="register" onclick="sendFile()">수정</button>
            </div>
        </div>
        <div id="title-area">
            <select name="address1" class="address1" required value=<%= address1 %>>
                <option value="" selected disabled hidden>광역시/도</option>
                <option>서울특별시</option>
                <option>인천광역시</option>
                <option>대전광역시</option>
                <option>광주광역시</option>
                <option>대구광역시</option>
                <option>부산광역시</option>
                <option>울산광역시</option>
                <option>세종특별자치시</option>
                <option>제주특별자치도</option>
                <option>강원도</option>
                <option>경기도</option>
                <option>경상남도</option>
                <option>경상북도</option>
                <option>전라남도</option>
                <option>전라북도</option>
                <option>충청남도</option>
                <option>충청북도</option>
            </select>
            <select id="address2">
                <option value="" selected disabled hidden>시/구/군</option>
            </select>
            <select name="address2" class="address2" id="address2-1">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>강남구</option>
                <option>강동구</option>
                <option>강북구</option>
                <option>강서구</option>
                <option>관악구</option>
                <option>광진구</option>
                <option>구로구</option>
                <option>금천구</option>
                <option>노원구</option>
                <option>도봉구</option>
                <option>동대문구</option>
                <option>동작구</option>
                <option>마포구</option>
                <option>서대문구</option>
                <option>서초구</option>
                <option>성동구</option>
                <option>성북구</option>
                <option>송파구</option>
                <option>양천구</option>
                <option>영등포구</option>
                <option>용산구</option>
                <option>은평구</option>
                <option>종로구</option>
                <option>중구</option>
                <option>중랑구</option>
            </select>
            <select name="address2" class="address2" id="address2-2">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>강화군</option>
                <option>계양구</option>
                <option>남동구</option>
                <option>동구</option>
                <option>미추홀구</option>
                <option>부평구</option>
                <option>서구구</option>
                <option>연수구</option>
                <option>옹진군</option>
                <option>중구</option>
            </select>
            <select name="address2" class="address2" id="address2-3">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>대덕구</option>
                <option>동구</option>
                <option>서구</option>
                <option>유성구</option>
                <option>중구</option>
            </select>
            <select name="address2" class="address2" id="address2-4">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>광산구</option>
                <option>남구</option>
                <option>동구</option>
                <option>북구</option>
                <option>서구</option>
            </select>
            <select name="address2" class="address2" id="address2-5">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>남구</option>
                <option>달서구</option>
                <option>달성군</option>
                <option>동구</option>
                <option>북구</option>
                <option>서구</option>
                <option>수성구</option>
                <option>중구</option>
            </select>
            <select name="address2" class="address2" id="address2-6">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>강서구</option>
                <option>금정구</option>
                <option>기장군</option>
                <option>남구</option>
                <option>동구</option>
                <option>동래구</option>
                <option>부산진구</option>
                <option>북구</option>
                <option>사상구</option>
                <option>사하구</option>
                <option>서구</option>
                <option>수영구</option>
                <option>연제구</option>
                <option>영도구</option>
                <option>중구</option>
                <option>해운대구</option>
            </select>
            <select name="address2" class="address2" id="address2-7">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>남구</option>
                <option>동구</option>
                <option>북구</option>
                <option>울주군</option>
                <option>중구</option>
            </select>
            <select name="address2" class="address2" id="address2-8">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>세종특별자치시</option>
            </select>
            <select name="address2" class="address2" id="address2-9">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>서귀포시</option>
                <option>제주시</option>
            </select>
            <select name="address2" class="address2" id="address2-10">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>강릉시</option>
                <option>고성군</option>
                <option>동해시</option>
                <option>삼척시</option>
                <option>속초시</option>
                <option>양구군</option>
                <option>양양군</option>
                <option>영월군</option>
                <option>원주시</option>
                <option>인제군</option>
                <option>정선군</option>
                <option>철원군</option>
                <option>춘천시</option>
                <option>태백시</option>
                <option>평창군</option>
                <option>홍천군</option>
                <option>화천군</option>
                <option>횡성군</option>
            </select>
            <select name="address2" class="address2" id="address2-11">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>가평군</option>
                <option>고양시 덕양구</option>
                <option>고양시 일산동구</option>
                <option>고양시 일산서구</option>
                <option>과천시</option>
                <option>광명시</option>
                <option>광주시</option>
                <option>구리시</option>
                <option>군포시</option>
                <option>남양주시</option>
                <option>동두천시</option>
                <option>부천시</option>
                <option>성남시</option>
                <option>성남시 분당구</option>
                <option>성남시 수정구</option>
                <option>성남시 중원구</option>
                <option>수원시</option>
                <option>수원시 권선구</option>
                <option>수원시 영통구</option>
                <option>수원시 장안구</option>
                <option>수원시 팔달구</option>
                <option>시흥시</option>
                <option>안산시</option>
                <option>안산시 상록구</option>
                <option>안성시</option>
                <option>안양시</option>
                <option>안양시 동안구</option>
                <option>안양시 만안구</option>
                <option>양주시</option>
                <option>양평군</option>
                <option>여주시</option>
                <option>연천군</option>
                <option>오산시</option>
                <option>용인시</option>
                <option>용인시 기흥구</option>
                <option>용인시 수지구</option>
                <option>용인시 처인구</option>
                <option>의왕시</option>
                <option>의정부시</option>
                <option>이천시</option>
                <option>파주시</option>
                <option>평택시</option>
                <option>포천시</option>
                <option>하남시</option>
                <option>화성시</option>
            </select>
            <select name="address2" class="address2" id="address2-12">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>거제시</option>
                <option>거창군</option>
                <option>고성시</option>
                <option>김해시</option>
                <option>남해군</option>
                <option>밀양시</option>
                <option>사천시</option>
                <option>산청군</option>
                <option>양산시</option>
                <option>의령군</option>
                <option>진주시</option>
                <option>창령군</option>
                <option>창원시</option>
                <option>통영시</option>
                <option>하동군</option>
                <option>함안군</option>
                <option>함양군</option>
                <option>합천군</option>
            </select>
            <select name="address2" class="address2" id="address2-13">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>경산시</option>
                <option>경주시</option>
                <option>고령군</option>
                <option>구미시</option>
                <option>군위군</option>
                <option>김천시</option>
                <option>문경시</option>
                <option>봉화군</option>
                <option>상주시</option>
                <option>성주군</option>
                <option>안동시</option>
                <option>영덕군</option>
                <option>영양군</option>
                <option>영주시</option>
                <option>영천시</option>
                <option>예천군</option>
                <option>울릉군</option>
                <option>울진군</option>
                <option>의성군</option>
                <option>청도군</option>
                <option>청송군</option>
                <option>칠곡군</option>
                <option>포항시</option>
            </select>
            <select name="address2" class="address2" id="address2-14">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>강진군</option>
                <option>고흥군</option>
                <option>곡성군</option>
                <option>광양시</option>
                <option>구례군</option>
                <option>나주시</option>
                <option>담양군</option>
                <option>목포시</option>
                <option>무안군</option>
                <option>보성군</option>
                <option>순천시</option>
                <option>신안군</option>
                <option>여수시</option>
                <option>영광군</option>
                <option>영암군</option>
                <option>완도군</option>
                <option>장성군</option>
                <option>장흥군</option>
                <option>진도군</option>
                <option>함평군</option>
                <option>해남군</option>
                <option>화순군</option>
            </select>
            <select name="address2" class="address2" id="address2-15">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>고창군</option>
                <option>군산시</option>
                <option>김제시</option>
                <option>남원시</option>
                <option>무주군</option>
                <option>부안군</option>
                <option>순창군</option>
                <option>완주군</option>
                <option>익산시</option>
                <option>임실군</option>
                <option>장수군</option>
                <option>전주시</option>
                <option>정읍시</option>
                <option>진안군</option>
            </select>
            <select name="address2" class="address2" id="address2-16">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>계룡시</option>
                <option>공주시</option>
                <option>금산군</option>
                <option>논산시</option>
                <option>당진시</option>
                <option>보령시</option>
                <option>부여군</option>
                <option>서산시</option>
                <option>서천군</option>
                <option>아산시</option>
                <option>연기군</option>
                <option>예산군</option>
                <option>천안시</option>
                <option>청양군</option>
                <option>태안군</option>
                <option>홍성군</option>
            </select>
            <select name="address2" class="address2" id="address2-17">
                <option value="" selected disabled hidden>시/구/군</option>
                <option>괴산군</option>
                <option>단양군</option>
                <option>보은군</option>
                <option>영동군</option>
                <option>옥천군</option>
                <option>음성군</option>
                <option>제천시</option>
                <option>증평군</option>
                <option>진천군</option>
                <option>청원군</option>
                <option>청주시</option>
                <option>충주시</option>
            </select>
            <input type="text" name="title" id="content-title" size="100" required value="${b.boardTitle }">
            <select name="sale" class="sale">
            	<option value="Y">판매중</option>
            	<option value="N">판매완료</option>
            </select>
            <input type="hidden" name="bno" value="${b.boardNo }">
        </div>
        <div id="content-area">
            <textarea name="content" id="content-main" required>${b.boardContent }</textarea>
        </div>
        <div id="img-area">
        	<c:if test="${!empty requestScope.list }">
        		<c:forEach var="at" items="${requestScope.list }" varStatus="status">
        			<img src="<%=contextPath%>${at.filePath}${at.changeName}" width='150' height='120'>
        		</c:forEach>
        	</c:if>
        </div>
        <div id="filebox">
            <label for="file" style="font-size: 13px;">파일선택</label>
            <input type="file" id="file" name="file" multiple onchange="loadImg(this)" required>
            <c:if test="${!empty requestScope.list }"> <!-- 원래 파일이 있었을 경우 -->
            	<c:forEach var="at" items="${requestScope.list }" varStatus="status">
            		<input type="hidden" name="originFileNo${status.index }" value="${at.fileNo }">
            		<input type="hidden" name="changeFileName${status.index }" value="${at.changeName }" multiple>
            	</c:forEach>
            </c:if>
        </div>
        <hr>
        <h5>거래 희망 장소</h5>
        <div id="map" style="width:100%; height:350px;">

        </div>
        <input type="text" hidden id="latitude" name="latitude" value="${b.latitude }">
        <input type="text" hidden id="longitude" name="longitude" value="${b.longitude }">
          
        <script>
            $(function(){
         
            	$(".address1 option").each(function(){
            		if($(this).val() == "<%= address1 %>"){
            			$(this).attr("selected", "true");
            		}
            	});
            	
                for(let i= 1; i <= 17; i++){
                    if($(".address1 option:selected").val() == $(".address1 option").eq(i).val()){
                        $("#address2").css("display", "none");
                        $(".address2").css("display", "none");
                        $(".address2").eq(i-1).css("display", "inline");
                        $(".address2").eq(i-1).addClass("on");
                        $(".on").val("<%= address2 %>");
                    }
                }
                
                $(".address1").change(function(){
                    for(let i= 1; i <= 17; i++){
                        if($(".address1 option:selected").val() == $(".address1 option").eq(i).val()){
                            $("#address2").css("display", "none");
                            $(".address2").css("display", "none");
                            $(".address2").eq(i-1).css("display", "inline");
                            $(".address2").eq(i-1).addClass("on");
                        }
                    }
                });
            });
            
            function loadImg(inputFile) {
            	// inputFile : 현재 변화가 생긴 input type="file"요소
            	//console.log(inputFile.files.length);
            	
            	$("#img-area").empty(); // 새로 파일 선택시 원래 파일이미지 미리보기 비워주기
            
            	if(inputFile.files.length != 0){
            		// 선택된 파일이 존재할 경우에 선택된 파일들을 읽어들여서 미리보기 생성
	
            		for(let i=0; i<inputFile.files.length; i++){
             		let reader = new FileReader();
             		
            			reader.readAsDataURL(inputFile.files[i]);
            			
            			reader.onload = function(e){
            				let url = e.target.result;
            				$("<img id='contentImg"+i+"' width='150' height='120'>").appendTo("#img-area");
            				$("#contentImg"+i).attr("src", url); 
            			}
            		}
            	}else {
            		$("#img-area").empty()
            	}
            }
            
            function cancel() {
            	location.href="<%=contextPath%>/detail.sell?bno=<%=b.getBoardNo()%>";
            }
            
            function sendFile() {
            	let form = new FormData;
            	let address1 = $(".address1").val();
            	let address2 = $(".on").val();
            	let title = $("#content-title").val();
            	let content = $("#content-main").val();
            	let latitude = $("#latitude").val();
            	let longitude = $("#longitude").val();
            	let sale = $(".sale").val();
            	let bno = $("input[name=bno]").val();
            	
            	let originFileNos = document.querySelectorAll("input[name^=originFileNo]");
            	/* [].forEach.call(originFileNos , function(e , index ){
            		form.append("originFileNo"+index, e.value);
            	}) */
            	for(let i=0; i<originFileNos.length; i++){
            		form.append("originFileNo"+i, originFileNos[i].value);
            	}
            	
            	let changeFileNames = document.querySelectorAll("input[name^=changeFileName]"); 
            	/* [].forEach.call(changeFileNames , function(e , index ){
            		form.append("changeFileName"+index, e.value);
            	}) */
            	for(let i=0; i<changeFileNames.length; i++){
            		form.append("changeFileName"+i, changeFileNames[i].value);
            	}
            	
            	/* for(let i=1; i<=17; i++){
            		$("#address2-"+i+">option").each(function(){
            			//console.log($(this).is(':selected'));
            			//console.log($(this).filter(':selected').val());
            			if($(this).is(':selected') && $(this).val() != ""){
            				//console.log($(this).val());
            				address2 = $(this).val();
            			}
            		})
            	} */ 
            	// 첨엔 위에 돌린 반복문으로 값을 불러왔는데 그냥 불러온 address2에 클래스를 하나 더 (on)줘서 그 클래스로 불러오면 더 간단함
            	
            	//console.log(address2);
            	
             	$.each($("#file")[0].files, function(index, item){
            		form.append("file"+index, item);
            	});
            	form.append("title", title );
            	form.append("content", content);
            	form.append("address1", address1);
            	form.append("address2", address2);
            	form.append("latitude", latitude);
            	form.append("longitude", longitude);
            	form.append("sale", sale);
            	form.append("bno", bno);
            	 $.ajax({
            		url : "<%= request.getContextPath() %>/update.sell",
            		data : form,
            		type : "post",
            		processData : false,
            		contentType : false, // 순수한 file형태로 보내기 위해서
            		success : function(data){
            			location.href="<%= contextPath %>/detail.sell?bno="+bno;
            			console.log("성공데스");
            		}
            	});  
            	 
            	
            }
        </script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae890d646304659e5b68c9a99be204bf"></script>
        <script>
	        const lat = <%=b.getLatitude() %>;
	        const long = <%= b.getLongitude()%>;
        
	        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	            mapOption = { 
	                center: new kakao.maps.LatLng(lat, long), // 지도의 중심좌표
	                level: 3 // 지도의 확대 레벨
	            };
	        
	        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	        
	        // 지도를 클릭한 위치에 표출할 마커입니다
	        var marker = new kakao.maps.Marker({ 
	            // 지도 중심좌표에 마커를 생성합니다 
	            position: map.getCenter() 
	        }); 
	        // 지도에 마커를 표시합니다
	        marker.setMap(map);
	        
	        // 지도에 클릭 이벤트를 등록합니다
	        // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	            
	            // 클릭한 위도, 경도 정보를 가져옵니다 
	            var latlng = mouseEvent.latLng; 
	            
	            // 마커 위치를 클릭한 위치로 옮깁니다
	            marker.setPosition(latlng);
	            
	            $("#latitude").val(latlng.getLat());
	            $("#longitude").val(latlng.getLng());
	        });
        </script>
     </div>
     
     <%@ include file="../../common/footer.jsp" %>
</body>
</html>