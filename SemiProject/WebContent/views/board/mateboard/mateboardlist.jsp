<%@ page
	import="java.util.ArrayList, com.kh.board.mateboard.model.vo.Board, com.kh.common.model.vo.PageInfo, com.kh.member.model.vo.Member,
	 com.kh.board.mateboard.model.vo.BoardLike, com.kh.board.model.vo.Attachment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	

 	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책메이트 게시판</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/board/mateboard/01.css?a=<%=System.currentTimeMillis() %>" rel="stylesheet">
<style>
.boardNo, .count, .create-date {
	display: none;
}

.list {
	flex-wrap: wrap;
	width: 1700px;
	display: flex;
	margin: 0 auto;
	padding-left: 90px;
}

#card {
	width: 300px;
	height: 400px;
	margin-bottom: 50px;
}

#search-btn {
	width: 4rem;
	height: 3rem;
}

#mate_writer {
	width: 8rem;
}

#search-btn, #mate_write {
	border-radius: 7px;
	background-color: white;
	color: rgb(106, 171, 240);
	font-size: medium;
	font-weight: 900;
	border: 3px solid rgb(106, 171, 240);
}

.pagaeBtn {
	overflow-clip-margin: content-box;
	overflow: clip;
	width: 26px;
	height: 26px;
	background-color: transparent;
	border: none;
}

.prev {
	transform: rotate(180deg);
}

.pagingArea {
	margin: 25px auto 0px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	column-gap: 30px;
	justify-content: center;
}

