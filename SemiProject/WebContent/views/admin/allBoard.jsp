<%@ page import="java.util.ArrayList, com.kh.board.model.vo.Board, com.kh.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 	PageInfo pi = (PageInfo)request.getAttribute("pi"); 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
 	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.footer {
	width: 100%;
	height: 100px;
	position: absolute;
	bottom: 0;
}

.container {
	display: flex;
	justify-content: space-evenly;
}

.allBoard_title {
	width: 250px;
	font-weight: bold;
	text-align: left;
}

.allBoard_list {
	width: 650px;
	padding: 0px 10px 0px 10px;
	margin-top: 20px;
	border-top: 2px solid rgb(83, 193, 243);
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

.category_swipperWrap {
	display: flex;
	justify-content: center;
}

.category_swipper {
	width: 100%;
	margin: 0px;
	box-sizing: content-box;
}

.category_button {
	padding: 9px;
	background: rgb(226, 226, 226);
	border: 1.5px solid rgb(255, 255, 255);
	border-radius: 10px 10px 0px 0px;
	font-style: normal;
	font-weight: 900;
	font-size: 18px;
	line-height: 23px;
	text-align: center;
	color: rgb(102, 102, 102);
	white-space: nowrap;
	width: 250px;
	max-width: 100%;
}

.category_button:hover {
	background-color: rgb(83, 193, 243);
	color: white;
}

.current {
	background-color: rgb(83, 193, 243);
	color: white;
}

.allBoard_list>tbody>tr:hover {
	cursor: pointer;
}
</style>
</head>
<body>

<%@ include file= "adminMenubar.jsp" %>

	<script>
	    $(document).ready(function() {
	        if(location.href.indexOf('<%=request.getContextPath()%>/typeB?type=3') > -1){ 
	            $('#categorySell').addClass('current');
	        }
	        if(location.href.indexOf('<%=request.getContextPath()%>/typeB?type=2') > -1) {
				$('#categoryFree').addClass('current');
			}
			if (location.href.indexOf('<%=request.getContextPath()%>/typeB?type=1') > -1){ 
	        	$('#categoryMate').addClass('current');
	        }   
	        if(location.href.indexOf('<%=request.getContextPath()%>/allB') > -1){
	            $('#categoryAll').addClass('current');
	        }   
	    });
    </script>

	<div class="container">
        <div class="item mt-3">
	        <div class="serach_area">
	            <h2 class="allBoard_title">게시판 관리</h2>
	            <div class="category_swipperWrap mt-5">
	            	<div class="category_swiper"><button class="category_button" type="button" id="categoryAll" name="category" value="4">전체보기</button></div>
	            	<div class="category_swiper"><button class="category_button" type="button" id="categoryMate" name="category" value="1">같이걷개</button></div>
	            	<div class="category_swiper"><button class="category_button" type="button" id="categoryFree" name="category" value="2">멍냥수다</button></div>
	            	<div class="category_swiper"><button class="category_button" type="button" id="categorySell" name="category" value="3">나눔&거래</button></div>
	            </div>
	        </div>
	       
	       	<script>
	       		$(function(){
	       			$("button[name='category']").on("click", function(){
	       				if($(this).val() != 4){
		       				location.href = "<%= request.getContextPath() %>/typeB?type="+ $(this).val();
	       				}else{
	       					location.href = "<%= request.getContextPath() %>/allB";
	       				}
	       			});
	       		});
	       		
	       	</script>
	       
	       
	       
	        <div>
	            <table class="allBoard_list table table-hover">
	                <thead>
	                    <tr>
	                    	<th scope="col">번호</th>
	                        <th scope="col">카테고리</th>
	                        <th scope="col">글제목</th>
	                        <th scope="col">작성자</th>
	                        <th scope="col">작성일자</th>
	                        <th scope="col">조회수</th>
	                    </tr>
	                </thead>
	                <tbody class="table-group-divider">
	                    <c:choose>
	                    	<c:when test="${ empty list }">
	                    		<tr>
	                    			<td colspan="6">조회된 게시글이 없습니다.</td>
	                    		</tr>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<c:forEach var="b" items="${ requestScope.list }" varStatus="status">
	                    			<tr>
	                    				<td>${b.boardNo }</td>
	                    				<c:choose>
	                    					<c:when test="${b.boardType eq 1}">
	                    						<td scope="row">같이걷개</td>
	                    					</c:when>
	                    					<c:when test="${b.boardType eq 2}">
	                    						<td scope="row">멍냥수다</td>
	                    					</c:when>
	                    					<c:when test="${b.boardType eq 3}">
	                    						<td scope="row">나눔&거래</td>
	                    					</c:when>
	                    				</c:choose>
										<td>${b.boardTitle }</td>	
										<td>${b.boardWriter }</td>
										<td>${b.createDate }</td>
										<td>${b.count }</td>                    			
	                    			</tr>
	                    		</c:forEach>
	                    	</c:otherwise>
	                    </c:choose>
	                </tbody>
	            </table>
	        </div>
        </div>
        

      	<script>
			$(function(){
				$(".allBoard_list>tbody>tr").click(function(){
					let bno = $(this).children().eq(0).text();
					
					location.href = "<%= request.getContextPath()%>/detail.no?bno="+bno;
				});
			});
		
	
		</script>

       	<script>
			$(function(){
				$(".allBoard_list>tbody>tr").click(function(){
					let bno = $(this).children().eq(0).text();
					let bType = $(this).children().eq(1).text();
					
					if(bType == "같이걷개"){
						location.href = "<%= request.getContextPath()%>/detail.mate?bno="+bno;
					} else if(bType == "멍냥수다"){
						location.href = "<%= request.getContextPath()%>/detail.bf?bno="+bno;
					} else if(bType == "나눔&거래"){
						location.href = "<%= request.getContextPath()%>/detail.sell?bno="+bno;
					}
					
				});
			});
		</script>
      
    </div>

    <!-- 페이징바 영역  -->
    <div class="pagingArea">
		
		<% if(currentPage != 1) { %>
			<button onclick="location.href='<%=request.getContextPath()%>/allB?currentPage=<%= currentPage - 1%>'">
				<img class="pagaeBtn prev" src="https://sscampus.kr/images/notice/page-indicator-caret.png">
			</button>
		<% } else { %>
			<button disabled>
				<img class="pagaeBtn prev" src="https://sscampus.kr/images/notice/page-indicator-caret.png">
			</button>
		<% } %>
		
		<% for(int i = startPage; i<=endPage; i++) { %>
			
			<% if(i != currentPage) { %>
				<button onclick="location.href='<%=request.getContextPath()%>/allB?currentPage=<%= i %>';"><%= i %></button>
			<% } else {%>
				<button disabled><%= i %></button>
			<% } %>
		<% } %>
		
		<% if(currentPage != maxPage) { %>
			<button onclick="location.href='<%= request.getContextPath()%>/allB?currentPage=<%= currentPage + 1%>'">
				<img class="pagaeBtn next" src="https://sscampus.kr/images/notice/page-indicator-caret.png">
			</button>
		<% } else { %>
			<button disabled>
				<img class="pagaeBtn next" src="https://sscampus.kr/images/notice/page-indicator-caret.png">
			</button>
		<% } %>
	</div>
	
	
<jsp:include page="../common/footer.jsp"/>
</body>
</html>