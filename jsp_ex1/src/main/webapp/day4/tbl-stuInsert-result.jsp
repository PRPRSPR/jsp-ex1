<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../db.jsp"%>
	
	<%
		String stuId = request.getParameter("stuId");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String subject = request.getParameter("subject");
		int grade = Integer.parseInt(request.getParameter("grade"));
		
		try{
			
			ResultSet rs = stmt.executeQuery("SELECT * FROM TBL_STULIST WHERE STU_ID = '"+stuId+"'");
			
			if(rs.next()){
				out.println("이미 존재하는 학생입니다");
			} else{
				String query1 = "INSERT INTO TBL_STULIST(STU_ID,STU_NAME,STU_DEPT) "
						+ "VALUES('"+stuId+"', '"+stuName+"', '"+stuDept+"')";
				String query2 = "INSERT INTO TBL_GRADE(STU_ID,SUBJECT,GRADE) "
						+ "VALUES('"+stuId+"', '"+subject+"', '"+grade+"')";
				int result1 = stmt.executeUpdate(query1);
				int result2 = stmt.executeUpdate(query2);
				if(result1 != 0 && result2 != 0){
					out.println("학생 추가 완료");
				} else {				
					out.println("학생 추가 실패");
				}				
			}
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
</body>
</html>