<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="../db.jsp" %>
	
	<%
		try{
			String stuNo = request.getParameter("stuNo");
			String stuName = request.getParameter("stuName");
			String stuDept = request.getParameter("stuDept");
			String stuGender = request.getParameter("stuGender");
			
			ResultSet rs = stmt.executeQuery("SELECT * FROM STUDENT WHERE STU_NO = '"+stuNo+"'");
			if(rs.next()){
				out.println("이미 존재하는 학번");
				// return;
				// 메소드를 빠져나가는데 사용하지만 jsp에서는 사용 가능
				// 모든 코드를 메소드에 담아 실행하기 때문
			} else {
				String query = "INSERT INTO STUDENT(STU_NO,STU_NAME,STU_DEPT,STU_GENDER) "+
					"VALUES('"+stuNo+"', '"+stuName+"', '"+stuDept+"', '"+stuGender+"')";
				int result = stmt.executeUpdate(query);
				if(result != 0){
					out.println("등록");
				} else {				
					out.println("등록실패");
				}
			}
			
		}catch(SQLException e) {
			out.println("DB오류");
		}
	%>
	
</body>
</html>