<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page errorPage="error-view.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% 
		int a = 10;
		int b = 0;
		out.println(a/b);
		// 0으로 나누기 실행 >> 에러 발생
	%>

</body>
</html>