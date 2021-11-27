<%@page import="member.MemberBean"%>
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

String id = (String)session.getAttribute("id");
String pass = request.getParameter("pass");
String afterPass = request.getParameter("pass3");


MemberDAO mdao = new MemberDAO();

int check = mdao.userCheck(id, pass);

MemberBean mb = new MemberBean();
mb.setId(id);
mb.setPass(afterPass);




if(check ==1){
	mdao.changePass(mb);
	
	%><script>alert("비밀번호 변경 완료!"); location.href="../main/main.jsp";</script><%
}else if(check==0){
	%><script>
	alert("비밀번호 틀림!");
	history.back();
	</script><%
}else { 
	%>
	<script>
	alert("비밀번호 틀림!");
	history.back();
	</script><%
}

%>
}

</body>
</html>