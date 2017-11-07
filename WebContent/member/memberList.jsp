<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	String kind = request.getParameter("kind");
	String search = request.getParameter("search");
	if(kind==null) {
		kind="id";
	}
	if(search==null) {
		search="";
	}
	int curPage=1;
	try{
	curPage=Integer.parseInt(request.getParameter("curPage"));
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	//perPage 이용 startRow & lastRow
	int perPage=10;
	int perBlock=5;
	
	int startRow = (curPage-1)*perPage+1;
	int lastRow = curPage*perPage;
	MemberDAO memberDAO =  new MemberDAO();
	ArrayList<MemberDTO> ar = memberDAO.selectList(startRow,lastRow,kind,search);
	
	//totalCount 이용 totalPage
	int totalCount = memberDAO.getTotalCount();
	int totalPage=0;
	if (totalCount%perPage==0) {
		totalPage=totalCount/perPage;
	} else {
		totalPage=totalCount/perPage+1;
	}
	
	//perBlock&totalPage 이용 totalBlock
	int totalBlock=0;
	if(totalPage%perBlock==0) {
		totalBlock=totalPage/perBlock;
	} else {
		totalBlock=totalPage/perBlock+1;
	}
	
	//curPage를 이용 curBlock 구하기
	int curBlock=0;
	if(curPage%perBlock==0) {
		curBlock=curPage/perBlock;
	} else { 
		curBlock=curPage/perBlock+1;
	}
	//curBlock 으로 startNum,lastNum
	int startNum = (curBlock-1)*perBlock+1;
	int lastNum = curBlock*perBlock;
	
	//마지막블럭에 마지막 페이지만 나오게
	if(curBlock==totalBlock) {
		lastNum = totalPage;
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
<script type="text/javascript">

</script>
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
	<h1>Member List asd</h1>
	<article id="list">
	
	<table class="table table-hover">
	<thead>
		<tr>
			<th>id</th>
			<th>name</th>
			<th>job</th>
		</tr>
	</thead>
	<tbody>
		<%for (MemberDTO memberDTO : ar) {%>
		<tr>
			<td><a href="memberView.jsp?id=<%=memberDTO.getId()%>"><%=memberDTO.getId()%></a></td>
			<td><%=memberDTO.getName()%></td>
			<td><%=memberDTO.getJob()%></td>
		</tr>
		<%}%>
	</tbody>
	</table>
	<div class="container">
		<ul class="pagination">
			<%if (curBlock > 1) {%>
			<li><a href="./memberList.jsp?curPage=<%=startNum - 1%>&kind=<%=kind%>&search=<%=search%>">[이전]</a></li>
			<%}%>
			<%for (int i = startNum; i < lastNum + 1; i++) {%>
			<li><a href="./memberList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a></li>
			<%}%>
			<%if (curBlock < totalBlock) {%>
			<li><a href="./memberList.jsp?curPage=<%=lastNum + 1%>&kind=<%=kind%>&search=<%=search%>">[다음]</a></li>
			<%}%>
		</ul>
	</div>
	<div>
		<a class="btn btn-warning" href="./memberInsert.jsp">WRITER</a>
	</div>
	<form action="./memberList.jsp">
		<select name="kind">
			<option value="id">Id</option>
			<option value="name">Name</option>
		</select> 
		<input type="text" name="search">
		<button class="btn btn-success">Search</button>
	</form>
	</article>
</section>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>


















