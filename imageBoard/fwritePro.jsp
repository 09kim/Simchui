

<%@page import="Board.IBoardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
String uploadPath = request.getRealPath("/upload");
//콘솔창에 물리적 경로 확인
System.out.println(uploadPath);
//업로드 파일 크기 10MB
int maxSize = 10*1024*1024;
//한글 "utf-8"
//동일 이름 변경  cos안에 있는 파일 DefaultFileRenamePolicy(); 사용
MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize , "utf-8" , new DefaultFileRenamePolicy());


//p310 파라미터 가져오기
//name pass subject content 파라미터 가져오기
String name = multi.getParameter("name");
String pass = multi.getParameter("pass");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
String file = multi.getFilesystemName("file");
String id = (String)session.getAttribute("id");



int readcount = 0;  // Timestamp date = 현 시스템날짜

Timestamp date = new Timestamp(System.currentTimeMillis());



// 패키지 board  파일이름 BoardBean  만들기   멤버변수  set() get()
// BoardBean bb 객체생성
// 멤버변수 <= 파라미터 값 저장

// 패키지 board 파일이름 BoardDAO 만들기
// 리턴값 없음 insertBoard(bb) 메서드 만들기
// BoardDAO bdao 객체 생성
IBoardDAO bdao = new IBoardDAO();
MemberDAO mdao = new MemberDAO();
MemberBean mb = new MemberBean();

mb = mdao.getMember(id);


BoardBean bb = new BoardBean();
bb.setContent(content);
bb.setDate(date);
bb.setName(name);
bb.setPass(pass);
bb.setReadcount(readcount);
bb.setSubject(subject);
bb.setFile(file);

// insertBoard(bb) 메서드 호출
if(mb.getPass().equals(pass)){
	bdao.insertFBoard(bb);
	response.sendRedirect("Inotice.jsp");
} else {
	%><script>alert("비밀번호 틀림"); history.back();</script> <%
}

// list.jsp 글목록 이동


%>

</body>
</html>
