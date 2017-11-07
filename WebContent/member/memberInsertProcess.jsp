<%@page import="com.iu.member.MemberDAO"%>
<%@page import="sun.misc.Perf.GetPerfAction"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	MemberDTO memberDTO =  new MemberDTO();
	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setName(request.getParameter("name"));
	memberDTO.setEmail(request.getParameter("email"));
	memberDTO.setPhone(request.getParameter("phone"));
	memberDTO.setAge(Integer.parseInt(request.getParameter("age")));
	memberDTO.setJob(request.getParameter("job"));
	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.insert(memberDTO);
	
	String s = "Fail";
	if(result>0) {
		s="Success";
	}
	
	request.setAttribute("message", s);
	   
	   // 1.Foward
	   RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp"); //서버내부에서 이동하는 페이지로 보고 입력
	   view.forward(request, response);
	   
	   /* 2.Redirect
	   response.sendRedirect("../common/result.jsp"); */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=s%>')
	location.href="./memberList.jsp"
</script>
</head>
<body>

</body>
</html>