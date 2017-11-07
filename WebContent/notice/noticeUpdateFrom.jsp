<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO = noticeDAO.selectOne(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/header.css" rel="stylesheet">
<link href="./css/reset.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<!-- Header 시작 -->
	<%@ include file="../temp/header.jsp"%>

	<section id="main">
		<form class="form-horizontal" action="./noticeUpdateProcess.jsp"
			method="post" name="frm">
			
			<input type="hidden" value="<%=noticeDTO.getNum()%>" name="num">
			
			<div class="form-group">
				<label class="control-label col-sm-2"  for="writer">WRITER:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="writer" readonly="readonly"
						placeholder="Enter Writer" name="writer" value="<%=noticeDTO.getWriter()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">TITLE:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title"
						placeholder="Enter Title" name="title" value="<%=noticeDTO.getTitle() %>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="contents">CONTENTS:</label>
				<textarea class="form-control" rows="5" id="contents"
					name="contents"><%=noticeDTO.getContents()%></textarea>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
		</form>
	</section>
	
	<!-- Footer 시작 -->
	<%@ include file="../temp/footer.jsp"%>

</body>
</html>