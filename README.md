# Simchui
부산아이티윌 첫번째 개인 프로젝트(2020.07)

◎ 개발 개요
☞ JSP 기반으로 구현한  음식점 소개 홈페이지 입니다. 음식점에 대한 정보를 볼 수
   있고 사용자가 회원가입을 통해 게시판, 그림·파일 등을 업로드 작성을 할 수 있음

◎ 개발 환경
OS/DB/Tools/ETC	
-Windows 10 64bit / MySQL / Eclipse 
Language	
-Java, JSP, html, css, Javascript


메인(사용자)및 전체	
- HTML/CSS3, JSP 이용하여 메인화면 구성- 메인메뉴에 공지사항과 이미지게시판 최신글을 5개씩 가져오도록 구성
- 메인 좌측의 경우 카테고리별로 들어갈 수 있는 게시판을 구성- 메인메뉴에 내 정보를 볼 수 있는 버튼을 구성
- footer에 메일아이콘을 눌러서 문의 메일 발송 가능

마이페이지
- 가입 시 입력한 본인정보를 볼 수 있도록 구성- 본인정보를 수정하고자 할 시 수정할 수 있도록 구성
- 회원 탈퇴를 원할 시 탈퇴 가능

소개 페이지
- 지도 API를 사용하여 가게 위치를 바로 알 수 있게 구현

게시판
- Set/Get 메소드를 이용해 DB와 연동하여 게시글을 DB에 저장 및 디스플레이 할 수  있도록 구현
- 게시글 리스트를 최신 순으로 웹페이지에 디스플레이- 게시판 리스트에 조회수 자동 업데이트 되도록 구현
- 글쓰기는 로그인 시 가능. 로그인하지 않으면 버튼자체를 보이지 않도록 구성- 자신이 등록한 글이 아니면 수정, 삭제 등을 할 수 없게 제어
- 글쓰기, 글수정 시 본인의 아이디 정보에 맞는 패스워드를 입력해야 사용할 수 있도록 구성
- 이미지가 들어간 게시판인 경우 리스트에서 이미지를 바로 볼 수 있도록 구성
- 이미지는 총 12개로 한 칸에 3개씩 나오도록 구성
- 게시판 검색 기능을 통해 원하는 텍스트를 조회할 수 있도록 구현
- 로그인 시 게시판 글에 댓글 작성이 가능하도록 구현 & 본인만 삭제 할 수 있도록 구현
- 자료실에서 파일을 등록할 수 있고 파일이 등록된 것과 안된 것을 구분할 수 있도록 구현
- 게시판과 댓글은 한 창에 10개씩만 나오고 10개 초과 시 다음 페이지로 넘어가게 구현

Login 및Join 페이지	
- 폼에 입력된 ID, Password와 DB에 저장된 ID, Password를 SELECT 구문으로 가져와서 비교한 뒤 로그인 되도록 구현
- 회원들이 회원가입이 가능하도록 구현하였고 특히 ID 입력 시 중복확인 창이 뜨도록 구현
- 회원 가입을 위해선 이메일 중복 확인 후 이메일 인증을 받아야 가입 할 수 있게 구현
- 우편API를 통해 주소를 손쉽게 입력할 수 있도록 구현