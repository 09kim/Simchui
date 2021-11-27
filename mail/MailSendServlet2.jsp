<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import=" mail.GoogleAuthentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="javax.activation.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%> 
<%
	request.setCharacterEncoding("UTF-8");
	String sender = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String num = request.getParameter("num");
	MemberBean mb = new MemberBean();
	MemberDAO mdao = new MemberDAO();
	boolean check = mdao.emailCheck(receiver);
	

	
	if(check == false){
	try {
		Properties properties = System.getProperties();
		properties.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
		properties.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
		properties.put("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
		properties.put("mail.smtp.port", "465"); // gmail 포트
		properties.put("mail.smtp.ssl.enable", "true"); 
		Authenticator auth = new GoogleAuthentication();
		Session s = Session.getInstance(properties, auth);
		//Session s = Session.getdefultInstance(properties, auth);
		Message message = new MimeMessage(s);
		Address sender_address = new InternetAddress(sender);
		Address receiver_address = new InternetAddress(receiver);
		message.setHeader("content-type", "text/html;charset=UTF-8");
		message.setFrom(sender_address);
		message.addRecipient(Message.RecipientType.TO, receiver_address);
		message.setSubject(subject);
		message.setContent(content, "text/html;charset=UTF-8");
		message.setSentDate(new java.util.Date());
		Transport.send(message);
		out.println("<h3>메일이 정상적으로 전송되었습니다.</h3>");
		%> <form action="MailSendServlet2Pro.jsp" method="post" name ="fr">
			<input type="hidden" name ="num" value="<%=num%>">
			<input type="hidden" name ="receiver" value="<%=receiver %>">
			<input name = "usernum" type="text" placeholder ="인증번호를 입력하세요.">
			<input type="submit">
		</form>
		
		<%
	} catch (Exception e) {
		out.println("SMTP 서버가 잘못 설정되었거나, 서비스에 문제가 있습니다.");
		e.printStackTrace();
	}
	}else {
		%><script>alert("이미 존재하는 이메일입니다."); history.back();</script><%
	}
%>