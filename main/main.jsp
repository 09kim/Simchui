<%@page import="Board.IBoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Board.BoardDAO"%>
<%@page import="Board.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심취(深醉)</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

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
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/mainmenu.jpg"
 width="971" height="900"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">

<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">photo</span> 후기</h3>
<table>
<%
IBoardDAO idao =new IBoardDAO();
int pageSize = 5;
String pageNum = "1";

int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage-1)*pageSize+1;
List<BoardBean> boardList = idao.getBoardList(startRow, pageSize);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
%>
<%for(int i =0; i < boardList.size(); i++){ 
	BoardBean bb = boardList.get(i);%>
<tr><td class="contxt"><a href="../imageBoard/content.jsp?num=<%=bb.getNum()%>"><%=bb.getSubject() %></a></td>
    <td><%=sdf.format(bb.getDate()) %></td></tr><%}
    %>

</table>
</div>
<div id="news_notice">
<h3 class="brown">공  지  사  항 </h3>
<table>
<%
BoardDAO bdao =new BoardDAO();
pageSize = 5;
pageNum = "1";

currentPage = Integer.parseInt(pageNum);
startRow = (currentPage-1)*pageSize+1;
boardList = bdao.getBoardList(startRow, pageSize);
sdf = new SimpleDateFormat("yyyy.MM.dd");
%>
<%for(int i =0; i < boardList.size(); i++){ 
	BoardBean bb = boardList.get(i);%>
<tr><td class="contxt"><a href="../center/content.jsp?num=<%=bb.getNum()%>"><%=bb.getSubject() %></a></td>
    <td><%=sdf.format(bb.getDate()) %></td></tr><%}
    %>

</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" /> 
<!-- 푸터 들어가는 곳 -->

</body>
</html>