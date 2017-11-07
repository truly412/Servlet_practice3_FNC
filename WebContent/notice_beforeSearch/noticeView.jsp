<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	int hit = Integer.parseInt(request.getParameter("hit"));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	noticeDAO.hitUpdate(num);
	NoticeDTO noticeDTO = noticeDAO.selectOne(num);
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
	* {
		margin: 0;
		padding: 0;
	}
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
<link href="./css/reset.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">
</head>
<body>
	<!-- Header 시작 -->
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<table class="table">
			<thead>
				<tr>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
					<th>HIT</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<% if (noticeDTO != null) { %>
					<td><%=noticeDTO.getTitle()%></td>
					<td><%=noticeDTO.getWriter()%></td>
					<td><%=noticeDTO.getReg_date()%></td>
					<td><%=noticeDTO.getHit()%></td>
					<% } %>
				</tr>
			</tbody>
		</table>
		<a class="btn btn-info" href="./noticeDelete.jsp?num=<%=noticeDTO.getNum()%>">DELETE</a>
		<a class="btn btn-info" href="./noticeUpdateFrom.jsp?num=<%=noticeDTO.getNum()%>">UPDATE</a>
		<a class="btn btn-info" href="./noticeList.jsp">LIST</a>
	</section>

	<!-- Footer 시작 -->
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>