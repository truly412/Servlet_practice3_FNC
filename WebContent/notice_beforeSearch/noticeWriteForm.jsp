<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		var btn = document.getElementById("btn");
		btn.addEventListener("click", function() {
			var n = document.getElementsByClassName("n");
			var check = true;
			for(var i=0;i<n.length;i++) {
				if(n[i].value==""){
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
<link href="../css/header.css" rel="stylesheet">
<link href="./css/reset.css">
<link href="./css/main.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp"%>

	<section id="main">
		<form class="form-horizontal" action="./noticeWriteProcess.jsp"
			method="post" name="frm">
			<!-- 내용은get으로하기엔 김 -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="writer">WRITER:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="writer"
						placeholder="Enter Writer" name="writer">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">TITLE:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title"
						placeholder="Enter Title" name="title">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="contents">CONTENTS:</label>
				<textarea class="form-control" rows="5" id="contents"
					name="contents"></textarea>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
		</form>

	</section>

	<%@ include file="../temp/footer.jsp"%>
	<!-- 
	<form id="frm" name="frm" action="noticeWriteProcess.jsp">
		<p>Title  : <input type="text" name="title" class="n"></p>
		<p>Writer : <input type="text" name="writer" class="n"></p>
		<p>Contents : <textarea rows="" cols="" name="contents"></textarea></p>
		<input type="button" value="write" id="btn">
	</form>
	 -->
	
</body>
</html>