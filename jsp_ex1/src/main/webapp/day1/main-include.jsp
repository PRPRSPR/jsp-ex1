<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="header.jsp" %>
	
	<jsp:include page="number.jsp"></jsp:include>
	<!-- 해당 페이지에서 컴파일 후 결과(<%= a+b %>)만 가져옴 -->
	<%@ include file="number.jsp" %>
	<!-- 해당 페이지의 모든 코드를 가져옴 -->
	
	<%= a %>
	<!-- number.jsp 에 있는 변수 -->
	
	<div>메인!</div>
	<%@ include file="footer.jsp" %>
	
</body>
</html>