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

<%

request.setCharacterEncoding("utf-8");

String id = (String)session.getAttribute("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");
String address2 = request.getParameter("address2");
String address3 = request.getParameter("address3");
String address4 = request.getParameter("address4");

MemberDAO mdao = new MemberDAO();

int check = mdao.userCheck(id, pass);

MemberBean mb = new MemberBean();
mb.setId(id);
mb.setName(name);
mb.setEmail(email);
mb.setAddress(address);
mb.setPhone(phone);
mb.setMobile(mobile);
mb.setAddress2(address2);
mb.setAddress3(address3);
mb.setAddress4(address4);




if(check ==1){
	mdao.updateMember(mb);
	%><script>alert("회원정보 수정 완료!"); location.href="../main/main.jsp";</script><%
}else if(check==0){
	%><script>
	alert("비밀번호 틀림");
	history.back();
	</script><%
}else { 
	%>
	<script>
	alert("비밀번호 틀림");
	history.back();
	</script><%
}

%>
}

</body>
</html>