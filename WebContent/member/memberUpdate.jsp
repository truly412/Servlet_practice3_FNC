<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO memberDTO = memberDAO.selectOne(id);
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
	window.onload=function() {
		var modify = document.getElementById("modify");
		modify.addEventListener("click", function(){
			var nullCheck = document.getElementsByClassName("form-control");
			var check = true;
			for(var i=0;i<nullCheck.length; i++) {
				if(nullCheck[i].value=="") {
					alert("필수 항목은 입력");
					check=false;
					break;
				}
			}
			if(check) {
				document.frm.submit();
			}
		})
	}
</script>
</head>
<body>
	<form action="./memberUpdateProcess.jsp" name="frm" method="get">
		<div class="form-group">
			<label for="id">ID:</label> 
			<input type="text" class="form-control" id="id" name="id" value="<%=memberDTO.getId()%>" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="pw">Password:</label>
			<input type="password" class="form-control" id="pw" name="pw" value="<%=memberDTO.getPw()%>">
		</div>
		<div class="form-group">
			<label for="name">Name:</label>
			<input type="text" class="form-control" id="name" name="name" value="<%=memberDTO.getName()%>" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="email">E-mail:</label>
			<input type="text" class="form-control" id="email" name="email" value="<%=memberDTO.getEmail()%>">
		</div>
		<div class="form-group">
			<label for="phone">Phone:</label>
			<input type="text" class="form-control" id="phone" name="phone" value="<%=memberDTO.getPhone()%>">
		</div>
		<div class="form-group">
			<label for="age">Age:</label>
			<input type="number" class="form-control" id="age" name="age" value="<%=memberDTO.getAge()%>" readonly="readonly">
		</div>
		<div class="radiobox">
			<label><input type="radio" name="job" value="t"> Teacher</label>
			<label><input type="radio" name="job" value="s"> Student</label>
		</div>
		
		<input type="button" class="btn btn-default" id="modify" value="MODIFY">
	</form>
</body>
</html>