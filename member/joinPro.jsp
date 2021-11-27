<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
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

<%
//한글처리
request.setCharacterEncoding("utf-8");

//id pass name email address phone mobile파라미터 가져오기
String id = request.getParameter("id");
String pass= request.getParameter("pass");
String name = request.getParameter("name");
Timestamp reg_date = new Timestamp(System.currentTimeMillis());
String email = request.getParameter("email");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");
String address2 = request.getParameter("address2");
String address3 = request.getParameter("address3");
String address4 = request.getParameter("address4");

//패키지 member  자바빈파일 MemberBean(DTO)
//자바빈 파일 만들어서 객체생성 mb 파라미터값 멤버변수 저장
MemberBean mb = new MemberBean();
mb.setId(id);
mb.setName(name);
mb.setPass(pass);
mb.setReg_date(reg_date);
mb.setEmail(email);
mb.setAddress(address);
mb.setPhone(phone);
mb.setMobile(mobile);
mb.setAddress2(address2);
mb.setAddress3(address3);
mb.setAddress4(address4);
// email address phone mobile


//패키지 member  디비작업파일 MemberDAO
//디비작업 파일 만들어서 객체생성 mdao insertMember(자바빈주소) 만들어서 호출
MemberDAO mdao = new MemberDAO();
// email address phone mobile 인서트에 추가


//loginForm.jsp 이동

boolean check = mdao.idCheck(id);

if(check == false){
	mdao.insertMember(mb);
	%><script>location.href="login.jsp"; alert("회원가입 완료")</script><%

} else {
	%><script>alert("아이디 중복"); location.href="join.jsp";</script><%
}

%>



</body>
</html>











