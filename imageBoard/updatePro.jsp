<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="Board.IBoardDAO"%>
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
String uploadPath = request.getRealPath("/upload");
//콘솔창에 물리적 경로 확인
System.out.println(uploadPath);
//업로드 파일 크기 10MB
int maxSize = 10*1024*1024;
//한글 "utf-8"
//동일 이름 변경  cos안에 있는 파일 DefaultFileRenamePolicy(); 사용
MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize , "utf-8" , new DefaultFileRenamePolicy());
int num = Integer.parseInt(multi.getParameter("num"));
String name = multi.getParameter("name");
String pass = multi.getParameter("pass");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
String file = multi.getFilesystemName("file");
Timestamp date = new Timestamp(System.currentTimeMillis());


IBoardDAO bdao = new IBoardDAO();
int check = bdao.checkBoard(num, pass);

BoardBean bb = new BoardBean();
bb.setNum(num);
bb.setName(name);
bb.setSubject(subject);
bb.setContent(content);
bb.setDate(date);
bb.setPass(pass);
bb.setFile(file);




	if(check == 1){
		bdao.updateBoard(bb);
		response.sendRedirect("Inotice.jsp");
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