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
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("userName");
		String phone1 = request.getParameter("phone1");
		String gender = request.getParameter("gender");
		// if(request.getParameter("gender").equals("M")){
		// 	 gender = "남자";
		// } else {			
		//	 gender = "여자";
		// }
		// 아래에서 직접 삼항연산자 사용해도 됨
		String hobby[] = request.getParameterValues("hobby");
		// String hobby = request.getParameter("hobby"); >> 값 1개만 출력됨
		// String + 배열의 경우 getParameterValues 사용해야함.
	%>
	
	<div>아이디 : <%= id %> </div>
	<div>비밀번호 : <%= pwd %></div>
	<div>이름 : <%= name %> </div>
	<div>번호 : <%= phone1 %> </div>
	<div>성별 : <%= gender.equals("M")? "남자" : "여자" %> </div>
	<div>취미 : 
	<%
		for(int i=0; i<hobby.length; i++){
			out.println(hobby[i]);
		}
	%>
	</div>
</body>
</html>