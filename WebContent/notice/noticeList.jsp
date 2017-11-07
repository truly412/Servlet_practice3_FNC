<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String kind = request.getParameter("kind");
	String search = request.getParameter("search");
	if(kind==null) {
		kind="title";
	}
	if(search==null) {
		search="";
	}
	int curPage = 1;
	try{		//어딜보고 있더라고 리스트로 돌아가면 1페이지로
	curPage=Integer.parseInt(request.getParameter("curPage"));
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	int perPage=10;
	int startRow = (curPage-1)*perPage+1;
	int lastRow = curPage*perPage;
	NoticeDAO noticeDAO =  new NoticeDAO();
	ArrayList<NoticeDTO> ar = noticeDAO.selectList(startRow,lastRow,kind,search);
	//totalPage
	int totalCount = noticeDAO.getToalCount();
	int totalPage=0;
	if(totalCount%perPage==0) {
		totalPage=totalCount/perPage;
	} else if (totalCount%perPage!=0) {
		totalPage=totalCount/perPage+1;
	} else {}
	//totalBlock
	int perBlock=5;
	int totalBlock=0;
	if(totalPage%perBlock==0) {
		totalBlock=totalPage/perBlock;
	} else {
		totalBlock=totalPage/perBlock+1;
	}
	//curPage를 이용해서 curBlock 구하기
	int curBlock=0;
	if(curPage%perBlock==0) {
		curBlock=curPage/perBlock;
	} else {
		curBlock=curPage/perBlock+1;
	}
	//curBlock 으로 startNum,lastNum
	int startNum = (curBlock-1)*perBlock+1;
	int lastNum = curBlock*perBlock;
	
	//마지막블럭에 마지막페이지만 나오게
	if (curBlock==totalBlock) {
		lastNum=totalPage;
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	h1 {
		margin : 0 auto;
		width: 30%;
		text-align: center;
	}
	#list {
		width: 75%;/* 부모의75% */
		margin: 0 auto;
		margin-top: 100px;
	}
</style>
<link href="../css/header.css" rel="stylesheet">
<link href="./css/reset.css">
<link href="./css/main.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	
	<section id="main">
	<h1>NoticeList <%= totalPage %></h1>
	<article id="list">
		<table class="table table-hover">
			<tr>
				<td>NUMBER</td>
				<td>TITLE</td>
				<td>WRITER</td>
				<td>REG_DATE</td>
				<td>HIT</td>
			</tr>
			<% for(NoticeDTO noticeDTO: ar) { %>
			<tr>
				<td><%= noticeDTO.getNum() %></td>
				<td><a href="noticeView.jsp?num=<%=noticeDTO.getNum()%>&hit=<%=noticeDTO.getHit()%>"><%= noticeDTO.getTitle() %></a></td>
				<td><%= noticeDTO.getWriter() %></td>
				<td><%= noticeDTO.getReg_date() %></td>
				<td><%= noticeDTO.getHit() %></td>
			</tr>
			<% } %>
		</table>
			<!-- pageing  -->
			<div class="container">
				<ul class="pagination">
				<% if (curBlock>1) {%>
					<li><a href="./noticeList.jsp?curPage=<%=startNum - 1%>&kind=<%=kind%>&search=<%=search%>"><</a></li>
				<% } %>
					<% for (int i = startNum; i < lastNum + 1; i++) { %>
					<li><a href="./noticeList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a></li>
					<% } %>
				<% if (curBlock<totalBlock) { %>
					<li><a href="./noticeList.jsp?curPage=<%=lastNum + 1%>&kind=<%=kind%>&search=<%=search%>">></a></li>
				<% } %>
				</ul>
			</div>
			<div>
				<a class="btn btn-warning" href="noticeWriteForm.jsp">WRITE</a>
			</div>
			
			<!-- search title,writer,contents -->
			
			<form action="./noticeList.jsp">	<!-- 이페이지로 보냄 -->
				<select name="kind">
					<option value="title">Title</option>
					<option value="writer">Writer</option>
					<option value="contents">Contents</option>
				</select>
				<input type="text" name="search">
				<button class="btn btn-success">Search</button>
			</form>
	</article>
	</section>
	
		<%@ include file="../temp/footer.jsp" %>	
</body>
</html>

















