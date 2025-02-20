<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div> 아이디 : <%= request.getParameter("userId") %></div>
	<div> 나이 : <%= request.getParameter("userAge") %></div>
	
	<!-- forward.jsp 에서 실행해야, 값을 받아 출력됨 -->
	
</body>
</html>