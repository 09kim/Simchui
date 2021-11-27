<%@page import="Board.BoardBean"%>
<%@page import="Board.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp5/updatePro.jsp</h1>
</body>
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
Timestamp date = new Timestamp(System.currentTimeMillis());


BoardDAO bdao = new BoardDAO();
int check = bdao.checkBoard(num, pass);

BoardBean bb = new BoardBean();
bb.setNum(num);
bb.setName(name);
bb.setSubject(subject);
bb.setContent(content);
bb.setDate(date);
bb.setPass(pass);




	if(check == 1){
		bdao.updateBoard(bb);
		response.sendRedirect("notice.jsp");
	} else if(check == 0){
		out.println("비밀번호 틀림");%>
		<script>alert("틀린비밀번호"); 
		history.back();</script>
	<%}
 else if(check == -1){
	%><script>alert("num 없음"); 
		history.back();</script><%
}
%>
</html>