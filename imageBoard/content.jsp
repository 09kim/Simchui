<%@page import="Board.IBoardCmtDAO"%>
<%@page import="Board.BoardCmtDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Board.IBoardDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
<%@page import="Board.BoardBean"%>
<%@page import="Board.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

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

<%
		request.setCharacterEncoding("utf-8");
	// 날짜 모양 변경    날짜 => 문자열
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

	IBoardCmtDAO cdao = new IBoardCmtDAO();

	// 게시판 전체 글 개수 가져오기 select count(*) from board 
	// int count = getBoardCount()

	int count = cdao.getBoardCount();

	// 한 페이지에 보여줄 글 개수 설정
	int pageSize = 10;
	// 현 페이지 번호가져오기 
	// http://localhost:8080/StudyJSP/board/list.jsp
	// http://localhost:8080/StudyJSP/board/list.jsp?pageNum=2
	// pageNum 파라미터 가져오기
	String pageNum = request.getParameter("pageNum"); //pageNum 파라미터 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	// pageNum 파라미터 값이 없으면 "1"로 설정
	if (pageNum == null) {
		pageNum = "1";
	}

	// pageNum -> 정수형으로 변경
	int currentPage = Integer.parseInt(pageNum);

	// 시작하는 행번호 구하기 - 알고리즘
	//  페이지번호 currentPage 한화면 보여줄 글 개수 pageSize => 시작하는 행번호
	//       1                                       10       => 0+1 => 1
	//       2                                       10       => 10+1 => 11
	//       3                                       10       => 20+1 => 21
	int startRow = (currentPage - 1) * pageSize + 1;

	// 마지막 행번호 구하기
	//       1                                       10        => 10
	//       2                                       10        => 20
	//       3                                       10        => 30
	int endRow = currentPage * pageSize;

	// List boardList = getBoardList() 메서드 만들고 호출
	// List<>BoardBean> boardList=bdao.getBoardList();
	// select * from board order by num desc limit 시작행-1, 가져올개수
	List<BoardBean> boardList = cdao.getBoardList(startRow, pageSize, num);
	

	BoardBean bb2 = cdao.getContent(num);
	int cnum = cdao.getNum(num);
	%>
<%



IBoardDAO bdao = new IBoardDAO();

BoardBean bb = bdao.getContent(num);
bdao.getReadCount(num);
bb = bdao.getContent(num);

String id = (String)session.getAttribute("id");

MemberDAO mdao = new MemberDAO();
MemberBean mb = new MemberBean();
mb = mdao.getMember(id);

%>
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

<!-- 게시판 -->
<article>
<h1>Notice</h1>
<table id="notice">
<tr><th class="tno">제목:</th><br>
    <th class="ttitle"><%=bb.getSubject() %></th>
    <th class="twrite">작성자: <%=bb.getName() %></th>
    <th class="tdate" style="font-size:80%;">작성시간: <%=bb.getDate()%></th>
    <th class="tread">조회수: <%=bb.getReadcount()%></th></tr>
<%// 5단계 while 다음행 이동 num,subject,name,date,readcount 열 가져오기

		%> <tr><td class ="left" colspan ="5"><img src="../upload/<%=bb.getFile() %>" style="text-align:center; max-width: 100%; height: auto;"><br><%=bb.getContent() %></td></tr>
		<tr><td colspan="5"> 첨부파일: <a href="file_down.jsp?file_name=<%=bb.getFile() %>"><%=bb.getFile() %></a></td></tr>
		
		
		
		<%
		%>
			 <%// 5단계 while 다음행 이동 num,subject,name,date,readcount 열 가져오기
for(int i =0; i < boardList.size(); i++){ 
	bb2 = boardList.get(i);%>
				<tr>
					<td colspan="2"><%=bb2.getContent() %></td>
					<td><%=bb2.getName() %></td>
					<td><%=sdf.format(bb2.getDate()) %></td>
						<%
				if (id != null) {
					if (id.equals(bb2.getName())) { session.setAttribute("date", bb2.getDate());
				%><td><form action="deleteCmtPro.jsp" >
				<input type="hidden" name = "date" value=<%= bb2.getDate() %>>
				<input type="hidden" name = "num" value=<%=bb.getNum()%>>
				<input type="submit" value="삭제"></form></td>
				</tr> <%}}} %>
		
		<tr><td>
				<div id="page_control">
				<%
				
					// 전체 페이지 수 구하기
				// 전체 글개수 50  한화면에 보여줄 글의 개수 10  =>   전체페이지수 => 5
				// 전체 글개수 57  한화면에 보여줄 글의 개수 10  =>   전체페이지수 => 6
				if(cnum >10){
				int pageCount = count % pageSize == 0 ? count / pageSize : (count / pageSize) + 1;
				// 한 화면에 보여지는 페이지 개수 설정
				int pageBlock = 10;
				// 시작하는 페이지번호 구하기
				// 현페이지번호 1~10 => 한 화면 페이지 개수 10 => 시작하는 페이지 번호 
				//      1 ~ 10                    10            =>        1    
				//      11 ~ 20                   10            =>        11    
				//      21 ~ 30                   10            =>        21    
				int startPage = currentPage % pageBlock == 0 ? (currentPage - pageBlock) + 1
						: (currentPage - (currentPage % pageBlock)) + 1;
				// int startPage = (currentPage-1)/pageBlock*pageBlock+1; // 정수나누기정수 자바에선 자동 버림

				// 끝나는 페이지번호 구하기
				// 시작하는 페이지번호 1~10 => 한 화면 페이지 개수 10 =>  끝나는 페이지 번호 
				//      1                               10            =>         10
				//      11                              10            =>         20   
				//      21                              10            =>         30   
				int endPage = (startPage + pageBlock) - 1;
				// 끝나는 페이지 10    전체 페이지 5 = 끝나는 페이지 5 변경
				if (endPage > pageCount) {
					endPage = pageCount;
				}

				// 이전
				if (startPage > pageBlock) {
				%><a href="content.jsp?num=<%=num%>&pageNum=<%=startPage - pageBlock%>">[이전]</a>
				<%
					}

				// 1    2    3    4     5  . . .  . . 10
				for (int i = startPage; i <= endPage; i++) {
				%>
				<a href="content.jsp?num=<%=num%>&pageNum=<%=i%>"><%=i%></a>
				<%
					}

				// 다음 끝페이지번호 전체페이지번호
				if (endPage < pageCount) {
				%><a href="content.jsp?num=<%=num%>&pageNum=<%=startPage + pageBlock%>">[다음]</a>
				<%
					}}
				%>
			</div>
			</td></tr>
			
				<tr>
					<td class="left" colspan="5">
						<form action="wirteCmtPro.jsp" method="post">
							<input type="hidden" value="<%=bb.getNum()%>" name="num">
							<textarea cols="80" rows="5" name="content"></textarea>
							<input type="submit" value="작성">
						</form>
					</td>
				<tr>
</table>
<div id="table_search">


<%
// 세션값 가져오기
// 세션값 있으면 글쓰기 버튼 보이기
if(id != null){
if(id.equals(bb.getName())){%>
	<input type="button" value="글수정" class="btn" onclick="location.href ='updateForm.jsp?num=<%=bb.getNum()%>'">	
	<input type="button" value="글삭제" class="btn" 
	onclick ="location.href = 'deleteForm.jsp?num=<%=bb.getNum()%>'">
</div>
<%}}%>
<div class="clear"></div>


<div id="page_control">
<%// 페이지수 구하기
%> <input type="button" class ="btn" value ="목록"  onclick="location.href = 'Inotice.jsp'">
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