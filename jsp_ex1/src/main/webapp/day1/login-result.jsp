<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		// ("id") >> 값 정확하게 넣어야 함
		String pwd = request.getParameter("pwd");
	
		// 아이디 : test, 비밀번호가 1234 => 로그인 성공
		// 그 외 => 로그인 실패
		
		// 문자열 >> equals 사용
		if(id.equals("test") && pwd.equals("1234")){
			// out.println("로그인 성공");
			response.sendRedirect("main-include.jsp");
			// 로그인 성공 시 "main-include.jsp"로 이동시켜줌
		} else {
			out.println("로그인 실패");
		}
	%>
</body>
</html>