



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

<h1>게시글 삭제</h1>
<form action="deletePro.jsp" id="join" method="post">
<input type ="hidden" name = "num"  value=<%= num %>><!-- 기준키 -->
<fieldset>
<legend>Basic Info</legend>
<!-- <label>User ID</label> -->
<%-- <input type="text" name="id" class="id" value = "<%=bb.getName() %>" readonly><br> --%>
<label>비밀번호</label>
<input type="password" name="pass"><br>


</fieldset>



<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
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