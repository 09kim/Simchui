<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
		// id 세션값 가져오기 
	String id = (String) session.getAttribute("id");
	// pass 파라미터 값 가져오기
	String pass = request.getParameter("pass");

	// MembeDAO mdao 객체생성
	MemberDAO mdao = new MemberDAO();
	// int check = userCheck(id,pass);
	int check = mdao.userCheck(id, pass);
	// check == 1 deleteMember(id) 세션값 초기화 main.jsp
	// check == 0 "비밀번호 틀림" 뒤로이동
	// check == -1 "아이디 없음" 뒤로이동

	MemberBean mb = new MemberBean();
	mb.setId(id);
	mb.setPass(pass);

	if(check == 1) {
		mdao.deleteMember(mb);
		session.invalidate();
		%><script>alert("회원 탈퇴 완료!"); location.href="../main/main.jsp";</script><%
		
	} else if(check == 0) {
	%><script>
			alert("비밀번호 틀림");
			history.back();
		</script>
	<%
		} else {
	%><script>
		alert("아이디 없음");
		history.back();
	</script>
	<%
		}
	%>
	<h1>jsp4/deletePro.jsp</h1>
</body>
</html>