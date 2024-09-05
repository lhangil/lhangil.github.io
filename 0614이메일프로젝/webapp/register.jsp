<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	let isNull = function(obj) {
		if (obj.value == '')
			return true
		return false
	}

	let checkForm = function() {

		let f = document.inputForm

		if (f.email.value == '') {
			alert('이메일을 입력하세요')
			f.email.focus()
			return false
		}
		if (f.id.value == '') {
			alert('아이디를 입력하세요')
			f.id.focus()
			return false
		}
		if (f.password.value == '') {
			alert('비밀번호를 입력하세요')
			f.password.focus()
			return false
		}
		if (f.name.value == '') {
			alert('이름을 입력하세요')
			f.name.focus()
			return false
		}
		if (f.address.value == '') {
			alert('주소를 입력하세요')
			f.address.focus()
			return false
		}
		if (f.phone.value == '') {
			alert('전화번호를 입력하세요')
			f.phone.focus()
			return false
		}

		return true
	}
</script>
</head>
<body>
	<h1>회원가입</h1>
	<form action="/emailproject/registerProcess.jsp" method="post" id="inputForm" name="inputForm">
		<h3>
			이메일: <input type="email" id="email" name="email" required>
		</h3>
		<br>

		<h3>
			아이디: <input type="text" id="id" name="id" required>
		</h3>
		<br>

		<h3>
			비밀번호: <input type="password" id="password" name="password" required>
		</h3>
		<br>

		<h3>
			이름: <input type="text" id="name" name="name" required>
		</h3>
		<br>

		<h3>
			주소: <input type="text" id="address" name="address">
		</h3>
		<br>

		<h3>
			전화번호: <input type="text" id="phone" name="phone">
		</h3>
		<br>
		<h3>
			<input type="submit" value="회원가입">
		</h3>
	</form>

</body>
</html>
