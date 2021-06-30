<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/loginstyle.css" />
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<div class="title">Login Form</div>
		<h1>${message }</h1>
		<form action="login" method="post">
			<div class="field">
				<input type="text" name="username" required> <label>Email Address</label>
			</div>
			<div class="field">
				<input type="password" name="password" required> <label>Password</label>
			</div>
			<div class="content">
				<div class="checkbox">
					<input type="checkbox" name="remember" value="true"> <label
						for="remember-me">Remember me</label>
				</div>
				<div class="pass-link">
					<a href="#">Forgot password?</a>
				</div>
			</div>
			<div class="field">
				<button formaction="dangnhap">Đăng Nhập</button>
			</div>
		</form>
	</div>
</body>
</html>