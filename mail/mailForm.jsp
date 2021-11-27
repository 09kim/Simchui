<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>자바 메일 보내기 폼</title>
<style>
	table{
		width : 450px;
		margin : auto;
	}
	h1{
		text-align: center;
	}
	td{
		border : 1px dotted gray;
	}
</style>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
MemberDAO mdao = new MemberDAO();
mdao.getMember(id);
MemberBean mb = new MemberBean();
mb = mdao.getMember(id);

%>
<form action="MailSendServlet.jsp" method="post">
<h1>1:1 문의하기</h1>
<table>
	<input type="hidden" name="sender" value="emailtestit09@gmail.com" readonly>
	<input type="hidden" name="receiver" value="emailtestit09@gmail.com" readonly>
	<tr><td>제목 : </td><td><input type="text" name="subject" value=" ID:<%=mb.getId() %> 문의합니다" readonly></td></tr>
	<tr>
		<td>내용 : </td>
		<td><textarea name="content" cols=40 rows=20></textarea></td>
	</tr>
	<tr><td align=center colspan=2><input type="submit" value="보내기"></td></tr>
</table>
</form>

</body>
</html>
