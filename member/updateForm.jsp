<%@page import="java.sql.Timestamp" %>
<%@page import="member.MemberDAO" %>
<%@page import="member.MemberBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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

    String id = (String) session.getAttribute("id");

    String pass = request.getParameter("pass");
    String name = request.getParameter("name");
    Timestamp reg_date = new Timestamp(System.currentTimeMillis());
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    String mobile = request.getParameter("mobile");
    String address2 = request.getParameter("address2");
    String address3 = request.getParameter("address3");
    String address4 = request.getParameter("address4");


    MemberDAO mdao = new MemberDAO();

    MemberBean mb = mdao.getMember(id);

%>
<div id="wrap">
    <!-- 헤더들어가는 곳 -->
    <jsp:include page="../inc/top.jsp"/>
    <!-- 헤더들어가는 곳 -->

    <!-- 본문들어가는 곳 -->
    <!-- 본문메인이미지 -->
    <div id="sub_img_member"></div>
    <!-- 본문메인이미지 -->
    <!-- 왼쪽메뉴 -->
    <nav id="sub_menu">
        <ul>
            <li><a href="updateForm.jsp">회원 정보 수정</a></li>
            <li><a href="changePassForm.jsp">비밀번호 변경</a></li>
            <li><a href="deleteMemberForm.jsp">회원 탈퇴</a></li>
        </ul>
    </nav>
    <!-- 왼쪽메뉴 -->
    <!-- 본문내용 -->
    <article>
        <h1>회원 정보 수정</h1>
        <form action="updatePro.jsp" id="join" method="post" name="fr">
            <fieldset>
                <legend>필수 정보</legend>
                <label>아이디</label>
                <input type="text" name="id" class="id" value="<%=mb.getId() %>" readonly><br>
                <label>비밀번호</label>
                <input type="password" name="pass"><br>

                <label>이름</label>
                <input type="text" name="name" value="<%=mb.getName() %>"><br>
                <label>이메일</label>
                <input type="email" name="email" value="<%=mb.getEmail() %>"><br>

            </fieldset>

            <fieldset>
                <legend>추가 정보</legend>
                <label>주소</label>
                <input type="text" id="sample6_postcode" placeholder="우편번호" name="address2"
                       value="<%=mb.getAddress2()%>">
                <input type="button" onclick="sample6_execDaumPostcode()" class="dup" value="우편번호 찾기"><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" id="sample6_address" placeholder="주소" name="address" value="<%=mb.getAddress()%>">
                <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address3"
                       value="<%=mb.getAddress3()%>"><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="address4"
                       value="<%=mb.getAddress4()%>">

                <br>
                <label>전화번호</label>
                <input type="text" name="phone" value="<%=mb.getPhone() %>"><br>
                <label>휴대폰 번호</label>
                <input type="text" name="mobile" value="<%=mb.getMobile()%>"><br>


            </fieldset>
            <div class="clear"></div>
            <div id="buttons">
                <input type="submit" value="Submit" class="submit">
                <input type="reset" value="Cancel" class="cancel">
            </div>
        </form>
    </article>
    <!-- 본문내용 -->
    <!-- 본문들어가는 곳 -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="../script/addressAPI.js"></script>
    <div class="clear"></div>
    <!-- 푸터들어가는 곳 -->
    <jsp:include page="../inc/bottom.jsp"/>
    <!-- 푸터들어가는 곳 -->
</div>
</body>
</html>