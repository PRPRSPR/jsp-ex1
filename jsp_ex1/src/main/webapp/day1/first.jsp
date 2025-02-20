<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 선언문 -->
	<%! %>
	
	<%!
		// 선언문. 변수, 함수(메소드)
		int number = 10;
		int sum(int x, int y){
			return x+y;
		}
	%>
	
	<!-- 스크립틀릿 -->
	<%  %>
	
	<%
		out.println(number);
		// system 생략 가능
		out.println("<h1>"+number+"</h1>");
		String name = "홍길동";
		// 선언문에서 만든 변수가 아님. 해당 스크립틀릿 안에서만 사용 가능
		// 지역변수
		
		for(int i=1; i<10; i++){
			out.println(i);
		}
	%>
	
	<br>
	
	<!-- 표현식 -->
	<%= %>
	
	<%=
		3 + 5
		// 8이 출력됨
	%>
	
	<div style="color:red;"><%= sum(3,5) %></div>
	
	<!-- 페이지 코드보기 : 보임 -->
	<%-- 페이지 코드보기 : 안보임 --%>
	
	
</body>
</html>