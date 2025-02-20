<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- <div>dddddddddddddddddddddddddd</div> -->
	<!-- <jsp:forward page="main-include.jsp"></jsp:forward> -->
	
	
	
	<jsp:forward page="forward-view.jsp">
		<jsp:param name="userId" value="hong123"></jsp:param>
		<jsp:param name="userAge" value="30"></jsp:param>
	</jsp:forward>
	
	<!-- jsp:param >>파라메터를 보낼 수도 있음 key:value (name과 value값) -->
	
	
	
</body>
</html>