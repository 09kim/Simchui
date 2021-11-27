<%@page import="java.util.Random"%>
<%@page import="member.MemberBean"%>
</html><%@page import="member.MemberDAO"%>
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

Random r = new Random();



String randomStr = String.valueOf(r.nextInt(10));
String num = String.valueOf(r.nextInt(10)) + String.valueOf(r.nextInt(10)) +  String.valueOf(r.nextInt(10)) + String.valueOf(r.nextInt(10));
MemberBean mb = new MemberBean();
MemberDAO mdao = new MemberDAO();



%>
<form action="../mail/MailSendServlet2.jsp" method="post">

<table>
	<h1> 이메일 인증 </h1>
	<input type="hidden" name="sender" value="emailtestit09@gmail.com" readonly>
	<input type="email" name="receiver" placeholder="메일을 입력하세요" >
	<input type="hidden" name ="num" value="<%=num%>">
	<tr><td></td><td><input type="hidden" name="subject" value=" 심취 회원가입 인증 메일입니다." readonly></td></tr>
	<tr>
		
		<td><textarea name="content" cols=40 rows=20  style="display:none;"><%= num %></textarea></td>
	</tr>
	
	<tr><td align=center colspan=2><input type="submit" value="보내기" ></td></tr>
	
	
	
</table>
</form>


</body>
</html>