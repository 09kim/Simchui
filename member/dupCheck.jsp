<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");

MemberDAO mdao = new MemberDAO();

boolean check = mdao.idCheck(id);



if(check == true){
	%> <h4>아이디 중복</h4><%
} else {
	%> <h4>아이디 사용 가능</h4><%
}
%>

<input type=button value="확인" onclick="window.close()">


</body>
</html>