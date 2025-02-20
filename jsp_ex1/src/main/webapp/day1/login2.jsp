<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 유효성 검사 -->
	
	<form name="login" action="login-result.jsp" method="get">
		<div>
			아이디 : <input name="id">
		</div>
		<div>
			패스워드 : <input type="password" name="pwd">
		</div>
		<input type="button" value="로그인" onclick="fnLogin()">	
		<!-- submit 막아놓고 유효성 검사 -->                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
	</form>
	
</body>
</html>
<script>
	function fnLogin() {
		let login = document.login;
		console.log(login);
		console.log(login.id);
		console.log(login.id.value);
		
		// 아무것도 입력 안했을때 console.log(login.id.value == ""); >> true
		
		if(login.id.value == ""){
			alert("아이디를 입력해주세요!");
			login.id.focus();
			// 아이디 input 박스 활성화
			return;
		}
		if(login.pwd.value == ""){
			alert("비밀번호를 입력해주세요!");
			login.pwd.focus();
			return;
		}
		
		login.submit();
		// form 태그의 객체에 적용 가눙.
		// action 실행
	}
</script>