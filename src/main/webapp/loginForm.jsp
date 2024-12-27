<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sonmuseum login</title>
<script src="jquery-3.7.1.js"></script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="header.jsp"></jsp:include>
		<div id="contents">
			<div class="logincon">
				<h2>로그인</h2>
				<div class="logininfo">
					<form action="loginprosecess" method="post">
						<input id="input" type="text" name="userId" required placeholder="아이디"><br>
						<input id="input" type="password" name="userPass" required placeholder="비밀번호"><br>
						<button type="submit" id="button">로그인</button><input id="button" type="button" value="회원가입" onclick="location.href='join.jsp'">
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>