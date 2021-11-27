<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<body>
<%
String num = request.getParameter("num");
String usernum = request.getParameter("usernum");
String receiver = request.getParameter("receiver");


if(num.equals(usernum)){
	%><script>
	alert("인증 되셨습니다.");
	window.opener.document.fr.email.value = "<%=receiver%>";
	window.opener.document.fr.email.readOnly = true;
	window.close();
	
	</script>
	<% session.setAttribute("num", num);
} else {
	%><script>alert("인증번호가 일치하지 않습니다."); history.back();</script><%
}



%>
</body>
</html>