<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
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
<h1>member/loginPro.jsp</h1>
<%
// String id pass 파라미터 가져오기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
// MemberDAO mado 객체 생성



MemberDAO mdao = new MemberDAO();	
// int check  =  userCheck(id,pass) 함수 만들고 호출  // -1 0 1 받아오아함


// 신호값 정하기  1 : 아이디 비밀번호 일치, 0 : 비밀번호 틀림, -1 : 아이디 없음
int check = mdao.userCheck(id,pass);



%>
	<%
if(check ==1){
	session.setAttribute("id", id);
	session.setAttribute("pass" , pass);
	session.setAttribute("name", name);
	response.sendRedirect("../main/main.jsp");
}else if(check==0){
	%><script>
	alert("비밀번호 틀림");
	history.back();
	</script><%
}else { //check == -1
		%><script type="text/javascript">
		alert("없는 아이디입니다");
		history.back();</script><%
	
}
%>



<!-- <script> -->
<!-- // location.href = "main.jsp" -->
<!-- </script> -->
</body>
</html>