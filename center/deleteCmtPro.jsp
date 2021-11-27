<%@page import="java.sql.Timestamp"%>
<%@page import="Board.BoardCmtDAO"%>
<%@page import="Board.BoardBean"%>
<%@page import="Board.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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


Timestamp date = (Timestamp)session.getAttribute("date");

BoardCmtDAO bdao = new BoardCmtDAO();
BoardDAO dao = new BoardDAO();
int num = Integer.parseInt(request.getParameter("num"));

BoardBean bb = new BoardBean();

bb.setDate(date);
		bdao.deleteBoard(bb);

%><script>location.href="content.jsp?num=<%=num%>"</script>
</body>
</html>














