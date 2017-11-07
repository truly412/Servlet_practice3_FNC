<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/reset.css">
<style type="text/css">
	* {
		margin: 0;
		padding: 0;
	}
</style>
<link href="./css/main.css" rel="stylesheet">
</head>
<body>
	<!-- Header 시작 -->
		<%@ include file="../temp/header.jsp" %>
	<!-- Header 끝 -->
	
	<!-- main 시작 -->
	<section id="main">
		<div id="mainContents">
			<article id="mainImage">
				<img src="./images/main/main.jpg">
			</article>
			<section id="mainBoard">
				<article class="mainPost">
					<img src="./images/main/mPost_1.PNG">
				</article>
				<article class="mainPost">
					<img src="./images/main/mPost_2.PNG">
				</article>
				<article class="mainPost">
					<div><img src="./images/main/mPost_3.PNG"></div>
					<div><img src="./images/main/mPost_4.PNG"></div>
				</article>
			</section>
		</div>
	</section>
	<!-- main 끝   -->
	
	<!-- Footer 시작 -->
		<%@ include file="../temp/footer.jsp" %>	
	<!-- Footer 끝   -->
</body>
</html>








