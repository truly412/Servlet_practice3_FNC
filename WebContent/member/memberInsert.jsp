<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
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
<link href="../css/header.css" rel="stylesheet">
<link href="./css/reset.css">
<link href="./css/main.css" rel="stylesheet">
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
<script type="text/javascript">
	window.onload=function() {
		var join = document.getElementById("join");
		join.addEventListener("click", function(){
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
		
		var btn = document.getElementById("btn");
		btn.addEventListener("click", function() {
			var id =  document.frm.id.value;
			window.open("memberIdCheck.jsp?id="+id,"","top=200, left=300, width=400, height=300");
		})
	}
</script>
</head>
<body>
<%@ include file="../temp/header.jsp"%>
<section id="main">
	<h1>JOIN addtt</h1>
	<article id="list">
	<form action="./memberInsertProcess.jsp" name="frm" method="get">
		<div class="form-group">
			<label for="id">ID:</label> 
			<input type="text" class="form-control" id="id" name="id">
			<input type="button" value="중복확인" class="btn btn-default" id="btn">
		</div>
		<div class="form-group">
			<label for="pw">Password:</label>
			<input type="password" class="form-control" id="pw" name="pw">
		</div>
		<div class="form-group">
			<label for="pw2">Password Confirm:</label>
			<input type="password" class="form-control" id="pw2">
		</div>
		<div class="form-group">
			<label for="name">Name:</label>
			<input type="text" class="form-control" id="name" name="name">
		</div>
		<div class="form-group">
			<label for="email">E-mail:</label>
			<input type="text" class="form-control" id="email" name="email">
		</div>
		<div class="form-group">
			<label for="phone">Phone:</label>
			<input type="text" class="form-control" id="phone" name="phone">
		</div>
		<div class="form-group">
			<label for="age">Age:</label>
			<input type="number" class="form-control" id="age" name="age">
		</div>
		<div class="radiobox">
			<label><input type="radio" name="job" value="t"> Teacher</label>
			<label><input type="radio" name="job" value="s"> Student</label>
		</div>
		
		<input type="button" class="btn btn-default" id="join" value="JOIN">
	</form>
	</article>
	</section>
	<%@ include file="../temp/footer.jsp" %>	
</body>
</html>
