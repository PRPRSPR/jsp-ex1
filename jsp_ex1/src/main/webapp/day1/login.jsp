<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="login-result.jsp" method="get">
		<div>
			아이디 : <input name="id">
		</div>
		<div>
			패스워드 : <input type="password" name="pwd">
		</div>
		<input type="submit" value="로그인">	
	</form>
	
	<!-- form > 새로운 페이지로 넘어가면서 input값을 넘어가기 쉽게해줌 -->
	<!-- <input type="submit" >> 제출버튼 || value값으로 변경됨 -->
	<!-- submin 버튼은 무조건 action 실행함 -->
	<!-- 로그인 버튼 누르면  action="login-result.jsp"으로 이동 -->
	<!-- method="get" >> get방식, post방식 차이 -->
	
	<!-- 로그인 버튼 > 페이지 이동 시 아이디/패스워드 input값도 같이 이동 -->
	<!-- http://localhost:8080/jsp_ex1/day1/login.jsp -->
	<!-- input에 name 주지 않았을 때 ↓ 로그인 -->
	<!-- http://localhost:8080/jsp_ex1/day1/login-result.jsp? -->
	<!-- input에 name 줬을 때 ↓ 로그인 -->
	<!-- http://localhost:8080/jsp_ex1/day1/login-result.jsp?id=&pwd= -->
	<!-- ? id= & pwd= >> ? id = test & pwd = 1234 -->
	<!-- >>> 입력한 값이 같이 이동하는 것을 볼 수 있음 (get 방식) -->
	<!-- post방식에서는 주소에 담아서 보내지 않음. 민감한 정보 전송에 사용 -->
	
</body>
</html>