<%@ page import="com.kh.board.model.vo.Board, com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b= (Board) request.getAttribute("b");
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.item{
		width: 1000px;
		margin: auto;
	}
	.master_notice_title {
         width: 250px;
         font-weight: bold;
    }
	.noticeWrap{
         margin: auto;
    }
    .noticeContentTitle{
        border-top: 2px solid rgb(83, 193, 243);
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        padding: 15px 26px 15px 26px;
        border-bottom: 1.2px solid rgb(204, 204, 204);
    }
    .noticTitle{
        flex: 1 1 0px;
        font-style: normal;
        font-weight: 400;
        font-size: 26px;
        line-height: 1.6;
        color: rgb(51, 51, 51);
    }
    .noticAuthor{   
        width: 9%;
        font-style: normal;
        font-weight: 400;
        font-size: 15px;
        line-height: 21px;
        text-align: center;
        color: rgb(102, 102, 102);
    }
    .noticDate{
        font-style: normal;
        font-weight: 400;
        font-size: 14px;
        line-height: 20px;
        text-align: center;
        color: rgb(102, 102, 102);
    }
    .noticeContentWrap{
        padding: 25px 10px;
        line-height: 1.6;
        height: 350px;
    }
    .noticeContentWrap>p{
   	    display: block;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
    }
	.btn-area{
     	text-align:center;
     	padding: 10px;
     	margin:10px;
    }
</style>
</head>
<body>

<%@ include file= "../../admin/adminMenubar.jsp" %>

	<div class="container">
		<div class="item mt-4">
            <h2 class="master_notice_title">공지사항 관리</h2>
            <div class="mt-5">
	            <div class="noticeWrap">
	                <div class="noticeContentTitle">
	                    <div class="noticTitle"><%= b.getBoardTitle() %></div>
	                    <div class="noticAuthor"><%= b.getBoardWriter() %></div>
	                    <div class="noticDate"><%= b.getCreateDate() %></div>
	                </div>
	            </div>
	            <div class="noticeContentWrap">
	            	<p><%= b.getBoardContent() %></p>
	            </div>
            </div>
          
            <div class="btn-area">
            	<a href="<%= request.getContextPath()%>/list.no" class="btn btn-secondary btn-sm">목록</a>
            	<% if(loginUser != null && loginUser.getUserNickname().equals(b.getBoardWriter())) { %>
            		<a href="<%= request.getContextPath()%>/update.no?bno=<%=b.getBoardNo() %>" class="btn btn-secondary btn-sm">수정</a>
            		<a href="<%= request.getContextPath()%>/delete.no?bno=<%=b.getBoardNo() %>" class="btn btn-danger btn-sm">삭제</a>
            	<% } %>
            
            </div>
        </div>
	
	</div>
	
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>