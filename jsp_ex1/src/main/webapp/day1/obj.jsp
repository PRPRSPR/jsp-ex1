<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ page import="java.util.Date" %>

	<%
		Date date = new Date();
		out.println(date);
		out.println(date.getHours());
		// 시간만 출력
		out.println("<br>");
	%>
	
	<%= new Date() %>

</body>
</html>