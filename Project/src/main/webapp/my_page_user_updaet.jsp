<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel For All</title>
<link rel="stylesheet" type="text/css" href="./css/my_page.css">
</head>
<body>
	<div>
		<h1>
      	<a id="gotoMain" href="index.jsp">Travel<br/>For All</a>
      	<br/>
      	<br/>
			<a href="my_page.jsp">MY PAGE</a>
		</h1>
	</div>
	<div class="sidebar">
		<ul>
      		<li><a href="my_page_user_data.jsp">회원정보확인</a></li>
			<li><a href="my_page_user_updaet.jsp">회원정보수정</a></li>
			<li><a href="my_page_user_delete.jsp">회원탈퇴</a></li>
			<li><a href="my_page_user_review.jsp">나의 리뷰관리</a></li>
		</ul>
	</div>
	<div id="main-content">
		<div id="frm_editProfile">
			<form action="update_user.jsp" method="post">
				<h2>회원정보수정</h2>
				<label> 닉네임 : <input type="text" id="edit_nickname"
					name="user_nickname">
				</label><br> <label> 이름 : <input type="text" id="edit_name"
					name="user_name">
				</label><br> <label> 핸드폰 번호 : <input type="text" id="edit_tel"
					name="user_tel">
				</label><br> <label> 이메일 : <input type="text" id="edit_email"
					name="user_email">
				</label><br> <label> 주소 : <input type="text" id="edit_address"
					name="user_address">
				</label><br> <label> 비밀번호 : <input type="password" id="edit_pw"
					name="user_pw">
				</label><br>
				<button type="submit">수정하기</button>
			</form>
		</div>
	</div>
	
	<script>
	
	</script>
</body>
</html>