<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	MemberDAO memberDAO =  new MemberDAO();
	MemberDTO memberDTO = memberDAO.selectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="table-responsive">
		<table class="table">
			<tr>
				<th>ID</th>
				<th>PW</th>
				<th>NAME</th>
				<th>E-MAIL</th>
				<th>PHONE</th>
				<th>AGE</th>
				<th>JOB</th>
			</tr>
		<%if(memberDTO != null) { %>
			<tr>
				<td><%=memberDTO.getId() %></td>
				<td><%=memberDTO.getPw() %></td>
				<td><%=memberDTO.getName() %></td>
				<td><%=memberDTO.getEmail() %></td>
				<td><%=memberDTO.getPhone() %></td>
				<td><%=memberDTO.getAge() %></td>
				<td><%=memberDTO.getJob() %></td>
			</tr>
		<% } %>
		</table>
	</div>
	<a class="btn btn-warning" href="memberUpdate.jsp?id=<%=memberDTO.getId()%>">MODIFY</a>
	<a class="btn btn-danger" href="memberDelete.jsp?id=<%=memberDTO.getId()%>">DELETE</a>
	<a class="btn btn-info" href="memberList.jsp">LIST</a>
</body>
</html>