<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	MemberDAO memberDAO = new MemberDAO();
	boolean check = memberDAO.idCheck(id);
	String s = id+" 는 사용가능";
	if (!check) {
		s=id+" 는 중복된 ID 입니다.";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function() {
		var btn = document.getElementById("btn");
		btn.addEventListener("click", function() {
			window.opener.document.frm.id.value='<%=id%>'; /* 집중 */
			window.self.close();
		});
	}
	
</script>
</head>
<body>
	<h1>ID CHECK</h1>
	<form action="memberIdCheck.jsp">
	New ID : <input type="text" name="id">
	<button>중복확인</button>
	</form>
	<h3><%=s %></h3>
		<% if(check) { %>
			<button id="btn">사용하기</button>
		<%} %>

</body>
</html>