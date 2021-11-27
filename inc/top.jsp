

<style>
.menubar li{
	display:none;
}

.menubar li:hover {
	display:block;
	background-color:black;
}

</style>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    request.setCharacterEncoding("utf-8");
    
    String id = (String)session.getAttribute("id");
    
    
    
    MemberDAO mdao = new MemberDAO();
   
    MemberBean mb = mdao.getMember(id);
    
    
    
   
    
    %>
<header><%if(id == null) {%> 
<div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a></div>
<div class="clear"></div>  <%} else{%><div id="login"><%=mb.getId()%>님이 로그인 하셨습니다 | <a href="../member/updateForm.jsp">My Page</a>
| <a href="../member/logout.jsp">Log-Out</a></div>
<div class="clear"></div>   <%} %>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/mainlogo.jpg" width="265" height="150" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu"> 
<ul>
	<li><a href="../main/main.jsp">메인</a>	</li>
	<li><a href="../company/welcome.jsp">소개</a>
		<ul class="menubar">
			<li><a href="../compnay/menu.jsp">메뉴</a></li>
			<li><a href="../compnay/map.jsp">지도</a></li>
		</ul>
	</li>
	<li><a href="../center/notice.jsp">게시판</a></li>
	
</ul>
</nav>
</header>