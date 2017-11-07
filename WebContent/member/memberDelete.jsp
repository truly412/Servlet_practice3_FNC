<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	MemberDAO memberDAO = new MemberDAO();
	int result =  memberDAO.delete(id);

	String s = "Fail";
	if(result > 0) {
		s = "Success";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%= s%>');
	location.href="./memberList.jsp";
</script>
</head>
<body>

</body>
</html>