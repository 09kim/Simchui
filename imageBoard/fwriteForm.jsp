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
String id = (String)session.getAttribute("id");
String pass2 = (String)session.getAttribute("pass");
if(id == null){
	response.sendRedirect("../member/login.jsp");
}
%>
<!-- 게시판 -->
<article>
<h1>Notice Write</h1>

<form action="fwritePro.jsp" method="post" enctype="multipart/form-data">
<table id="notice">
    <tr><td>글쓴이</td><td><input type="text" name="name" value ="<%=id%>" readonly></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
<tr><td>내용</td><td><textarea rows ="30" cols="40" name="content"></textarea></td></tr>
<tr><td>파일</td><td><input type="file" name="file" onchange="chk_file_type(this.value)" accept="image/gif,image/jpeg,/image/png" ></td></tr>
</table>
<div id="table_search">
	<input type="button" value="글목록" class="btn" 
	onclick ="location.href = 'notice.jsp'">
	<input type="submit" value="글쓰기" class="btn" >
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
<script type="text/javascript">
 function chk_file_type(obj) {
	 var file_kind = obj.value.lastIndexOf('.');
	 var file_name = obj.value.substring(file_kind+1,obj.length);
	 var file_type = file_name.toLowerCase();

	alert("캬캬");

	 var check_file_type=new Array();​

	 check_file_type=['jpg','gif','png','jpeg','bmp'];



	 if(check_file_type.indexOf(file_type)==-1){
	  alert('이미지 파일만 선택할 수 있습니다.');
	  var parent_Obj=obj.parentNode
	  var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
	  return false;
	 }else {
		 return true;
	 }
	}
 
 function fileTypeCheck(obj) {

		pathpoint = obj.value.lastIndexOf('.');

		filepoint = obj.value.substring(pathpoint+1,obj.length);

		filetype = filepoint.toLowerCase();

		if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {

			// 정상적인 이미지 확장자 파일인 경우

		} else {

			alert('Only image file can be uploaded!');

			parentObj  = obj.parentNode

			node = parentObj.replaceChild(obj.cloneNode(true),obj);

			return false;

		}

	}
 
 function checkFile(f){

		// files 로 해당 파일 정보 얻기.
		var file = f.files;

		// file[0].name 은 파일명 입니다.
		// 정규식으로 확장자 체크
		if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

		// 체크를 통과했다면 종료.
		else return;

		// 체크에 걸리면 선택된  내용 취소 처리를 해야함.
		// 파일선택 폼의 내용은 스크립트로 컨트롤 할 수 없습니다.
		// 그래서 그냥 새로 폼을 새로 써주는 방식으로 초기화 합니다.
		// 이렇게 하면 간단 !?
		f.outerHTML = f.outerHTML;
	}
 
 function fileCheck(obj)
 {
       // 파일 확장자 체크하기. 엑셀 파일만 업로드 가능.
      var obj = document.getElementById('fileExcel');
      // 파일 경로를 obj로 받아온다.
      var lastIndex = -1;
      var filePaht = "";
      filePath = obj.value;
      lastIndex = filePath.lastIndexOf('.');
      extension = filePath.substring( lastIndex+1, filePath.len );
      if(!((extension.toLowerCase() == "xls")) && extension != "")
      {  
           alert('xls 파일만 첨부가능 합니다.');
          obj.select();
           document.selection.clear();
           return false;
        }
      return true;
 }

 
 function fileCheck() { var fileext = document.getElementById('file').value; fileext = fileext.slice(fileext.indexOf(".") +1).toLowCase(); if(fileext != "jpg"){alert("불가능"); return false; }}
</script>
</body>
</html>