<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>
<hr>
<div id="copy">부산 금정구 부산대학로38번길 14 1층 심취(장전동 412-23 1층 심취)<br>
Instagram simchui_offical,simchui_dobby,simchui_thugi<br> Tel 010-6203-1345
</div>
<%if(session.getAttribute("id") != null) {%><div id="social"><a href="#" target="_blank" onclick="window.open('../mail/mailForm.jsp','메일보내기','resizable=no width=600 height=700'); return false" ><img src="../images/mail.png" width="33" 
height="33" alt="eMail"></a><%} %>
<a href="https://instagram.com/simchui_official" target = "_blank"><img src="../images/instagram.png" width="34" height="34"
alt="Instagram"></a></div>
</footer>


<!-- href="../mail/mailForm.jsp" target="_blank"  -->