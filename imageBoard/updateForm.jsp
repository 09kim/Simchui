



<%@page import="Board.IBoardDAO"%>
<%@page import="Board.BoardBean"%>
<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심취(深醉)</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">일반 게시판</a></li>
				<li><a href="Inotice.jsp">이미지 게시판</a></li>
				<li><a href="../fileBoard/notice.jsp">파일 게시판</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
int num = Integer.parseInt(request.getParameter("num"));

IBoardDAO bdao = new IBoardDAO();
BoardBean bb = bdao.getContent(num);

%>
<!-- 게시판 -->
<article>
<h1>Notice Write</h1>
<form action="updatePro.jsp" method="post" enctype="multipart/form-data">
<input type ="hidden" name ="num"  value="<%=bb.getNum() %>"> <!-- 기준키 -->
<table id="notice">
    <tr><td>글쓴이</td><td><input type="text" name="name" value ="<%=bb.getName()%>" readonly></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=bb.getSubject()%>"></td></tr>
<tr><td>내용</td><td><textarea rows ="30" cols="40" name="content"><%=bb.getContent() %></textarea></td></tr>
<tr><td>파일</td><td><input type ="file" name="file" accept="image/gif,image/jpeg,/image/png"></td></tr>
</table>
<div id="table_search">
	<input type="button" value="글목록" class="btn" 
	onclick ="location.href = 'notice.jsp'">
	<input type="submit" value="글수정" class="btn">
</div>
</form>
<div class="clear"></div>
<div id="page_control">

</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>