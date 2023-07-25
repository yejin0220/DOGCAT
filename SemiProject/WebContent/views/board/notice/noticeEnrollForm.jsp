<%@ page import="com.kh.member.model.vo.Member, java.util.Date, java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	
	String toDay = format1.format(date);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   	.container {
         display: flex;
         justify-content: space-evenly;
         align-items: flex-start;
         padding: 10px;
         width: 1000px;
     
      }
      .item{
      	width:1000px;
      }
	 .noticeWrap{
         max-width: 1200px;
         margin: auto;
     }
      .noticeContentTitle{
          border-top: 2px solid rgb(83, 193, 243);
          display: flex;
          -webkit-box-align: center;
          align-items: center;
          padding: 26px;
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
      }
      .noticTitleInput{
      	font-size: 20px;
      	border: 0px;
      	width: 80%;
      	
      }
    .btn-area{
    	text-align:center;
    	padding: 10px;
    	margin:10px;
    }
    .noticContentInput{
    	resize:none;
   	    border: 0px;
	    width: 100%;
	    height: 350px;
	    padding: 10px;
    }
</style>
</head>
<body>
<%@ include file= "../../admin/adminMenubar.jsp" %>

 	<div class="container">
        <div class="item notice">
            <h2 class="master_notice_title mt-3">공지사항 관리</h2>
            <form class="mt-3" action="<%= request.getContextPath() %>/insert.no" method="post">
	            <input type="hidden" name="userNo" value="<%= loginUser.getUserNo()%>">
	            <div>
	                <div class="noticeWrap">
	                    <div class="noticeContentTitle">
	                        <div class="noticTitle"><input class="noticTitleInput" type="text" name="title" placeholder="제목을 입력해주세요." required></div>
	                        <div class="noticAuthor"><%= loginUser.getUserNickname() %></div>
	                        <div class="noticDate"><%= toDay %></div>
	                    </div>
	                </div>
	                <div class="noticeContentWrap">
	                    <textarea class="noticContentInput" name="content" placeholder="내용을 입력해주세요." required></textarea>
	                </div>
	
	            </div>
                <div class="btn-area">
	                <button type="submit" class="btn btn-secondary btn-sm">등록하기</button>
	                <button type="button" class="btn btn-primary btn-sm" onclick="history.back();">뒤로가기</button>
                </div>
            </form>
        </div>
    </div>


<jsp:include page="../../common/footer.jsp"/>
</body>
</html>