<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="../db.jsp" %>
	
	<%
	
		//1. DB연결
		//2. try~catch()
		//3. statement 객체에서 executeUpdate() 함수 통해 쿼리 호출
		//4. 리턴값이 1 이상이면 삭제완료
		
		String stuNo = request.getParameter("stuNo");
		out.println(stuNo);
				
		try{
			int result = stmt.executeUpdate("DELETE FROM STUDENT WHERE STU_NO = '"+stuNo+"'");
			
			if(result >= 1){
				// == result > 0
				out.println("삭제되었습니다.");
			} else {
				out.println("없는 데이터 입니다.");
			}
		}catch(SQLException e){
			out.println("오류발생");
		}
	%>
	
</body>
</html>