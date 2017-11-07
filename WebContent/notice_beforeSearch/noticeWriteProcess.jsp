<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setWriter(request.getParameter("writer"));
	noticeDTO.setContents(request.getParameter("contents"));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	int result = noticeDAO.insert(noticeDTO);
	
	String s = "Fail";
	if(result>0) {
		s="Success";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	alert('<%=s%>');
	location.href="./noticeList.jsp"
</script>
<link href="../css/header.css" rel="stylesheet">
</head>
<body>
	<!-- Header 시작 -->
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
	<h1>NoticeProcess</h1>
	<h3><%=s%></h3>
	<a href="./noticeList.jsp">Go List</a>
	<!-- Footer 시작 -->
	</section>
	<%@ include file="../temp/footer.jsp"%>

</body>
</html>