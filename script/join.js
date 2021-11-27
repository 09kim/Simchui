function check() {
	if (document.fr.id.value == "") {
		alert("아이디를 입력하세요")
		document.fr.id.focus();
		return false;
	}
	if(!/[a-zA-Z0-9]{2,8}/.test(document.fr.id.value)){
	      alert("아이디를 입력하세요(영어,숫자만 사용가능 2~8자")
	      document.fr.id.focus();
	      return false;
	   }
	if (document.fr.pass.value.length < 8) {
		alert("비밀번호를 입력하세요(8자 이상)")
		document.fr.pass.focus();
		return false;
	}

	if (document.fr.pass2.value == ""
			|| document.fr.pass2.value != document.fr.pass.value) {
		alert("비밀번호가 일치하지 않습니다")
		document.fr.pass2.focus();
		return false;
	}

	if (document.fr.name.value == "") {
		alert("이름을 입력하세요");
		document.fr.name.focus();
		return false;
	}

	if (document.fr.email.value == "") {
		alert("이메일을 입력하세요");
		document.fr.email.focus();
		return false;
	}

	if (document.fr.email.value != document.fr.email2.value
			|| document.fr.email2.value == "") {
		alert("이메일이 일치하지 않습니다");
		document.fr.email2.focus();
		return false;
	}
}

function confirmId() {
	if (document.fr.id.value == "") {
		alert("ID를 입력하세요");
		return;
	}
	url = "dupCheck.jsp?id=" + document.fr.id.value;
	open(
			url,
			"confirm",
			"toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300,height=200");
}


function confirmEmail() {
	
	url = "emailCheck.jsp?email=" + document.fr.email.value;
	open(
			url,
			"confirm",
			"toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500,height=300");
	
}