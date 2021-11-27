<%@page import="Board.BoardBean"%>
<%@page import="Board.FBoardDAO"%>

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

int num = Integer.parseInt(request.getParameter("num"));

String pass = request.getParameter("pass");


FBoardDAO bdao = new FBoardDAO();
int check = bdao.checkBoard(num, pass);

BoardBean bb = new BoardBean();
bb.setNum(num);
bb.setPass(pass);



	if(check == 1){
		bdao.deleteBoard(bb);
	
		%><script>alert("삭제되었습니다."); location.href = "notice.jsp";</script><%
		
	}else if(check ==0 ) {
		%><script> alert("비밀번호가 틀렸습니다."); history.back();</script> <%
	}
	else if(check == -1){
		out.println("존재하지 않는 글입니다");
	}


%>
</body>
</html>