.pagingArea>button {
	border: 0;
	padding: 0;
	margin: 0;
	background-color: transparent;
}
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>

	<div class="content1">
		<div class="content_name">
			<img src="<%=contextPath%>/resources/왼쪽강아지.png"
				style="width: 40px; height: 35px;">
			<h1>같이 걷개</h1>
			<img src="<%=contextPath%>/resources/오른쪽강아지.png"
				style="width: 40px; height: 40px;">
		</div>
	</div>
	<hr>
	<br>
	<div class="content2">
		<p>
			산책메이트와 함께 특별한 시간을 만들어보세요 <br> 반려인도 반려동물도 내가 원하는 동네의 다양한 친구들을 만날
			수 있어요
		</p>
	</div>
	<div class="content3">
		 <form action="<%=contextPath%>/mateSearch" method="get" class="location">
			<div class="search_box">
				<select name="address1" id="address1" onchange="categoryChange(this)"
					class="address1">
					<option>광역시/도 선택</option>
					<option value="강원도">강원도</option>
					<option value="경기도">경기도</option>
					<option value="경상남도">경상남도</option>
					<option value="경상북도">경상북도</option>
					<option value="광주광역시">광주광역시</option>
					<option value="대구광역시">대구광역시</option>
					<option value="대전광역시">대전광역시</option>
					<option value="부산광역시">부산광역시</option>
					<option value="서울특별시">서울특별시</option>
					<option value="울산광역시">울산광역시</option>
					<option value="인천광역시">인천광역시</option>
					<option value="전라남도">전라남도</option>
					<option value="전라북도">전라북도</option>
					<option value="제주도">제주도</option>
					<option value="충청남도">충청남도</option>
					<option value="충청북도">충청북도</option>
				</select>
			</div>
			<div class="search_box">
				<select name="address2" id="state" class="address2">
					<option>군/구 선택</option>
				</select>
			</div>
			<button type="submit" class="search-btn" id="search-btn">검색</button>
		</form>
		<div class="content3-block" style="width: 3%;"></div>

		<%if(loginUser != null){ %>
		<button type="button" id="mate_write">
			<a href="<%=contextPath%>/insert.mate" style="text-decoration: none; color: rgb(106, 171, 240);">게시판 글쓰기</a>
		</button>
		<%} %>
	</div>

	<div class="content4"></div>

	<div class="conten5">
		<div class="list">
			<%if(list.isEmpty()){ %>
			<p>등록된 게시글이 없습니다..</p>
			<%}else{ %>
				<% for(Board b : list){%>
				<div class="card" id="card">
					<div class="card-body" id="card-body">
						<span class="boardNo" id="boardNo" style="font-size: x-small;" name="boardNo"><%=b.getBoardNo() %></span>
							<img class="card-img" id="mateCardImg" src="<%=contextPath %>/resources/분홍발자국.png">
						<span class="card-title" id="card-title" name="boardWriter"><%=b.getBoardWriter() %></span> 
						<span class="card-subtitle mb-2 text-muted"><%=b.getBoardTitle() %></span>
						<hr>
						<div class="card-content">
							<p><%= b.getAddress() %></p>
							<p><%=b.getBoardContent() %></p>
						</div>
					</div>
					<div class="card-footer" id="card-footer">
						<img class="card-thumb" src="<%=contextPath %>/resources/빈 추천.png" onclick="recommend();">
						<input type="hidden" class="bno" name="bno" value="<%=b.getBoardNo() %>">
						<span class="thumb-number"><%=b.getLcount() %></span> 
						<%if(b.getApplyCount()==0){ %>
						<img class="card-heart" src="<%=contextPath %>/resources/빈하트.png">
						<%}else{ %>
						<img class="card-heart" src="<%=contextPath %>/resources/꽉찬하트.png">
						<%} %>
						<span class="heart-number"><%=b.getApplyCount()%></span>
					</div>
					<span class="count" style="font-size: small;"><%=b.getCount() %></span>
					<span class="create-date" style="font-size: small;"><%=b.getCreateDate() %></span>
				</div>
				<%} %>
			<%} %>
		</div>
	</div>
	<script>
		$(function(){
			$(".card-body").click(function(){
				let bno = $(this).children().eq(0).text();
				location.href='<%=contextPath%>/detail.mate?bno='+bno;
			})
		})
			
	</script>

	
    <!--유진스 페이징바 영역  -->
    <div class="pagingArea">
		
		<%if(currentPage!=1) {%>
		<button onclick="location.href='<%=request.getContextPath()%>/list.mate?currentPage=<%= currentPage - 1%>'">
			<img class="pagaeBtn prev" src="https://sscampus.kr/images/notice/page-indicator-caret.png">
		</button>
		<%}else{ %>
		<button disabled>
			<img class="pagaeBtn prev" src="https://sscampus.kr/images/notice/page-indicator-caret.png">
		</button>
		<%} %>
		
		<% for(int i = startPage; i<=endPage; i++) { %>
			
			<% if(i != currentPage) { %>
				<button onclick="location.href='<%=request.getContextPath()%>/list.mate?currentPage=<%= i %>';"><%= i %></button>
			<% } else {%>
				<button disabled><%= i %></button>
			<% } %>
		<% } %>
		
		<%if(currentPage!=maxPage){ %>
		<button onclick="location.href='<%= request.getContextPath()%>/list.mate?currentPage=<%= currentPage + 1%>'">
			<img class="pagaeBtn next" src="https://sscampus.kr/images/notice/page-indicator-caret.png">
		</button>
		<%}else{ %>
		<button disabled>
			<img class="pagaeBtn next" src="https://sscampus.kr/images/notice/page-indicator-caret.png">
		</button>
		<%} %>
	</div>
	
	
	
	
	
	
	<script>
	$(function(){
	    // 선택한 이미지에 대한 정보를 localStorage에서 읽어와서 교체
	    $(".card-thumb").each(function() {
	        let bno=$(this).next(".bno").val();
	        let recommended = localStorage.getItem("recommended_" + bno);
	        if (recommended === "true") {
	            $(this).attr("src", "<%=contextPath%>/resources/꽉찬 추천.png"); // 꽉찬추천.png로 이미지 변경
	            $(this).addClass("recommended"); // 꽉찬추천 이미지를 유지하기 위한 클래스 추가
	        }
	    });
	    
	    // 이미지 클릭 시 localStorage에 선택한 이미지에 대한 정보 저장
	    $(".card-thumb").click(function(){
	        let bno=$(this).next(".bno").val();
	        let recommended = localStorage.getItem("recommended_" + bno);
	        if (recommended === "true") {
	            localStorage.removeItem("recommended_" + bno);
	            $(this).attr("src", "<%=contextPath%>/resources/꽉찬 추천.png"); // 빈하트.png로 이미지 변경
	            $(this).removeClass("recommended"); // 꽉찬추천 이미지를 제거
	        } else {
	            localStorage.setItem("recommended_" + bno, "true");
	            $(this).attr("src", "<%=contextPath%>/resources/꽉찬 추천.png"); // 꽉찬추천.png로 이미지 변경
	            $(this).addClass("recommended"); // 꽉찬추천 이미지를 유지하기 위한 클래스 추가
	        }
	        location.href="<%=contextPath%>/recommend?bno="+bno;
	    });
	});
   	 <%-- $(function(){
   		$(".card-thumb").click(function(){
  			let bno=$(this).next(".bno").val();
  			location.href="<%=contextPath%>/recommend?bno="+bno;
  		 	})
   		});
  		 
   	 }); --%>
         	 
         	 
        </script>
	<script>
	        function categoryChange(e) {
	            const state = document.getElementById("state");
	
	            const gangwon = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	            const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	            const gyeongsangnam = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
	            const gyeongsangbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	            const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
	            const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
	            const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
	            const busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	            const seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	            const ulsan = ["남구","동구","북구","중구","울주군"];
	            const incheon = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	            const jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	            const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
	            const jeju = ["서귀포시","제주시","남제주군","북제주군"];
	            const chungbuk = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	                
	
	            if (e.value == "강원도") {
	                add = gangwon;
	            } else if (e.value == "경기도") {
	                add = gyeonggi;
	            } else if (e.value == "경상남도") {
	                add = gyeongsangnam;
	            } else if (e.value == "경상북도") {
	                add = gyeongsangbuk;
	            } else if (e.value == "광주광역시") {
	                add = gwangju;
	            } else if (e.value == "대구광역시") {
	                add = daegu;
	            } else if (e.value == "대전광역시") {
	                add = daejeon;
	            } else if (e.value == "부산광역시") {
	                add = busan;
	            } else if (e.value == "서울특별시") {
	                add = seoul;
	            } else if (e.value == "울산광역시") {
	                add = ulsan;
	            } else if (e.value == "인천광역시") {
	                add = incheon;
	            } else if (e.value == "전라남도") {
	                add = jeonnam;
	            } else if (e.value == "전라북도") {
	                add = jeonbuk;
	            } else if (e.value == "제주도") {
	                add = jeju;
	            } else if (e.value == "충청남도") {
	                add = chungnam;
	            } else if (e.value == "충청북도") {
	                add = chungbuk;
	            }
	            state.options.length = 1;
	                // 군/구 갯수;
	                    for (property in add) {
	                        let opt = document.createElement("option");
	                        opt.value = add[property];
	                        opt.innerHTML = add[property];
	                        state.appendChild(opt);
	                    }
	        }
	        
	       
        </script>

	
	<%@ include file="../../common/footer.jsp" %>



</body>
</html>