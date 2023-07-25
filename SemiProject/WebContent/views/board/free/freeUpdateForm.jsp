<%@ page import="java.util.ArrayList, com.kh.board.free.model.vo.Category, com.kh.board.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<Category> categoryList = (ArrayList<Category>) request.getAttribute("list");
	System.out.println(categoryList);
	Board b = (Board) request.getAttribute("b");
	Attachment at = (Attachment) request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 수정</title>
<style>

</style>
<%@ include file="../../common/menubar.jsp"%>
<link href="<%= contextPath %>/resources/css/board/free/update.css" rel="stylesheet" type="text/css">
<script src="<%= contextPath %>/resources/js/board/free/thumbnail.js"></script>
<script src="<%= contextPath %>/resources/js/board/free/update.js"></script>
</head>
<body class="free_submit_all">
	<div class="free_header" align="center">
		<div class="free_img1">
			<img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-dog-2396837.png" alt="" width="44" height="45">
		</div>
		<div class="free_img2">
			<img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-cat-2195875.png" alt="" width="44" height="45">
		</div>
		<h1>멍냥수다방</h1>
		<p>
			우리 아이 자랑도하고 정보도 나누고<br> 궁금한 건 질문도 해요!
		</p>
	</div>
	<div class="free_main">
		<form action="<%=contextPath%>/update.bf" id="update-form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
			<div class="free_writer">
				<h2 style="font-size: 35px; color: rgb(255, 209, 51);">수정하기</h2>
				<div class="free_buttons1" align="end">
					<button type="button" class="free_cancel" onClick="history.back()">취소</button>
					<button type="submit" class="free_register">등록</button>
				</div>
			</div>

			<div class="free_category">
				<select name="category" id="category" style="border: 2px solid rgb(204, 204, 204);">
					<% for(Category c : categoryList){ %>
								<option value="<%=c.getCategoryNo() %>"  
								<% if(c.getCategoryName().equals(b.getBoardCategory())){ %>
									selected="selected"
								<% } %>
								><%=c.getCategoryName() %></option>	
							<%} %>
				</select>
						
				<div class="free_content_header" align="center">
					<input type="text" name="title" id="title" value="<%=b.getBoardTitle() %>" required>
				</div>
			</div>

			<div class="free_content_main" align="center">
				<textarea name="content" id="content" cols="30" rows="10" required><%=b.getBoardContent() %></textarea>
			</div>

			<div class="free_filebox" id="free_filebox">
				<input type="hidden" name="numberOfFile" id="numberOfFile">			
				<label for="addFile" style="font-size: 13px;">업로드추가</label>
				<input type="button" id="addFile" name="addFile" onClick="addInput();">
				<% if(at != null) { %>
					<%= at.getOriginName() %>
					<input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
					<input type="hidden" name="changeFileName" value="<%= at.getChangeName() %>">
			  	<% } %>
			</div>
			<div id="abcd" align="center"></div>
			<br>
			
		</form>
	</div>
	
	<%@ include file="../../common/footer.jsp"%>
</body>
<script>
$(document).ready( function() {
	
	var form = $('#update-form')[0]; 
		
	form.addEventListener('submit', function(event){
	  	
		event.preventDefault(); // 기본 동작인 submit 중단
		
	  	var imgCount = $('#abcd>img').length;
		$('input[name=numberOfFile]').val(imgCount);
		
		form.submit();	//이벤트 수행 후, form submit 진행
	  
	});
		
});

var count = 0 ;

function addInput(){
	
	if(count==3){
		return alert("파일첨부는 3장까지 가능합니다.");
	}
	
	var div = document.getElementById("free_filebox");
	
	var newLabel = document.createElement("label");
	newLabel.setAttribute("for","upfile" + count);
	newLabel.setAttribute("style","font-size: 13px");
	newLabel.innerHTML = "파일선택"
	
	var input = document.createElement("input");
	input.setAttribute("type","file");
	input.setAttribute("id","upfile" + count);
	input.setAttribute("name","upfile" + count);
	input.setAttribute("accept","image/*");
	input.setAttribute("onchange","setThumbnail(event)");
	
	div.appendChild(newLabel);
	div.appendChild(input);
	
	upCount();
}

function upCount() {
	count +=1;
}
</script>
</html>