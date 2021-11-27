<%@page import="Board.IBoardCmtDAO"%>
<%@page import="Board.BoardCmtDAO"%>
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
<%@page import="Board.BoardDAO"%>
<%@page import="Board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String content = request.getParameter("content");
String id = (String)session.getAttribute("id");
int num = Integer.parseInt(request.getParameter("num"));

int readcount = 0;  // Timestamp date = 현 시스템날짜

Timestamp date = new Timestamp(System.currentTimeMillis());



// 패키지 board  파일이름 BoardBean  만들기   멤버변수  set() get()
// BoardBean bb 객체생성
// 멤버변수 <= 파라미터 값 저장

// 패키지 board 파일이름 BoardDAO 만들기
// 리턴값 없음 insertBoard(bb) 메서드 만들기
// BoardDAO bdao 객체 생성
IBoardCmtDAO bdao = new IBoardCmtDAO();
MemberDAO mdao = new MemberDAO();
MemberBean mb = new MemberBean();

mb = mdao.getMember(id);


BoardBean bb = new BoardBean();
bb.setContent(content);
bb.setDate(date);
bb.setName(id);
bb.setNum(num);


// insertBoard(bb) 메서드 호출

	bdao.insertBoard(bb);
	response.sendRedirect("content.jsp?num=" + num);


// list.jsp 글목록 이동


%>

</body>
</html>
